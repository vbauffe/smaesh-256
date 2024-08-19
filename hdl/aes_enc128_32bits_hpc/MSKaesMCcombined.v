(* fv_prop = "affine", fv_strat = "composite", fv_order=d *)
module MSKaesMCcombined
# 
( 
    parameter d = 2 
)
(
    input inverse,
    // Input shares (masked GF_256 field elements)
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] in0,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] in1,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] in2,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] in3,
    // Output shares (masked GF_256 field elements)
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] out0,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] out1,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] out2,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] out3
);


// Create internal prods
// contains the value x*09, x*0b, x*0d, x*0e
wire [8*d-1:0] in0_ps [6:0];
wire [8*d-1:0] in1_ps [6:0];
wire [8*d-1:0] in2_ps [6:0];
wire [8*d-1:0] in3_ps [6:0];

// in0 products
assign in0_ps[0] = in0;
MSKprodMCcombined #(.d(d)) 
prod_b0(
    .sh_in(in0), 
    .sh_inx2(in0_ps[1]),.sh_inx3(in0_ps[2]),.sh_inx9(in0_ps[3]),.sh_inxb(in0_ps[4]),.sh_inxd(in0_ps[5]),.sh_inxe(in0_ps[6])
);

// in1 products
assign in1_ps[0] = in1;
MSKprodMCcombined #(.d(d)) 
prod_b1(
    .sh_in(in1), 
    .sh_inx2(in1_ps[1]),.sh_inx3(in1_ps[2]),.sh_inx9(in1_ps[3]),.sh_inxb(in1_ps[4]),.sh_inxd(in1_ps[5]),.sh_inxe(in1_ps[6])
);

// in2 products
assign in2_ps[0] = in2;
MSKprodMCcombined #(.d(d)) 
prod_b2(
    .sh_in(in2), 
    .sh_inx2(in2_ps[1]),.sh_inx3(in2_ps[2]),.sh_inx9(in2_ps[3]),.sh_inxb(in2_ps[4]),.sh_inxd(in2_ps[5]),.sh_inxe(in2_ps[6])
);

// in3 products
assign in3_ps[0] = in3;
MSKprodMCcombined #(.d(d)) 
prod_b3(
    .sh_in(in3), 
    .sh_inx2(in3_ps[1]),.sh_inx3(in3_ps[2]),.sh_inx9(in3_ps[3]),.sh_inxb(in3_ps[4]),.sh_inxd(in3_ps[5]),.sh_inxe(in3_ps[6])
);

// Create Xors
// XORs for the a0
wire [8*d-1:0] a0_x0, a0_x1, a0_out;
MSKxor #(.d(d),.count(8)) 
xra0_1(
    .ina(in0_ps[6]),.inb(in1_ps[4]), 
    .out(a0_x0)
);
MSKxor #(.d(d),.count(8)) 
xra0_2(
    .ina(a0_x0),.inb(in2_ps[5]), 
    .out(a0_x1)
);
MSKxor #(.d(d),.count(8)) 
xra0_3(
    .ina(a0_x1),.inb(in3_ps[3]), 
    .out(a0_out)
);

// XORs for the a1
wire [8*d-1:0] a1_x0, a1_x1, a1_out;
MSKxor #(.d(d),.count(8)) 
xra1_1(
    .ina(in0_ps[3]),.inb(in1_ps[6]), 
    .out(a1_x0)
);
MSKxor #(.d(d),.count(8)) 
xra1_2(
    .ina(a1_x0),.inb(in2_ps[4]), 
    .out(a1_x1)
);
MSKxor #(.d(d),.count(8)) 
xra1_3(
    .ina(a1_x1),.inb(in3_ps[5]), 
    .out(a1_out)
);

// XORs for the a2
wire [8*d-1:0] a2_x0, a2_x1, a2_out;
MSKxor #(.d(d),.count(8)) 
xra2_1(
    .ina(in0_ps[5]),.inb(in1_ps[3]), 
    .out(a2_x0)
);
MSKxor #(.d(d),.count(8)) 
xra2_2(
    .ina(a2_x0),.inb(in2_ps[6]), 
    .out(a2_x1)
);
MSKxor #(.d(d),.count(8)) 
xra2_3(
    .ina(a2_x1),.inb(in3_ps[4]), 
    .out(a2_out)
);

