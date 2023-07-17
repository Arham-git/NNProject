`timescale 1ns/1ps

//`include "FloatMul.v"
//`include "AdditionSubtraction.v"
//`include "PriorityEncoder.v"
//`include "WBRAM.v"
module NNRelu2#( parameter N= 6)(
      input [31:0] xi,
      input [2 : 0] counter,
      input clk,
      input start,
      output reg eoc,
    //   output reg mul_done,
      output [31:0] out
      
    );

     
    reg [31:0] bias;
//    reg [31:0] biasreg;
    wire [31:0] ResAdd;
    wire [31: 0 ] ResMul;
    reg [31:0] AddReg;
    reg [31:0] relu;
    reg [31: 0 ] Acc = 0;
   
    reg [31: 0] weight_mem [N-1 : 0 ];
    wire [31: 0 ] weight;
    
     
    BiasRAM bram(clk , 1'b0, 1'b1 , 32'b00 , 1'b1, bias);

    FloatMul FM(xi , weight, ResMul ) ;
    
    AdditionSubtraction FA(bias,AddReg,1'b0,ResAdd);
    
    //$readmemh("WeightsLayer1.txt" ,weight_mem );
    // to be modified
    RAM ram(clk , 1'b0 , 1'b1 ,counter , weight_mem[counter] , weight );
    
    
    always@(posedge clk)  begin 
        bias <= bias;
        if(start)  begin 
        AddReg <= ResMul;
        Acc <= ResAdd;
        bias <= Acc;
        if(counter > N )
            begin 
               if( !ResAdd[31] ) 
               begin 
               relu <= ResAdd;
               eoc <= 1'b1;
               end
        else begin  
          relu <= 0;  
          eoc = 1'b1;
        end  
        end
      end
    end
    assign out = relu;
endmodule
