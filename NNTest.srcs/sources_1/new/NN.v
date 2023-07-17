`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 18:10:34
// Design Name: 
// Module Name: NN
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


module NN#(parameter no = 2,parameter len = 2)(
//    input [0 : 7] xi [0: len-1 ],
//    input [0 : 31] weight [0 : len -1 ],
    input clk,
    input start,
    output [0:1] s
    );
    
    
    //outputs
    wire [0 : 31] out1; 
    wire [0 : 31] out2;
    wire [0 : 31] out3; 
    
    
    //INput 
    wire [0 : 31] xi [0: len-1];
    assign xi[0] = 8'hff;
    assign xi[1] = 8'h1f;
    
    wire [0 : 31] x1;
    wire [0 : 31] x2;
    
    //LUT
    IEEE754LUT  lut(xi[0] , x1);
    IEEE754LUT lut2(xi[1] , x2); 
      
    wire bias2 = 32'h437f0000;  
    wire bias1 = 32'h3f800000;
    
    
    wire [0:31] x [0 : len-1];
    assign x[0] = x1;
    assign x[1] = x2;
    
    //Weights ;
    wire [0 : 31] weight [0 : len-1];
    assign weight[0] = 32'hbca528d3; //255
    assign weight[1] = 32'h3c5a9cc3;  //47
    
    //Neurons 
    
    Neuron N1(x , weight , bias1 , start  , clk , out1 );
    Neuron N2(x , weight , bias2 , start , clk , out2 );
    Neuron N3(x , weight , bias2 , start ,clk , out3  );
    
//    reg resout1 = out1;
//    reg resout2 = out2;
//    reg resout3 = out3;
    Largest L1(out1 , out2 , out3 , s); 
    
    
endmodule
