`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2023 19:51:26
// Design Name: 
// Module Name: InputController
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
//`include "Lut.v"

module InputController(
input [7 : 0] image,
input clk,
output reg [31 : 0] Xi,
output [13 : 0] Counter
    );
   
    reg  [13 : 0] Count;
    // reg [31:0] Bram [12287:0];
    wire [31: 0] xi32; 

    IEEE754LookupTable tabl(image , xi32 );
    
    //readmemh("Image.txt" , Bram )

    always @(posedge clk) begin 
        Count <= Count+1;
        Xi <= image;
    end
    assign Counter = Count;
    
endmodule
