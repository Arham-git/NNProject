`timescale 1ns / 1ps
module FloatingAddition 
                        (input [31:0]A,
                         input [31:0]B,
                        //  input clk,
                        //  output overflow,
                        //  output underflow,
                        //  output exception,
                         output reg  [31:0] result);

reg [23:0] A_Mantissa,B_Mantissa;
reg [23:0] Temp_Mantissa;
reg [22:0] Mantissa;
reg [7:0] exp;
reg Sign;
wire MSB;
reg [7:0] A_exp,B_exp,Temp_exp,diff_exp;
reg A_sign,B_sign,Temp_sign;
reg [32:0] Temp;
reg carry;
reg [2:0] one_hot;
reg comp;
reg [7:0] exp_adjust;

always @(*)
begin

comp =  (A[30:23] >= B[30:23])? 1'b1 : 1'b0;
  
A_Mantissa = comp ? {1'b1,A[22:0]} : {1'b1,B[22:0]};
A_exp = comp ? A[30:23] : B[30:23];
A_sign = comp ? A[31] : B[31];
  
B_Mantissa = comp ? {1'b1,B[22:0]} : {1'b1,A[22:0]};
B_exp = comp ? B[30:23] : A[30:23];
B_sign = comp ? B[31] : A[31];


diff_exp = A_exp-B_exp;
B_Mantissa = (B_Mantissa >> diff_exp);


{carry,Temp_Mantissa} =  (A_sign ~^ B_sign)? A_Mantissa + B_Mantissa : A_Mantissa-B_Mantissa ; 

exp_adjust = A_exp;


if(carry)
    begin
        Temp_Mantissa = Temp_Mantissa>>1;
        exp_adjust = exp_adjust+1'b1;
    end
else
    begin
    while(!Temp_Mantissa[23])
        begin
           Temp_Mantissa = Temp_Mantissa<<1;
           exp_adjust =  exp_adjust-1'b1;
        end
    end


Sign = A_sign;
Mantissa = Temp_Mantissa[22:0];
exp = exp_adjust;
result = {Sign,exp,Mantissa};
//Temp_Mantissa = (A_sign ~^ B_sign) ? (carry ? Temp_Mantissa>>1 : Temp_Mantissa) : (0); 
//Temp_exp = carry ? A_exp + 1'b1 : A_exp; 
//Temp_sign = A_sign;
//result = {Temp_sign,Temp_exp,Temp_Mantissa[22:0]};
end
endmodule