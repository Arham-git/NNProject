`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2023 12:39:29
// Design Name: 
// Module Name: NNRelu1
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
`include "FloatMul.v"
`include "AdditionSubtraction.v"
`include "PriorityEncoder.v"
`include "WBRAM.v"
`include "BiasBRAM.v"
module NNRelu1#( parameter N= 12288)(
      input [31:0] xi,
      input [13 : 0] counter,
      input clk,
      output reg eoc,
    //   output reg mul_done,
      output [31:0] out
      
    );

    
    wire [31:0] bias; 
    wire [31:0] ResAdd;
    wire [31: 0 ] ResMul;
    reg [31:0] AddReg;
    reg [31:0] relu;
    reg [31: 0 ] Acc = 0;
    reg [31:0 ] biasreg;
    reg [31: 0] weight_mem [N-1 : 0 ];
    wire [31: 0 ] weight;
    
    BiasRAM bram (clk , 1'b0, 1'b1 , 4'b0000 , 32'b1, bias);
    
    FloatMul FM  (xi , weight, ResMul ) ;
    
    AdditionSubtraction FA (bias,AddReg,1'b0,ResAdd);
    
    //$readmemh("WeightsLayer1.txt" ,weight_mem );
    // to be modified 
    
    RAM ram(clk , 1'b0 , 1'b1 ,counter , weight_mem[counter] , weight );
    
    always@(posedge clk)  begin 
        AddReg <= ResMul;
        Acc <= ResAdd;
        biasreg <= Acc;
        if(counter > N) 
            begin 
              if( !ResAdd[31] ) 
               begin 
               relu <= ResAdd;
               eoc <= 1'b1; end
        else begin 
          relu <= 0;  
          eoc = 1'b1; end
    end
    end
    assign out = relu;
endmodule
