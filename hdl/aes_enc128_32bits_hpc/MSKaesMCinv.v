(* fv_prop = "affine", fv_strat = "composite", fv_order=d *)
module MSKaesMCinv 
# 
( 
    parameter d = 2 
)
(
    // Input shares (masked GF_256 field elements)
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] b0,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] b1,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] b2,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    input [8*d-1:0] b3,
    // Output shares (masked GF_256 field elements)
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] a0,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] a1,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] a2,
    (* fv_type="sharing" , fv_latency=0, fv_count=8 *)
    output [8*d-1:0] a3
);


// Create internal prods
// contains the value x*09, x*0b, x*0d, x*0e
wire [8*d-1:0] b0_ps [3:0];
wire [8*d-1:0] b1_ps [3:0];
wire [8*d-1:0] b2_ps [3:0];
wire [8*d-1:0] b3_ps [3:0];

// b0 products
MSKprodMCinv #(.d(d)) 
prod_b0(
    .sh_in(b0), 
    .sh_inx9(b0_ps[0]),.sh_inxb(b0_ps[1]),.sh_inxd(b0_ps[2]),.sh_inxe(b0_ps[3])
);

// b1 products
MSKprodMCinv #(.d(d)) 
prod_b1(
    .sh_in(b1), 
    .sh_inx9(b1_ps[0]),.sh_inxb(b1_ps[1]),.sh_inxd(b1_ps[2]),.sh_inxe(b1_ps[3])
);

// b2 products
MSKprodMCinv #(.d(d)) 
prod_b2(
    .sh_in(b2), 
    .sh_inx9(b2_ps[0]),.sh_inxb(b2_ps[1]),.sh_inxd(b2_ps[2]),.sh_inxe(b2_ps[3])
);

// b3 products
MSKprodMCinv #(.d(d)) 
prod_b3(
    .sh_in(b3), 
    .sh_inx9(b3_ps[0]),.sh_inxb(b3_ps[1]),.sh_inxd(b3_ps[2]),.sh_inxe(b3_ps[3])
);

// Create Xors
// XORs for the a0
wire [8*d-1:0] a0_x0, a0_x1;
MSKxor #(.d(d),.count(8)) 
xra0_1(
    .ina(b0_ps[3]),.inb(b1_ps[1]), 
    .out(a0_x0)
);
MSKxor #(.d(d),.count(8)) 
xra0_2(
    .ina(a0_x0),.inb(b2_ps[2]), 
    .out(a0_x1)
);
MSKxor #(.d(d),.count(8)) 
xra0_3(
    .ina(a0_x1),.inb(b3_ps[0]), 
    .out(a0)
);

// XORs for the a1
wire [8*d-1:0] a1_x0, a1_x1;
MSKxor #(.d(d),.count(8)) 
xra1_1(
    .ina(b0_ps[0]),.inb(b1_ps[3]), 
    .out(a1_x0)
);
MSKxor #(.d(d),.count(8)) 
xra1_2(
    .ina(a1_x0),.inb(b2_ps[1]), 
    .out(a1_x1)
);
MSKxor #(.d(d),.count(8)) 
xra1_3(
    .ina(a1_x1),.inb(b3_ps[2]), 
    .out(a1)
);

// XORs for the a2
wire [8*d-1:0] a2_x0, a2_x1;
MSKxor #(.d(d),.count(8)) 
xra2_1(
    .ina(b0_ps[2]),.inb(b1_ps[0]), 
    .out(a2_x0)
);
MSKxor #(.d(d),.count(8)) 
xra2_2(
    .ina(a2_x0),.inb(b2_ps[3]), 
    .out(a2_x1)
);
MSKxor #(.d(d),.count(8)) 
xra2_3(
    .ina(a2_x1),.inb(b3_ps[1]), 
    .out(a2)
);

// XORs for the a3
wire [8*d-1:0] a3_x0, a3_x1;
MSKxor #(.d(d),.count(8)) 
xra3_1(
    .ina(b0_ps[1]),.inb(b1_ps[2]), 
    .out(a3_x0)
);
MSKxor #(.d(d),.count(8)) 
xra3_2(
    .ina(a3_x0),.inb(b2_ps[0]), 
    .out(a3_x1)
);
MSKxor #(.d(d),.count(8)) 
xra3_3(
    .ina(a3_x1),.inb(b3_ps[3]), 
    .out(a3)
);


endmodule