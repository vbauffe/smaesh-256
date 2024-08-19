// SPDX-FileCopyrightText: SIMPLE-Crypto Contributors <info@simple-crypto.dev>
// SPDX-License-Identifier: CERN-OHL-S-2.0
// Copyright SIMPLE-Crypto Contributors.
// This source describes Open Hardware and is licensed under the CERN-OHL-S v2.
// You may redistribute and modify this source and make products using it under
// the terms of the CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt ).
// This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING
// OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE.
// Please see the CERN-OHL-S v2 for applicable conditions.
// Source location: https://github.com/simple-crypto/SMAesH
// As per CERN-OHL-S v2 section 4, should You produce hardware based
// on this source, You must where practicable maintain the Source Location
// visible on the external case of any product you make using this source.

(* fv_prop = "PINI", fv_strat = "flatten", fv_order=d *)
module MSKaes_32bits_state_datapath
#
(
    parameter d=2
)
(
    // Global
    clk,
    enable,
    // Routing control
    init,
    en_MC,
    en_loop,
    en_inverse,
    in_AKfinal,
    // Data
    sh_plaintext,
    sh_4bytes_from_key,
    sh_4bytes_from_SB,
    sh_4bytes_to_SB,
    sh_ciphertext
);

// IOs
input clk;
input enable;

input init;
input en_MC;
input en_loop;
input en_inverse;

input in_AKfinal;

input [128*d-1:0] sh_plaintext;
input [32*d-1:0] sh_4bytes_from_key;
input [32*d-1:0] sh_4bytes_from_SB;
output [32*d-1:0] sh_4bytes_to_SB;
output [128*d-1:0] sh_ciphertext;


// Byte matrix representation of the input plaintext
wire [8*d-1:0] sh_m_plain[15:0];
genvar i;
generate
for(i=0;i<16;i=i+1) begin: byte_pt
    assign sh_m_plain[i] = sh_plaintext[8*d*i +: 8*d];
end
endgenerate

// Mixcolumns combinatorial logic bloc dealing with the 32 shared bits 
// coming from the Sbox
(* verime = "b32_fromMC" *)
wire [32*d-1:0] sh_4bytes_from_MC;
// Mixcolumn unit
MSKaesMC #(.d(d))
MC_unit(
    .a0(sh_4bytes_from_SB[0 +: 8*d]),
    .a1(sh_4bytes_from_SB[8*d +: 8*d]),
    .a2(sh_4bytes_from_SB[16*d +: 8*d]),
    .a3(sh_4bytes_from_SB[24*d +: 8*d]),
    .b0(sh_4bytes_from_MC[0 +: 8*d]),
    .b1(sh_4bytes_from_MC[8*d +: 8*d]),
    .b2(sh_4bytes_from_MC[16*d +: 8*d]),
    .b3(sh_4bytes_from_MC[24*d +: 8*d])
);

// Send to MC at output of reg 0, 1, 2, 3
(* verime = "b32_fromiMC" *)
wire [32*d-1:0] i_sh_4bytes_from_MC;
MSKaesMCinv #(.d(d))
inv_MC_unit(
    .b0(i_sh_added_rkey[0]),
    .b1(i_sh_added_rkey[1]),
    .b2(i_sh_added_rkey[2]),
    .b3(i_sh_added_rkey[3]),
    .a0(i_sh_4bytes_from_MC[0 +: 8*d]),
    .a1(i_sh_4bytes_from_MC[8*d +: 8*d]),
    .a2(i_sh_4bytes_from_MC[16*d +: 8*d]),
    .a3(i_sh_4bytes_from_MC[24*d +: 8*d])
);


// Generate the state register + input output signals    
wire [8*d-1:0] sh_reg_in [15:0];
wire [8*d-1:0] sh_reg_out [15:0];
wire [15:0] en_pipe;

generate
for(i=0;i<16;i=i+1) begin: scanff_state  
    MSKscanReg #(.d(d),.count(8))
    sff_byte(
        .clk(clk),
        .en(en_pipe[i]),
        .scan_en(!init),
        .in_d(sh_m_plain[i]),
        .in_scan(sh_reg_in[i]),
        .out_q(sh_reg_out[i])
    );
end
endgenerate 

wire [8*d-1:0] sh_added_rkey [3:0];
wire [8*d-1:0] i_sh_added_rkey [3:0];

// Assign the routing for the first row
assign sh_reg_in[0] = sh_reg_out[4];
assign sh_reg_in[4] = sh_reg_out[8];
assign sh_reg_in[8] = sh_reg_out[12];

wire [8*d-1:0] sh_mux_r03_1;
MSKmux #(.d(d),.count(8))
muxr03_2(
    .sel(en_MC & ~en_inverse),
    .in_true(sh_4bytes_from_MC[0 +: 8*d]),
    .in_false(sh_4bytes_from_SB[0 +: 8*d]),
    .out(sh_mux_r03_1)
);

