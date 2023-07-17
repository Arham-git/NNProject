`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////



module RAM(clk, we, en, addr, di, dout);
input clk;
input we;
input en;
input [13:0] addr;
input [31:0] di;
output [31:0] dout;


reg [0: 31] ram [10: 12287];

initial begin
$readmemh( "weight1.mem" , ram );
end

reg [31 : 0 ] dout;

always @(posedge clk) begin
     if (en) begin
     if (we)
       ram[addr] <= di;
     else
       dout <= ram[addr];
     end

end
endmodule