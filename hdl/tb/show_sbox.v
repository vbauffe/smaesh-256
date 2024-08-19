module show_sbox
#
(
    parameter d=2
)
(
    input [32*d-1:0] sh_4bytes_to_SB,
    input [32*d-1:0] sh_4bytes_from_SB
);

wire [7:0] sbox0_in, sbox1_in, sbox2_in, sbox3_in;
wire [7:0] sbox0_out, sbox1_out, sbox2_out, sbox3_out;

recombine_unit #(.d(d), .count(8))
sbox_recombine0in(
    .sh_in(sh_4bytes_to_SB[0 +: 8*d]),
    .out(sbox0_in)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine1in(
    .sh_in(sh_4bytes_to_SB[8*d +: 8*d]),
    .out(sbox1_in)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine2in(
    .sh_in(sh_4bytes_to_SB[16*d +: 8*d]),
    .out(sbox2_in)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine3in(
    .sh_in(sh_4bytes_to_SB[24*d +: 8*d]),
    .out(sbox3_in)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine0out(
    .sh_in(sh_4bytes_from_SB[0 +: 8*d]),
    .out(sbox0_out)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine1out(
    .sh_in(sh_4bytes_from_SB[8*d +: 8*d]),
    .out(sbox1_out)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine2out(
    .sh_in(sh_4bytes_from_SB[16*d +: 8*d]),
    .out(sbox2_out)
);
recombine_unit #(.d(d), .count(8))
sbox_recombine3out(
    .sh_in(sh_4bytes_from_SB[24*d +: 8*d]),
    .out(sbox3_out)
);


endmodule