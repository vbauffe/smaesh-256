`timescale 1ns/1ps

module tb_core # ( parameter d = 2 );

`include "design.vh"

reg clk;
reg rst, aes_valid_in, aes_out_ready, aes_inverse; // in 
wire aes_busy, aes_ready_in, aes_cipher_valid, aes_in_ready_rnd; // out

wire [128*d-1:0] sh_plaintext;
wire [128*d-1:0] sh_key;
wire [128*d-1:0] sh_ciphertext;

wire [127:0] plaintext, f_plaintext, i_plaintext;
assign f_plaintext = 128'hc4b5f301_24598a62_47846834_eb59e4f1;
// assign i_plaintext = 128'hcfe1c52d_81d7f208_22840350_8a6d7017;
assign i_plaintext = 128'h96f8e5fa_408b9c61_4c6a5d54_7a8d4f8c;
assign plaintext = aes_inverse ? i_plaintext : f_plaintext;
MSKcst #(.d(d), .count(128))
sharing_plain(
    .cst(plaintext),
    .out(sh_plaintext)
);

wire [127:0] key, f_key, i_key;
assign f_key = 128'h3c4fcf09_8815f7ab_a6d2ae28_16157e2b;
assign i_key = 128'ha60c63b6_c80c3fe1_8925eec9_a8f914d0;
assign key = aes_inverse ? i_key : f_key;
MSKcst #(.d(d), .count(128))
sharing_key(
    .cst(key),
    .out(sh_key)
);

wire [255:0] key256, f_key256, i_key256;
assign f_key256 = 256'h1f1e1d1c_1b1a1918_17161514_13121110_0f0e0d0c_0b0a0908_07060504_03020100;
assign i_key256 = 256'heacdf8cd_aa2b577e_e04ff2a9_99665a4e_36de686d_3cc21a37_e97909bf_cc79fc24;
assign key256 = aes_inverse ? i_key256 : f_key256;
wire [256*d-1:0] sh_key256;
MSKcst #(.d(d), .count(256))
sharing_key_256(
    .cst(key256),
    .out(sh_key256)
);

// Generate fixed randomness
wire [4*rnd_bus0-1:0] rnd_bus0w = 1'b0;
wire [4*rnd_bus1-1:0] rnd_bus1w = 1'b0;
wire [4*rnd_bus2-1:0] rnd_bus2w = 1'b0;
wire [4*rnd_bus3-1:0] rnd_bus3w = 1'b0;

MSKaes_32bits_core #(.d(d))
aes_core(
    .rst(rst),
    .clk(clk),
    .busy(aes_busy),
    .inverse(aes_inverse),
    .valid_in(aes_valid_in),
    .in_ready(aes_ready_in),
    .cipher_valid(aes_cipher_valid),
    .out_ready(aes_out_ready),
    .sh_plaintext(sh_plaintext),
    .sh_key(sh_key256),
    .sh_ciphertext(sh_ciphertext),
    .rnd_bus0w(rnd_bus0w),
    .rnd_bus1w(rnd_bus1w),
    .rnd_bus2w(rnd_bus2w),
    .rnd_bus3w(rnd_bus3w),
    .in_ready_rnd(aes_in_ready_rnd)
);

wire [127:0] ciphertext;
recombine_unit #(.d(d), .count(128))
share2cipher(
    .sh_in(sh_ciphertext),
    .out(ciphertext)
);


always #1 clk = ~clk;
initial begin
    clk = 1;
    $monitor("Cipher : %h%h%h%h_%h%h%h%h_%h%h%h%h_%h%h%h%h", ciphertext[0+:8], ciphertext[8+:8], ciphertext[16+:8], ciphertext[24+:8], ciphertext[32+:8], ciphertext[40+:8], ciphertext[48+:8], ciphertext[56+:8], ciphertext[64+:8], ciphertext[72+:8], ciphertext[80+:8], ciphertext[88+:8], ciphertext[96+:8], ciphertext[104+:8], ciphertext[112+:8], ciphertext[120+:8]);
    $dumpfile(`DUMPFILE);
    $dumpvars(0, tb_core);

    aes_inverse = 1'b0;
    rst = 1'b1; #2 rst = 1'b0;
    aes_out_ready = 1'b1;
    aes_valid_in = 1'b1;
    #240
    aes_inverse = 1'b1;
    rst = 1'b1; #2 rst = 1'b0;
    aes_out_ready = 1'b1;
    aes_valid_in = 1'b1;
    #240
    $finish();
end

endmodule