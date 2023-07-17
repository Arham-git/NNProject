`timescale 1ns/1ns
`include "lut.v"

module lut_tb;

reg [7:0] in;
wire [31:0] out;

IEEE754LookupTable dut(in,out);

initial 
begin
     $dumpfile("lut_tb.vcd");
     $dumpvars(0, lut_tb); 
begin 
     in = 8'h01;
     #5 in = 8'h10;
     #5 in = 8'h03;
     #5
     $display("test complete");
end
end 
endmodule