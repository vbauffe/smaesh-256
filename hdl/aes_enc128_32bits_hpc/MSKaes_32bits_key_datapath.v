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
module MSKaes_32bits_key_datapath
#
(
    parameter d = 2
)
(
    // Global
    clk,
    // Control
    inverse,
    init,
    enable,
    odd_round,
    loop,
    add_from_sb,
    last_kexp,
    shift_row_sbox,
    in_AKfinal,
    rcon_rst,
    rcon_update,
    // Data
    sh_key,
    sh_4bytes_rot_to_SB,
    sh_4bytes_from_SB,
    sh_4bytes_to_AK
);

input clk;
input init;
input enable;
input odd_round;
input loop;
input add_from_sb;
input last_kexp;
input shift_row_sbox;
input in_AKfinal;
input rcon_rst;
input rcon_update;
input inverse;
input [256*d-1:0] sh_key;
output [32*d-1:0] sh_4bytes_rot_to_SB;
(* verime = "key_col_from_SB" *)
input [32*d-1:0] sh_4bytes_from_SB;
(* verime = "key_col_to_AK" *)
output [32*d-1:0] sh_4bytes_to_AK;

///// RCON addition post Sbox
// Module used to compute the 8bits RCON value
// shared representation of the RCON byte. 
wire [8*d-1:0] sh_rcon_b0;
MSKaes_rcon #(.d(d))
rcon_unit(
    .clk(clk),
    .rst(rcon_rst),
    .update(rcon_update & odd_round),
    .mask_rcon(1'b1),
    .inverse(inverse),
    .sh_rcon(sh_rcon_b0)
);
wire [8*d-1:0] xor_from_sbox [3:0];
wire [8*d-1:0] reg_from_sbox [3:0];
genvar i;
generate
for(i=0;i<4;i=i+1) begin: byte_from_sbox
    MSKxor #(.d(d),.count(8))
    xor_from_sbox_inst(
        .ina(sh_4bytes_from_SB[8*i*d +: 8*d]),
        .inb(sh_m_key[4+i]),
        .out(xor_from_sbox[i])
    );
    // Reg instance
    MSKregEn #(.d(d),.count(8))
    reg_sh_m_from_sbox(
        .clk(clk),
        .en(add_from_sb | in_AKfinal),
        .in(sh_4bytes_from_SB_rot_rcon[8*d*i +: 8*d]),
        .out(reg_from_sbox[i])
    );
end
endgenerate
// XOR used to perform the addition with the first byte 
// coming from the sbox (post rotation of the column)
wire [8*d-1:0] to_add_rcon, added_rcon;
MSKmux #(.d(d),.count(8))
mux_rcon(
    .sel(inverse),
    .in_true(xor_from_sbox[0]),
    .in_false(sh_4bytes_from_SB[0 +: 8*d]),
    .out(to_add_rcon)
);
MSKxor #(.d(d),.count(8))
xor_rcon_forward(
    .ina(to_add_rcon),
    .inb(sh_rcon_b0),
    .out(added_rcon)
);
// Reformat the byte from sbox with RCON addition result
wire [32*d-1:0] sh_4bytes_from_SB_rot_rcon, temp, temp2;
MSKmux #(.d(d),.count(8))
mux_add_rcon(
    .sel(odd_round),
    .in_true(to_add_rcon),
    .in_false(added_rcon),
    .out(sh_4bytes_from_SB_rot_rcon[0 +: 8*d])
);
generate
for(i=1;i<4;i=i+1) begin: from_sb_mux
    MSKmux #(.d(d),.count(8))
    mux_from_sbox(
        .sel(inverse),
        .in_true(xor_from_sbox[i]),
        .in_false(sh_4bytes_from_SB[8*d*i +: 8*d]),
        .out(sh_4bytes_from_SB_rot_rcon[8*d*i +: 8*d])
    );
end
endgenerate

// Byte matrix representation of the input key
wire [8*d-1:0] sh_m_key_in[31:0];
generate
for(i=0;i<32;i=i+1) begin: byte_key_in
    assign sh_m_key_in[i] = sh_key[8*d*i +: 8*d];
end
endgenerate

// Apply the initial permutation 
// (required because of the new architecture, in regime the position of 
// the key byte are located 1 stage before when the last column is taken) 
wire [8*d-1:0] sh_m_key_in_perm[31:0];
generate
for(i=0;i<16;i=i+1) begin: byte_key_in_perm
    assign sh_m_key_in_perm[i] = sh_m_key_in[(i+12)%16];
    assign sh_m_key_in_perm[i+16] = sh_m_key_in[((i+12)%16)+16];
end
endgenerate

// Byte matrix representation of the holded round key
(* verime = "key_byte" *)
wire [8*d-1:0] sh_m_key[31:0];
wire [8*d-1:0] to_sh_m_key[31:0];

generate
for(i=0;i<16;i=i+1) begin: byte_key
    // Reg instance
    MSKscanReg #(.d(d),.count(8))
    reg_sh_m_key(
        .clk(clk),
        .en(enable),
        .scan_en(init),
        .in_d(to_sh_m_key[i]),
        .in_scan(sh_m_key_in_perm[i]),
        .out_q(sh_m_key[i])
    );
    MSKscanReg #(.d(d),.count(8))
    reg_sh_m_key_2(
        .clk(clk),
        .en(rcon_rst | last_kexp | in_AKfinal),
        .scan_en(init | in_AKfinal),
        .in_d(to_sh_m_key[i+16]),
        .in_scan(sh_m_key_in_perm[i+16]),
        .out_q(sh_m_key[i+16])
    );
end
endgenerate

// Bytes 0-15
generate
for(i=0;i<4;i=i+1) begin: row_0_3 // sh_m_key [0:3]
    // Mux from SB 
    wire [8*d-1:0] mux_add_from_SB; 
    MSKmux #(.d(d),.count(8))
    inst_mux_add_from_SB(
        .sel(add_from_sb),
        .in_true(sh_4bytes_from_SB_rot_rcon[i*8*d +: 8*d]),
        .in_false(sh_m_key[i]),
        .out(mux_add_from_SB)
    );
    // XOR for key update 
    wire [8*d-1:0] xor_update;
    MSKxor #(.d(d),.count(8))
    inst_xor_xor_update(
        .ina(mux_add_from_SB),
        .inb(sh_m_key[4+i]),
        .out(xor_update)
    );
    // Reverse loop
    wire [8*d-1:0] loop_inverse;
    MSKmux #(.d(d),.count(8))
    inst_mux_loop(
        .sel(inverse),
        .in_true(sh_m_key[12+i]),
        .in_false(xor_update),
        .out(loop_inverse)
    );
    // Mux input of reg
    MSKmux #(.d(d),.count(8))
    inst_mux_to_sh_m_key(
        .sel(loop),
        .in_true(sh_m_key[4+i]),
        .in_false(loop_inverse),
        .out(temp_to_key)
    );
    wire [8*d-1:0] temp_to_key;
    MSKmux #(.d(d),.count(8))
    mux_to_key(
        .sel(last_kexp),
        .in_true(sh_m_key[i+16]),
        .in_false(temp_to_key),
        .out(to_sh_m_key[i])
    );
    assign to_sh_m_key[i+16] = temp_to_key;
end
endgenerate
generate
for(i=0;i<4;i=i+1) begin: row_4_7 // sh_m_key [4:7]
    // XOR from registers
    wire [8*d-1:0] xor_update;
    MSKxor #(.d(d),.count(8))
    inst_xor_xor_update(
        .ina(sh_m_key[i]),
        .inb(sh_m_key[12+i]),
        .out(xor_update)
    );
    wire [8*d-1:0] mux_xor_or_loop; 
    MSKmux #(.d(d),.count(8))
    mux_scan(
        .sel(loop | ~inverse),
        .in_true(sh_m_key[(8+i) % 16]),
        .in_false(xor_update),
        .out(mux_xor_or_loop)
    );        
    MSKmux #(.d(d),.count(8))
    inst_mux_reg_sbox(
        .sel(last_kexp & inverse),
        .in_true(reg_from_sbox[i]),
        .in_false(mux_xor_or_loop),
        .out(temp_to_key)
    );
    wire [8*d-1:0] temp_to_key;
    MSKmux #(.d(d),.count(8))
    mux_to_key(
        .sel(last_kexp),
        .in_true(sh_m_key[4+i+16]),
        .in_false(temp_to_key),
        .out(to_sh_m_key[4+i])
    );
    assign to_sh_m_key[4+i+16] = temp_to_key;
end
endgenerate
generate
for(i=8;i<12;i=i+1) begin: row_8_11 // sh_m_key [8:11]
    MSKmux #(.d(d),.count(8))
    mux_scan(
        .sel(loop | ~inverse),
        .in_true(sh_m_key[(4+i) % 16]),
        .in_false(sh_m_key[(i-4) % 16]),
        .out(temp_to_key)
    );       
    wire [8*d-1:0] temp_to_key;
    MSKmux #(.d(d),.count(8))
    mux_to_key(
        .sel(last_kexp),
        .in_true(sh_m_key[i+16]),
        .in_false(temp_to_key),
        .out(to_sh_m_key[i])
    );
    assign to_sh_m_key[i+16] = temp_to_key; 
end
endgenerate
generate
for(i=12;i<16;i=i+1) begin: row_12_15 // sh_m_key [12:15]
    MSKmux #(.d(d),.count(8))
    mux_scan(
        .sel(loop | ~inverse),
        .in_true(sh_m_key[(4+i) % 16]),
        .in_false(sh_m_key[(i-4) % 16]),
        .out(temp_to_key)
    );
    wire [8*d-1:0] temp_to_key;
    MSKmux #(.d(d),.count(8))
    mux_to_key(
        .sel(last_kexp),
        .in_true(sh_m_key[i+16]),
        .in_false(temp_to_key),
        .out(to_sh_m_key[i])
    );
    assign to_sh_m_key[i+16] = temp_to_key;  
end
endgenerate


// Output assign 
generate
for(i=0;i<4;i=i+1) begin: to_sbox
    MSKmux #(.d(d),.count(8))
    mux_to_sbox1(
        .sel(shift_row_sbox),
        .in_true(sh_m_key[(i+1)%4+16]), // 1-2-3-0
        .in_false(sh_m_key[i+16]),      // 0-1-2-3
        .out(sh_4bytes_rot_to_SB[8*d*i +: 8*d])
    );
end
endgenerate

wire [32*d-1:0] sh_4bytes_to_AK_forward, sh_4bytes_to_AK_inverse;

assign sh_4bytes_to_AK_forward[0 +: 8*d] = sh_m_key[0];
assign sh_4bytes_to_AK_forward[8*d +: 8*d] = sh_m_key[5];
assign sh_4bytes_to_AK_forward[16*d +: 8*d] = sh_m_key[10];
assign sh_4bytes_to_AK_forward[24*d +: 8*d] = sh_m_key[15];

assign sh_4bytes_to_AK_inverse[0 +: 8*d] = sh_m_key[0];
assign sh_4bytes_to_AK_inverse[8*d +: 8*d] = sh_m_key[1];
assign sh_4bytes_to_AK_inverse[16*d +: 8*d] = sh_m_key[2];
assign sh_4bytes_to_AK_inverse[24*d +: 8*d] = sh_m_key[3];

MSKmux #(.d(d),.count(32))
mux_to_AK(
    .sel(inverse),
    .in_true(sh_4bytes_to_AK_inverse),
    .in_false(sh_4bytes_to_AK_forward),
    .out(sh_4bytes_to_AK)
);


/////////////////////////////////////////
////              Debug              ////
/////////////////////////////////////////

`ifdef debug_show_reg
wire [7:0] reg_sbox0, reg_sbox1, reg_sbox2, reg_sbox3;

recombine_unit #(.d(d), .count(8))
sbox_recombine0(
    .sh_in(reg_from_sbox[0]),
    .out(reg_sbox0)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine1(
    .sh_in(reg_from_sbox[1]),
    .out(reg_sbox1)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine2(
    .sh_in(reg_from_sbox[2]),
    .out(reg_sbox2)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine3(
    .sh_in(reg_from_sbox[3]),
    .out(reg_sbox3)
);

// Array representation for debugging
wire [128*d-1:0] array_to_sh_m_key, array_sh_m_key;
generate
for(i=0;i<16;i=i+1) begin: byte_array
    assign array_to_sh_m_key[8*d*i +: 8*d] = to_sh_m_key[i];
    assign array_sh_m_key[8*d*i +: 8*d] = sh_m_key[i];
end
endgenerate
show_reg #(.d(d))
show_reg_key(
    .sh_reg_in(array_to_sh_m_key),
    .sh_reg_out(array_sh_m_key)
);
// Array representation for debugging
wire [128*d-1:0] array2_to_sh_m_key, array2_sh_m_key;
generate
for(i=0;i<16;i=i+1) begin: byte_array2
    assign array2_to_sh_m_key[8*d*i +: 8*d] = to_sh_m_key[16+i];
    assign array2_sh_m_key[8*d*i +: 8*d] = sh_m_key[16+i];
end
endgenerate
show_reg #(.d(d))
show2_reg_key(
    .sh_reg_in(array2_to_sh_m_key),
    .sh_reg_out(array2_sh_m_key)
);

show_sbox #(.d(d))
myshow_sbox(
    .sh_4bytes_to_SB(sh_4bytes_rot_to_SB),
    .sh_4bytes_from_SB(sh_4bytes_from_SB)
);

// wire [128*d-1:0] array_sh_manual_key;
// unmsk_256_key #(.d(d))
// inst_key_256(
//     .clk(clk),
//     .sh_key(sh_key256),
//     .sh_rcon_b0(sh_rcon_b0),
//     .init(init),
//     .inverse(inverse),
//     .rcon_rst(rcon_rst),
//     .last_kexp(last_kexp),
//     .array_sh_manual_key(array_sh_manual_key),
//     .cnt_round(cnt_round)
// );

`endif

endmodule
