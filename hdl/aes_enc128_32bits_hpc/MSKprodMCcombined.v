(* fv_prop = "affine", fv_strat = "isolate", fv_order=d *)
module MSKprodMCcombined
#
(
    parameter d = 2
)
(
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] sh_in,
    output [8*d-1:0] sh_inx2,
    output [8*d-1:0] sh_inx3,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] sh_inx9,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] sh_inxb,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] sh_inxd,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] sh_inxe
);

wire [7:0] cst_poly = 8'h1b;

// Generate sharings
genvar i,j;
wire [7:0] shares [d-1:0];
generate
for(i=0;i<8;i=i+1) begin: bit_op
    for(j=0;j<d;j=j+1) begin: share_op
        assign shares[j][i] = sh_in[i*d+j];
    end
end
endgenerate

// Generate xtime for each indep share.
wire [7:0] x2_shares [d-1:0];
wire [7:0] x3_shares [d-1:0];
wire [7:0] x4_shares [d-1:0];
wire [7:0] x8_shares [d-1:0];
wire [7:0] x9_shares [d-1:0];
wire [7:0] xb_shares [d-1:0];
wire [7:0] xd_shares [d-1:0];
wire [7:0] xe_shares [d-1:0];
generate
for(i=0;i<d;i=i+1) begin: sharing_op
    wire [7:0] used_shares = shares[i];
    wire sh_MSB = shares[i][7];
    wire [7:0] shifted_sh = {shares[i][6:0],1'b0};
    wire [7:0] and_cst_poly = ({8{sh_MSB}} & cst_poly);

    assign x2_shares[i] = shifted_sh ^ and_cst_poly;
    assign x3_shares[i] = x2_shares[i] ^ shares[i];

    wire sh_MSB4 = x2_shares[i][7];
    wire [7:0] shifted_sh4 = {x2_shares[i][6:0],1'b0};
    wire [7:0] and_cst_poly4 = ({8{sh_MSB4}} & cst_poly);

    assign x4_shares[i] = shifted_sh4 ^ and_cst_poly4;

    wire sh_MSB8 = x4_shares[i][7];
    wire [7:0] shifted_sh8 = {x4_shares[i][6:0],1'b0};
    wire [7:0] and_cst_poly8 = ({8{sh_MSB8}} & cst_poly);

    assign x8_shares[i] = shifted_sh8 ^ and_cst_poly8;

    assign x9_shares[i] = x8_shares[i] ^ shares[i];
    assign xb_shares[i] = x8_shares[i] ^ x2_shares[i] ^ shares[i];
    assign xd_shares[i] = x8_shares[i] ^ x4_shares[i] ^ shares[i];
    assign xe_shares[i] = x8_shares[i] ^ x4_shares[i] ^ x2_shares[i];
end
endgenerate

wire [8*d-1:0] sh_inx2;
// Regenerate output mux
generate
for(i=0;i<8;i=i+1) begin: out_share
    for(j=0;j<d;j=j+1) begin: share_out_op
        assign sh_inx2[i*d+j] = x2_shares[j][i];
        assign sh_inx3[i*d+j] = x3_shares[j][i];
        assign sh_inx9[i*d+j] = x9_shares[j][i];
        assign sh_inxb[i*d+j] = xb_shares[j][i];
        assign sh_inxd[i*d+j] = xd_shares[j][i];
        assign sh_inxe[i*d+j] = xe_shares[j][i]; 
    end
end
endgenerate

endmodule