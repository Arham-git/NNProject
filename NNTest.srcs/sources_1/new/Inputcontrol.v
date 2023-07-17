`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 14:25:53
// Design Name: 
// Module Name: Inputcontrol
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


module Inputcontrol#(parameter len = 4)(
    input [0 : 31] xi [0 : len-1],
    input [0 : 31] weight [0 : len-1 ],
    output [0 : 31] in
    );
    
    reg [0 : 31] xiout;
    reg [0 : 31] xin;
    
    
    assign in = xiout;
    
    
    
    
endmodule