// XORs for the a3
wire [8*d-1:0] a3_x0, a3_x1, a3_out;
MSKxor #(.d(d),.count(8)) 
xra3_1(
    .ina(in0_ps[4]),.inb(in1_ps[5]), 
    .out(a3_x0)
);
MSKxor #(.d(d),.count(8)) 
xra3_2(
    .ina(a3_x0),.inb(in2_ps[3]), 
    .out(a3_x1)
);
MSKxor #(.d(d),.count(8)) 
xra3_3(
    .ina(a3_x1),.inb(in3_ps[6]), 
    .out(a3_out)
);





// Create Xors
// XORs for the b0
wire [8*d-1:0] b0_x0, b0_x1, b0_out;
MSKxor #(.d(d),.count(8))
xrb0_0(
    .ina(in0_ps[1]),
    .inb(in1_ps[2]),
    .out(b0_x0)
);

MSKxor #(.d(d),.count(8))
xrb0_1(
    .ina(b0_x0),
    .inb(in2_ps[0]),
    .out(b0_x1)
);

MSKxor #(.d(d),.count(8))
xrb0_2(
    .ina(b0_x1),
    .inb(in3_ps[0]),
    .out(b0_out)
);

// XORs for the b1
wire [8*d-1:0] b1_x0, b1_x1, b1_out;
MSKxor #(.d(d),.count(8))
xrb1_0(
    .ina(in0_ps[0]),
    .inb(in1_ps[1]),
    .out(b1_x0)
);

MSKxor #(.d(d),.count(8))
xrb1_1(
    .ina(b1_x0),
    .inb(in2_ps[2]),
    .out(b1_x1)
);

MSKxor #(.d(d),.count(8))
xrb1_2(
    .ina(b1_x1),
    .inb(in3_ps[0]),
    .out(b1_out)
);

// XORs for the b2
wire [8*d-1:0] b2_x0, b2_x1, b2_out;
MSKxor #(.d(d),.count(8))
xrb2_0(
    .ina(in0_ps[0]),
    .inb(in1_ps[0]),
    .out(b2_x0)
);

MSKxor #(.d(d),.count(8))
xrb2_1(
    .ina(b2_x0),
    .inb(in2_ps[1]),
    .out(b2_x1)
);

MSKxor #(.d(d),.count(8))
xrb2_2(
    .ina(b2_x1),
    .inb(in3_ps[2]),
    .out(b2_out)
);

// XORs for the b3
wire [8*d-1:0] b3_x0, b3_x1, b3_out;
MSKxor #(.d(d),.count(8))
xrb3_0(
    .ina(in0_ps[2]),
    .inb(in1_ps[0]),
    .out(b3_x0)
);

MSKxor #(.d(d),.count(8))
xrb3_1(
    .ina(b3_x0),
    .inb(in2_ps[0]),
    .out(b3_x1)
);

MSKxor #(.d(d),.count(8))
xrb3_2(
    .ina(b3_x1),
    .inb(in3_ps[1]),
    .out(b3_out)
);

// Output assign
MSKmux #(.d(d),.count(8))
muxout0(
    .sel(inverse),
    .in_true(a0_out),
    .in_false(b0_out),
    .out(out0)
);
MSKmux #(.d(d),.count(8))
muxout1(
    .sel(inverse),
    .in_true(a1_out),
    .in_false(b1_out),
    .out(out1)
);
MSKmux #(.d(d),.count(8))
muxout2(
    .sel(inverse),
    .in_true(a2_out),
    .in_false(b2_out),
    .out(out2)
);
MSKmux #(.d(d),.count(8))
muxout3(
    .sel(inverse),
    .in_true(a3_out),
    .in_false(b3_out),
    .out(out3)
);

endmodule