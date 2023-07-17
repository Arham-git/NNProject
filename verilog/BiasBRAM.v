`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////



module BiasRAM(clk, we, en, addr, di, dout);
input clk;
input we;
input en;
input [3:0] addr;
input [31:0] di;
output [31:0] dout;


reg [31:0] RAM [74000:0];

reg [31:0] dout;
always @(posedge clk) begin
     if (en) begin
     if (we)
       RAM[addr] <= di;
     else
       dout <= RAM[addr];
     end

end
endmodule