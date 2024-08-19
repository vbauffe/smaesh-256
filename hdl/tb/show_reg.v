module show_reg
#
(
    parameter d=2
)
(
    input [128*d-1:0] sh_reg_in,
    input [128*d-1:0] sh_reg_out
);

wire [7:0] reg_in [15:0];
wire [7:0] reg_out [15:0];
wire [7:0] reg_in0, reg_in1, reg_in2, reg_in3, reg_in4, reg_in5, reg_in6, reg_in7, reg_in8, reg_in9, reg_in10, reg_in11, reg_in12, reg_in13, reg_in14, reg_in15;
wire [7:0] reg_out0, reg_out1, reg_out2, reg_out3, reg_out4, reg_out5, reg_out6, reg_out7, reg_out8, reg_out9, reg_out10, reg_out11, reg_out12, reg_out13, reg_out14, reg_out15;

genvar i;
generate
for(i=0;i<16;i=i+1) begin: recombine_reg_in
    recombine_unit #(.d(d), .count(8))
    combine_reg_in(
        .sh_in(sh_reg_in[8*d*i +: 8*d]),
        .out(reg_in[i])
    );
    recombine_unit #(.d(d), .count(8))
    combine_reg_out(
        .sh_in(sh_reg_out[8*d*i +: 8*d]),
        .out(reg_out[i])
    );
end
endgenerate

assign reg_in0 = reg_in[0];
assign reg_in1 = reg_in[1];
assign reg_in2 = reg_in[2];
assign reg_in3 = reg_in[3];
assign reg_in4 = reg_in[4];
assign reg_in5 = reg_in[5];
assign reg_in6 = reg_in[6];
assign reg_in7 = reg_in[7];
assign reg_in8 = reg_in[8];
assign reg_in9 = reg_in[9];
assign reg_in10 = reg_in[10];
assign reg_in11 = reg_in[11];
assign reg_in12 = reg_in[12];
assign reg_in13 = reg_in[13];
assign reg_in14 = reg_in[14];
assign reg_in15 = reg_in[15];

assign reg_out0 = reg_out[0];
assign reg_out1 = reg_out[1];
assign reg_out2 = reg_out[2];
assign reg_out3 = reg_out[3];
assign reg_out4 = reg_out[4];
assign reg_out5 = reg_out[5];
assign reg_out6 = reg_out[6];
assign reg_out7 = reg_out[7];
assign reg_out8 = reg_out[8];
assign reg_out9 = reg_out[9];
assign reg_out10 = reg_out[10];
assign reg_out11 = reg_out[11];
assign reg_out12 = reg_out[12];
assign reg_out13 = reg_out[13];
assign reg_out14 = reg_out[14];
assign reg_out15 = reg_out[15];


endmodule