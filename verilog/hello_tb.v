`timescale 1ns/1ns
`include "hello.v"

module hello_tb;
reg a[4:0];
reg b[4:0];

hello uut(a,b,c);

initial 
begin 
     $dumpfile("hello_tb.vcd");
     $dumpvars(0, hello_tb);

     begin
            
          a <= 5'b00010; b <= 5'b10100;
          
          #5  
          a <= 5'b00001; b <= 5'b00000;
          
          #10  
          a <= 5'b01111; b <= 5'b11100;

          #5
          $display("test complete");
     end
end

endmodule