MSKxor #(.d(d),.count(8))
xor00(
    .ina(sh_reg_out[0]),
    .inb(sh_4bytes_from_key[0 +: 8*d]),
    .out(sh_added_rkey[0])
);
assign i_sh_added_rkey[0] = sh_added_rkey[0];

MSKmux #(.d(d),.count(8))
muxr03_1(
    .sel(en_loop),
    .in_true(sh_added_rkey[0]),
    .in_false(sh_mux_r03_1),
    .out(sh_reg_in[12])
);

// Assign the routing for the second row
MSKxor #(.d(d),.count(8))
xor11(
    .ina(sh_reg_out[5]),
    .inb(sh_4bytes_from_key[8*d +: 8*d]),
    .out(sh_added_rkey[1])
);
wire [8*d-1:0] sh_mux_r13_20;
MSKmux #(.d(d),.count(8))
muxr13_20(
    .sel(en_inverse),
    .in_true(sh_reg_out[5]),
    .in_false(sh_added_rkey[1]),
    .out(sh_mux_r13_20)
);
wire [8*d-1:0] sh_mux_r13_2;
MSKmux #(.d(d),.count(8))
muxr13_0(
    .sel(en_inverse & ~en_loop),
    .in_true(sh_4bytes_from_SB[8*d +: 8*d]),
    .in_false(sh_mux_r13_20),
    .out(sh_mux_r13_2)
);
assign sh_reg_in[1] = sh_mux_r13_2;

assign sh_reg_in[5] = sh_reg_out[9];
assign sh_reg_in[9] = sh_reg_out[13];

wire [8*d-1:0] sh_mux_r13_1;
MSKmux #(.d(d),.count(8))
muxr13_2(
    .sel(en_MC),
    .in_true(sh_4bytes_from_MC[8*d +: 8*d]),
    .in_false(sh_4bytes_from_SB[8*d +: 8*d]),
    .out(sh_mux_r13_1)
);

wire [8*d-1:0] sh_mux_r13_0;
MSKmux #(.d(d),.count(8))
muxr13_1(
    .sel(en_loop | en_inverse),
    .in_true(sh_reg_out[1]),
    .in_false(sh_mux_r13_1),
    .out(sh_mux_r13_0)
);
MSKmux #(.d(d),.count(8))
muxr13_11(
    .sel(in_AKfinal & en_inverse),
    .in_true(i_sh_added_rkey[1]),
    .in_false(sh_mux_r13_0),
    .out(sh_reg_in[13])
);

MSKxor #(.d(d),.count(8))
xori11(
    .ina(sh_reg_out[1]),
    .inb(sh_4bytes_from_key[8*d +: 8*d]),
    .out(i_sh_added_rkey[1])
);

// Assign the routing for the third row
assign sh_reg_in[2] = sh_reg_out[6];

MSKxor #(.d(d),.count(8))
xor22(
    .ina(sh_reg_out[10]),
    .inb(sh_4bytes_from_key[16*d +: 8*d]),
    .out(sh_added_rkey[2])
);
wire [8*d-1:0] sh_mux_r23_20;
MSKmux #(.d(d),.count(8))
muxr23_20(
    .sel(en_inverse),
    .in_true(sh_reg_out[10]),
    .in_false(sh_added_rkey[2]),
    .out(sh_mux_r23_20)
);
wire [8*d-1:0] sh_mux_r23_2;
MSKmux #(.d(d),.count(8))
muxr23_0(
    .sel(en_inverse & ~en_loop),
    .in_true(sh_4bytes_from_SB[16*d +: 8*d]),
    .in_false(sh_mux_r23_20),
    .out(sh_mux_r23_2)
);
assign sh_reg_in[6] = sh_mux_r23_2;

assign sh_reg_in[10] = sh_reg_out[14];

wire [8*d-1:0] sh_mux_r23_1;
MSKmux #(.d(d),.count(8))
muxr23_2(
    .sel(en_MC),
    .in_true(sh_4bytes_from_MC[16*d +: 8*d]),
    .in_false(sh_4bytes_from_SB[16*d +: 8*d]),
    .out(sh_mux_r23_1)
);

wire [8*d-1:0] sh_mux_r23_0;
MSKmux #(.d(d),.count(8))
muxr23_1(
    .sel(en_loop | en_inverse),
    .in_true(sh_reg_out[2]),
    .in_false(sh_mux_r23_1),
    .out(sh_mux_r23_0)
);
MSKmux #(.d(d),.count(8))
muxr23_11(
    .sel(in_AKfinal & en_inverse),
    .in_true(i_sh_added_rkey[2]),
    .in_false(sh_mux_r23_0),
    .out(sh_reg_in[14])
);

