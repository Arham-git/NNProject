`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 21:09:30
// Design Name: 
// Module Name: Neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Neuron#(parameter len = 2)(
    input [0 : 31] xi [0: len-1 ],
    input [31 : 0] weight [0 : len -1 ],
    input [0 : 31] bias,
    input start,
    input clk,
    output [31 : 0 ] res
    );
    
    genvar i;
    
//    reg count = 0;
    reg [31 : 0] xireg [0 : len-1];
    reg [31 : 0] weightreg [0 : len-1];
//    reg [31 : 0] xioutreg [0 : len-1];
    
    wire [31:0] addout [0 : len-1];
    wire [31:0] mulout [0 : len-1];
        
     
//    reg bias = 32'h3f800000;
    
//    reg [0 : 7] tempxi;
//    reg [0 : 31] tempxiout;
     
//
    
    always@(posedge clk) begin 
       if(start) begin 
       
       xireg <= xi;     
       weightreg <= weight;
       
       end 
end   
    
   FP_Mul FM1(xireg[0] ,  weightreg[0] , mulout[0] );
   FP_Add FA1(mulout[0] ,  bias ,   addout[0] );
  
   generate 
   
   for(i=1 ; i < len ; i = i+1 )    begin 
   FP_Mul FM(xireg[i] ,  weightreg[i] , mulout[i] );
   FP_Add FA(mulout[i]   ,  addout[i-1]  , addout[i] );
    end
   
   endgenerate
   
   assign res = addout[len-1][31]? addout[len-1] : 32'd0;
    
endmodule
