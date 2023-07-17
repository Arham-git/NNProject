`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 22:36:08
// Design Name: 
// Module Name: IEEE754LUT
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



module IEEE754LUT(
    input [7:0] data_in ,
    output reg[31:0] data_out 
);

reg [0:7] data;

always @(*) 
begin
    data  <= data_in;
    case(data)
        8'h00: data_out = 32'h0;
        8'h01: data_out = 32'h3f800000;
        8'h02: data_out = 32'h40000000;
        8'h03: data_out = 32'h40400000;
        8'h04: data_out = 32'h40800000;
        8'h05: data_out = 32'h40a00000;
        8'h06: data_out = 32'h40c00000;
        8'h07: data_out = 32'h40e00000;
        8'h08: data_out = 32'h41000000;
        8'h09: data_out = 32'h41100000;
        8'h0a: data_out = 32'h41200000;
        8'h0b: data_out = 32'h41300000;
        8'h0c: data_out = 32'h41400000;
        8'h0d: data_out = 32'h41500000;
        8'h0e: data_out = 32'h41600000;
        8'h0f: data_out = 32'h41700000;
        8'h10: data_out = 32'h41800000;
        8'h11: data_out = 32'h41880000;
        8'h12: data_out = 32'h41900000;
        8'h13: data_out = 32'h41980000;
        8'h14: data_out = 32'h41a00000;
        8'h15: data_out = 32'h41a80000;
        8'h16: data_out = 32'h41b00000;
        8'h17: data_out = 32'h41b80000;
        8'h18: data_out = 32'h41c00000;
        8'h19: data_out = 32'h41c80000;
        8'h1a: data_out = 32'h41d00000;
        8'h1b: data_out = 32'h41d80000;
        8'h1c: data_out = 32'h41e00000;
        8'h1d: data_out = 32'h41e80000;
        8'h1e: data_out = 32'h41f00000;
        8'h1f: data_out = 32'h41f80000;
        8'h20: data_out = 32'h42000000;
        8'h21: data_out = 32'h42040000;
        8'h22: data_out = 32'h42080000;
        8'h23: data_out = 32'h420c0000;
        8'h24: data_out = 32'h42100000;
        8'h25: data_out = 32'h42140000;
        8'h26: data_out = 32'h42180000;
        8'h27: data_out = 32'h421c0000;
        8'h28: data_out = 32'h42200000;
        8'h29: data_out = 32'h42240000;
        8'h2a: data_out = 32'h42280000;
        8'h2b: data_out = 32'h422c0000;
        8'h2c: data_out = 32'h42300000;
        8'h2d: data_out = 32'h42340000;
        8'h2e: data_out = 32'h42380000;
        8'h2f: data_out = 32'h423c0000; 
        8'h30: data_out = 32'h42400000;
        8'h31: data_out = 32'h42440000;
        8'h32: data_out = 32'h42480000;
        8'h33: data_out = 32'h424c0000;
        8'h34: data_out = 32'h42500000;
        8'h35: data_out = 32'h42540000;
        8'h36: data_out = 32'h42580000;
        8'h37: data_out = 32'h425c0000;
        8'h38: data_out = 32'h42600000;
        8'h39: data_out = 32'h42640000;
        8'h3a: data_out = 32'h42680000;
        8'h3b: data_out = 32'h426c0000;
        8'h3c: data_out = 32'h42700000;
        8'h3d: data_out = 32'h42740000;
        8'h3e: data_out = 32'h42780000;
        8'h3f: data_out = 32'h427c0000;
        8'h40: data_out = 32'h42800000;
        8'h41: data_out = 32'h42820000;
        8'h42: data_out = 32'h42840000;
        8'h43: data_out = 32'h42860000;
        8'h44: data_out = 32'h42880000;
        8'h45: data_out = 32'h428a0000;
        8'h46: data_out = 32'h428c0000;
        8'h47: data_out = 32'h428e0000;
        8'h48: data_out = 32'h42900000;
        8'h49: data_out = 32'h42920000;
        8'h4a: data_out = 32'h42940000;
        8'h4b: data_out = 32'h42960000;
        8'h4c: data_out = 32'h42980000;
        8'h4d: data_out = 32'h429a0000;
        8'h4e: data_out = 32'h429c0000;
        8'h4f: data_out = 32'h429e0000;
        8'h50: data_out = 32'h42a00000;
        8'h51: data_out = 32'h42a20000;
        8'h52: data_out = 32'h42a40000;
        8'h53: data_out = 32'h42a60000;
        8'h54: data_out = 32'h42a80000;
        8'h55: data_out = 32'h42aa0000;
        8'h56: data_out = 32'h42ac0000;
        8'h57: data_out = 32'h42ae0000;
        8'h58: data_out = 32'h42b00000;
        8'h59: data_out = 32'h42b20000;
        8'h5a: data_out = 32'h42b40000;
        8'h5b: data_out = 32'h42b60000;
        8'h5c: data_out = 32'h42b80000;
        8'h5d: data_out = 32'h42ba0000;
        8'h5e: data_out = 32'h42bc0000;
        8'h5f: data_out = 32'h42be0000;
        8'h60: data_out = 32'h42c00000;
        8'h61: data_out = 32'h42c20000;
        8'h62: data_out = 32'h42c40000;
        8'h63: data_out = 32'h42c60000;
        8'h64: data_out = 32'h42c80000;
        8'h65: data_out = 32'h42ca0000;
        8'h66: data_out = 32'h42cc0000;
        8'h67: data_out = 32'h42ce0000;
        8'h68: data_out = 32'h42d00000;
        8'h69: data_out = 32'h42d20000;
        8'h6a: data_out = 32'h42d40000;
        8'h6b: data_out = 32'h42d60000;
        8'h6c: data_out = 32'h42d80000;
        8'h6d: data_out = 32'h42da0000;
        8'h6e: data_out = 32'h42dc0000;
        8'h6f: data_out = 32'h42de0000;
        8'h70: data_out = 32'h42e00000;
        8'h71: data_out = 32'h42e20000;
        8'h72: data_out = 32'h42e40000;
        8'h73: data_out = 32'h42e60000;
        8'h74: data_out = 32'h42e80000;
        8'h75: data_out = 32'h42ea0000;
        8'h76: data_out = 32'h42ec0000;
        8'h77: data_out = 32'h42ee0000;
        8'h78: data_out = 32'h42f00000;
        8'h79: data_out = 32'h42f20000;
        8'h7a: data_out = 32'h42f40000;
        8'h7b: data_out = 32'h42f60000;
        8'h7c: data_out = 32'h42f80000;
        8'h7d: data_out = 32'h42fa0000;
        8'h7e: data_out = 32'h42fc0000;
        8'h7f: data_out = 32'h42fe0000;
        8'h80: data_out = 32'h43000000;
        8'h81: data_out = 32'h43010000;
        8'h82: data_out = 32'h43020000;
        8'h83: data_out = 32'h43030000;
        8'h84: data_out = 32'h43040000;
        8'h85: data_out = 32'h43050000;
        8'h86: data_out = 32'h43060000;
        8'h87: data_out = 32'h43070000;
        8'h88: data_out = 32'h43080000;
        8'h89: data_out = 32'h43090000;
        8'h8a: data_out = 32'h430a0000;
        8'h8b: data_out = 32'h430b0000;
        8'h8c: data_out = 32'h430c0000;
        8'h8d: data_out = 32'h430d0000;
        8'h8e: data_out = 32'h430e0000;
        8'h8f: data_out = 32'h430f0000;
        8'h90: data_out = 32'h43100000;
        8'h91: data_out = 32'h43110000;
        8'h92: data_out = 32'h43120000;
        8'h93: data_out = 32'h43130000;
        8'h94: data_out = 32'h43140000;
        8'h95: data_out = 32'h43150000;
        8'h96: data_out = 32'h43160000;
        8'h97: data_out = 32'h43170000;
        8'h98: data_out = 32'h43180000;
        8'h99: data_out = 32'h43190000;
        8'h9a: data_out = 32'h431a0000;
        8'h9b: data_out = 32'h431b0000;
        8'h9c: data_out = 32'h431c0000;
        8'h9d: data_out = 32'h431d0000;
        8'h9e: data_out = 32'h431e0000;
        8'h9f: data_out = 32'h431f0000;
        8'ha0: data_out = 32'h43200000;
        8'ha1: data_out = 32'h43210000;
        8'ha2: data_out = 32'h43220000;
        8'ha3: data_out = 32'h43230000;
        8'ha4: data_out = 32'h43240000;
        8'ha5: data_out = 32'h43250000;
        8'ha6: data_out = 32'h43260000;
        8'ha7: data_out = 32'h43270000;
        8'ha8: data_out = 32'h43280000;
        8'ha9: data_out = 32'h43290000;
        8'haa: data_out = 32'h432a0000;
        8'hab: data_out = 32'h432b0000;
        8'hac: data_out = 32'h432c0000;
        8'had: data_out = 32'h432d0000;
        8'hae: data_out = 32'h432e0000;
        8'haf: data_out = 32'h432f0000;
        8'hb0: data_out = 32'h43300000;
        8'hb1: data_out = 32'h43310000;
        8'hb2: data_out = 32'h43320000;
        8'hb3: data_out = 32'h43330000;
        8'hb4: data_out = 32'h43340000;
        8'hb5: data_out = 32'h43350000;
        8'hb6: data_out = 32'h43360000;
        8'hb7: data_out = 32'h43370000;
        8'hb8: data_out = 32'h43380000;
        8'hb9: data_out = 32'h43390000;
        8'hba: data_out = 32'h433a0000;
        8'hbb: data_out = 32'h433b0000;
        8'hbc: data_out = 32'h433c0000;
        8'hbd: data_out = 32'h433d0000;
        8'hbe: data_out = 32'h433e0000;
        8'hbf: data_out = 32'h433f0000;
        8'hc0: data_out = 32'h43400000;
        8'hc1: data_out = 32'h43410000;
        8'hc2: data_out = 32'h43420000;
        8'hc3: data_out = 32'h43430000;
        8'hc4: data_out = 32'h43440000;
        8'hc5: data_out = 32'h43450000;
        8'hc6: data_out = 32'h43460000;
        8'hc7: data_out = 32'h43470000;
        8'hc8: data_out = 32'h43480000;
        8'hc9: data_out = 32'h43490000;
        8'hca: data_out = 32'h434a0000;
        8'hcb: data_out = 32'h434b0000;
        8'hcc: data_out = 32'h434c0000;
        8'hcd: data_out = 32'h434d0000;
        8'hce: data_out = 32'h434e0000;
        8'hcf: data_out = 32'h434f0000;
        8'hd0: data_out = 32'h43500000;
        8'hd1: data_out = 32'h43510000;
        8'hd2: data_out = 32'h43520000;
        8'hd3: data_out = 32'h43530000;
        8'hd4: data_out = 32'h43540000;
        8'hd5: data_out = 32'h43550000;
        8'hd6: data_out = 32'h43560000;
        8'hd7: data_out = 32'h43570000;
        8'hd8: data_out = 32'h43580000;
        8'hd9: data_out = 32'h43590000;
        8'hda: data_out = 32'h435a0000;
        8'hdb: data_out = 32'h435b0000;
        8'hdc: data_out = 32'h435c0000;
        8'hdd: data_out = 32'h435d0000;
        8'hde: data_out = 32'h435e0000;
        8'hdf: data_out = 32'h435f0000;
        8'he0: data_out = 32'h43600000;
        8'he1: data_out = 32'h43610000;
        8'he2: data_out = 32'h43620000;
        8'he3: data_out = 32'h43630000;
        8'he4: data_out = 32'h43640000;
        8'he5: data_out = 32'h43650000;
        8'he6: data_out = 32'h43660000;
        8'he7: data_out = 32'h43670000;
        8'he8: data_out = 32'h43680000;
        8'he9: data_out = 32'h43690000;
        8'hea: data_out = 32'h436a0000;
        8'heb: data_out = 32'h436b0000;
        8'hec: data_out = 32'h436c0000;
        8'hed: data_out = 32'h436d0000;
        8'hee: data_out = 32'h436e0000;
        8'hef: data_out = 32'h436f0000;
        8'hf0: data_out = 32'h43700000;
        8'hf1: data_out = 32'h43710000;
        8'hf2: data_out = 32'h43720000;
        8'hf3: data_out = 32'h43730000;
        8'hf4: data_out = 32'h43740000;
        8'hf5: data_out = 32'h43750000;
        8'hf6: data_out = 32'h43760000;
        8'hf7: data_out = 32'h43770000;
        8'hf8: data_out = 32'h43780000;
        8'hf9: data_out = 32'h43790000;
        8'hfa: data_out = 32'h437a0000;
        8'hfb: data_out = 32'h437b0000;
        8'hfc: data_out = 32'h437c0000;
        8'hfd: data_out = 32'h437d0000;
        8'hfe: data_out = 32'h437e0000;
        8'hff: data_out = 32'h437f0000;
    endcase
    
end

endmodule
