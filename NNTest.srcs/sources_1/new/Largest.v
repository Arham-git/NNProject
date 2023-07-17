`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2023 16:44:25
// Design Name: 
// Module Name: Largest
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


module Largest (
    input [31:0] num1,
    input [31:0] num2,
    input [31:0] num3,
    output reg [1:0] out
);

always @(*) begin
    if (num1 > num2 && num1 > num3)
        out = 2'b00;
    else if (num2 > num1 && num2 > num3)
        out = 2'b01;
    else if (num3 > num1 && num3 > num2)
        out = 2'b10;
    else
        out = 2'b00; // If all numbers are equal, default to "00"
end

endmodule