MSKxor #(.d(d),.count(8))
xori22(
    .ina(sh_reg_out[2]),
    .inb(sh_4bytes_from_key[16*d +: 8*d]),
    .out(i_sh_added_rkey[2])
);

// Assign the routing for the fourth row
assign sh_reg_in[3] = sh_reg_out[7];
assign sh_reg_in[7] = sh_reg_out[11];

MSKxor #(.d(d),.count(8))
xor33(
    .ina(sh_reg_out[15]),
    .inb(sh_4bytes_from_key[24*d +: 8*d]),
    .out(sh_added_rkey[3])
);
wire [8*d-1:0] sh_mux_r33_20;
MSKmux #(.d(d),.count(8))
muxr33_20(
    .sel(en_inverse),
    .in_true(sh_reg_out[15]),
    .in_false(sh_added_rkey[3]),
    .out(sh_mux_r33_20)
);
wire [8*d-1:0] sh_mux_r33_2;
MSKmux #(.d(d),.count(8))
muxr33_0(
    .sel(en_inverse & ~en_loop),
    .in_true(sh_4bytes_from_SB[24*d +: 8*d]),
    .in_false(sh_mux_r33_20),
    .out(sh_mux_r33_2)
);

assign sh_reg_in[11] = sh_mux_r33_2;

wire [8*d-1:0] sh_mux_r33_1;
MSKmux #(.d(d),.count(8))
muxr33_2(
    .sel(en_MC),
    .in_true(sh_4bytes_from_MC[24*d +: 8*d]),
    .in_false(sh_4bytes_from_SB[24*d +: 8*d]),
    .out(sh_mux_r33_1)
);

wire [8*d-1:0] sh_mux_r33_0;
MSKmux #(.d(d),.count(8))
muxr33_1(
    .sel(en_loop | en_inverse),
    .in_true(sh_reg_out[3]),
    .in_false(sh_mux_r33_1),
    .out(sh_mux_r33_0)
);
MSKmux #(.d(d),.count(8))
muxr33_11(
    .sel(in_AKfinal & en_inverse),
    .in_true(i_sh_added_rkey[3]),
    .in_false(sh_mux_r33_0),
    .out(sh_reg_in[15])
);

MSKxor #(.d(d),.count(8))
xori33(
    .ina(sh_reg_out[3]),
    .inb(sh_4bytes_from_key[24*d +: 8*d]),
    .out(i_sh_added_rkey[3])
);


// Assign the enable signal to the pipe
generate
for(i=0;i<4;i=i+1) begin: cols_en_sig
    assign en_pipe[i*4] = enable;
    assign en_pipe[i*4+1] = enable; 
    assign en_pipe[i*4+2] = enable; 
    assign en_pipe[i*4+3] = enable; 
end
endgenerate

// Datapath inverse
wire [8*d-1:0] i_sh_to_SB [3:0];
generate
for(i=0;i<4;i=i+1) begin: mux_mc_inv
MSKmux #(.d(d),.count(8))
mux_MC_inv(
    .sel(en_MC),
    .in_true(i_sh_4bytes_from_MC[8*i*d +: 8*d]),
    .in_false(i_sh_added_rkey[i]),
    .out(i_sh_to_SB[i])
);
end
endgenerate

// Assign the output
generate
for(i=0;i<4;i=i+1) begin: mux_out
MSKmux #(.d(d),.count(8))
mux_out(
    .sel(en_inverse),
    .in_true(i_sh_to_SB[i]),
    .in_false(sh_added_rkey[i]),
    .out(sh_4bytes_to_SB[8*i*d +: 8*d])
);
end
endgenerate

// Assign ciphertext
generate
for(i=0;i<16;i=i+1) begin: cipher_byte
    assign sh_ciphertext[8*d*i +: 8*d] = sh_reg_out[i];
end
endgenerate

/////////////////////////////////////////
////              Debug              ////
/////////////////////////////////////////

`ifdef debug_show_reg
// Array representation for debugging
wire [128*d-1:0] array_sh_reg_in, array_sh_reg_out;
generate
for(i=0;i<16;i=i+1) begin: byte_array
    assign array_sh_reg_in[8*d*i +: 8*d] = sh_reg_in[i];
    assign array_sh_reg_out[8*d*i +: 8*d] = sh_reg_out[i];
end
endgenerate
show_reg #(.d(d))
show_reg_state(
    .sh_reg_in(array_sh_reg_in),
    .sh_reg_out(array_sh_reg_out)
);

show_MC #(.d(d))
myshow_MC(
    .sh_4bytes_from_MC(sh_4bytes_from_MC)
);

wire [127:0] ciphertext;
recombine_unit #(.d(d), .count(128))
share2cipher(
    .sh_in(sh_ciphertext),
    .out(ciphertext)
);
`endif

endmodule
