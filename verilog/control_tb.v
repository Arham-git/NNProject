`timescale 1ns/1ns
`include "InputController.v"


module control_tb;
reg [7:0] image;
reg [31:0] b,c;
reg clk;


wire [31:0] c;


InputController uut(image,clk,b,c);

initial 
begin 
     $dumpfile("control_tb.vcd");
     $dumpvars(0,control_tb);
     forever #5     clk = ~clk;
     
     


end

endmodule