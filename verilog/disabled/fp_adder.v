
module fp_adder#(parameter N=32)(
     input [N-1:0] a,
     input [N-1:0] b,
     output [N-1:0] c
);

reg [23:0] a_man;
reg [23:0] b_man;
reg [7:0] a_exp;
reg [7:0] b_exp;
reg [7:0] res_exp;
reg [23:0] res_man;
reg sign=0;


always@(a or b) begin
     a_man <=  a[22:0];
     b_man <=  b[22:0];
     a_exp <= a[30:23];
     b_exp <= b[30:23];

     a_man[23] = 1'b1;
     b_man[23] = 1'b1;

     if(a_exp>b_exp ) begin   
          b_man <= (a_exp-b_exp); 
          res_exp=a_exp; end
     
     else if(a_exp > b_exp ) begin  
          b_man>>(a_exp-b_exp); 
          res_exp = b_exp; end
     
     
     if(a[31]==1'b1)  
       res_man = b_man - a_man; 

     else if(b[31]==1'b1) 
       res_man = a_man - b_man;
     
     else res_man = a_man[22:0] + b_man[22:0];
     
     
     res_sign = res_man[23];
     
     reg [23:0] res_man_temp = res_man;
     if(res_sign) 
          twocomp(res_ma_temp,res_man)
     
     
     c <= {res_sign ,res_exp , res_man};

     //FullrippleAdd(a_man,b_man,c);
     end
endmodule

