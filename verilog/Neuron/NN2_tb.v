`timescale 1ps/1ns
`include "NNrelu2.v"

module NN2_tb;


reg [31 :0 ] a [0: 5];
reg [31 : 0 ] weight [0:5] ; 

wire [31 : 0] c;
 
NNrelu2 uut(a , b, c);

initial begin 
     $dumpfile("NN2_tb.vcd");
     $dumpvars(0,NN2_tb); 
     integer i;
     for( i= 0 ; i < 6; i=i+1)
     begin 
         
     end
     




end




endmodule