
module FP_Add(

input [31:0] a,b, //Inputs in the format of IEEE-754 Representation.
//If Add_Sub is low then Addition else Subtraction.
// output Exception,
output [31:0] result //Outputs in the format of IEEE-754 Representation.
);

wire op_addBar;
wire Comp_enable;
wire output_sign;

wire [23:0] mantissa_sub_complement;
wire [24:0] mantissa_sub;
wire [30:0] sub_diff;
wire [24:0] subtraction_diff; 
wire [7:0] exponent_sub;

wire [31:0] operand_a,operand_b;
wire [23:0] mantissa_a,mantissa_b;
wire [7:0] exponent_diff;


wire [23:0] mantissa_b_add_sub;
wire [7:0] exponent_b_add_sub;

wire [24:0] mantissa_add;
wire [30:0] add_sum;

wire [0 : 7 ] exp_a;
wire [0 : 7 ] exp_b;
 
wire comp_enable;
wire perform;

//for operations always operand_a must be greater than b
assign {comp_enable,operand_a,operand_b} = (a[30:0] < b[30:0]) ? {1'b1,b,a} : {1'b0,a,b};

assign exp_a = operand_a[30:23];
assign exp_b = operand_b[30:23];

assign output_sign =  operand_a[31];
assign op_addBar = ~(operand_a[31] ^ operand_b[31]);

assign mantissa_a = (|operand_a[30:23]) ? {1'b1,operand_a[22:0]} : {1'b0,operand_a[22:0]};
assign mantissa_b = (|operand_b[30:23]) ? {1'b1,operand_b[22:0]} : {1'b0,operand_b[22:0]};

//Evaluating Exponent Difference
assign exponent_diff = operand_a[30:23] - operand_b[30:23];

//Shifting mantissa_b according to exponent_diff

assign mantissa_b_add_sub = mantissa_b >> exponent_diff;

assign exponent_b_add_sub = operand_b[30:23] + exponent_diff; 

//Checking exponents are same or not
assign perform = (operand_a[30:23] == exponent_b_add_sub);

///////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------ADD BLOCK------------------------------------------//

assign mantissa_add = (perform & op_addBar) ? (mantissa_a + mantissa_b_add_sub) : 25'd0; 

//Result will be equal to Most 23 bits if carry generates else it will be Least 22 bits.

assign add_sum[22:0] = mantissa_add[24] ? mantissa_add[23:1] : mantissa_add[22:0];

//If carry generates in sum value then exponent must be added with 1 else feed as it is.

assign add_sum[30:23] = mantissa_add[24] ? (1'b1 + operand_a[30:23]) : operand_a[30:23];

///////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------SUB BLOCK------------------------------------------//

assign mantissa_sub_complement = (perform & !op_addBar) ? ~(mantissa_b_add_sub) + 24'd1 : 24'd0 ; 

assign mantissa_sub = perform ? (mantissa_a + mantissa_sub_complement) : 25'd0;

priority_encoder pe(mantissa_sub,operand_a[30:23],subtraction_diff,exponent_sub);

assign sub_diff[30:23] = exponent_sub;

assign sub_diff[22:0] = subtraction_diff[22:0];

//////////////////////////////////////////////////////////////////////////////////////////////////////

assign result =  ((!op_addBar) ? {output_sign,sub_diff} : {output_sign,add_sum});

endmodule