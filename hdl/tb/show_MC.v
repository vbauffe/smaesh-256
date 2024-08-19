module show_MC
#
(
    parameter d=2
)
(
    input [32*d-1:0] sh_4bytes_from_MC
);

wire [7:0] byte_MC0, byte_MC1, byte_MC2, byte_MC3;
recombine_unit #(.d(d), .count(8))
combine_MC0(
    .sh_in(sh_4bytes_from_MC[0 +: 8*d]),
    .out(byte_MC0)
);
recombine_unit #(.d(d), .count(8))
combine_MC1(
    .sh_in(sh_4bytes_from_MC[8*d +: 8*d]),
    .out(byte_MC1)
);
recombine_unit #(.d(d), .count(8))
combine_MC2(
    .sh_in(sh_4bytes_from_MC[16*d +: 8*d]),
    .out(byte_MC2)
);
recombine_unit #(.d(d), .count(8))
combine_MC3(
    .sh_in(sh_4bytes_from_MC[24*d +: 8*d]),
    .out(byte_MC3)
);

endmodule