`timescale 1ns/1ns
`include "AdditionSubtraction.v"
`include "PriorityEncoder.v"

module FloatAS_tb;
reg [31:0] a;
reg [31:0] b;
reg sbar;


wire [31:0] c;


AdditionSubtraction uut(a,b,sbar,c);


initial begin 
     $dumpfile("FloatAS_tb.vcd");
     $dumpvars(0,FloatAS_tb); 

     a = 32'h3f800000; b = 32'h3f800000; sbar =0;
     #5;

      a = 32'h40000000; b = 32'h41000000; sbar =0 ;
     #5; 

     b = 32'h3f800000; a = 32'b10111111100000000000000100000000; sbar = 0;
     #5;
     a = 32'hb5829807;   b = 32'hb2b4637d;
     #5
     $display("test-complete");

end

endmodule

