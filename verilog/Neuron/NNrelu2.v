

module NNrelu2(
    input  [31: 0] a [0: 5],
    input  [31:0] weight [5 : 0],
    output [31:0] res 
    );
    
    genvar j;
   
                
    
    wire [31:0] mul_out [0 : 5];    
    wire [31:0] add_out [0 : 5];    
    reg [31:0] bias = 32'h3b7d1111;
    
    
    FloatMul FM(weight[0], a[0], mul_out[0]);
    AdditionSubtraction FA( mul_out[0] , bias , 1'b0, add_out[0] );
    
    generate
    for(j = 1; j< 6 ; j=j+1)
     begin
        FloatMul FM(weight[j], a[j], mul_out[j]);
        AdditionSubtraction FA(add_out[j-1],mul_out[j], 1'b0, add_out[j] ); 
     end
    endgenerate
    
    
    
    assign res = (add[5][31])? 32'd0 : add_out[5];
 
endmodule