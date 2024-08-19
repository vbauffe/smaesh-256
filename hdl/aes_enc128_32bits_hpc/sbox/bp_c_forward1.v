`timescale 1ns/1ps

// latency = 0

// Fully pipeline PINI circuit in 0 clock cycles.
// This file has been automatically generated.
`ifdef FULLVERIF
(* fv_prop = "PINI", fv_strat = "composite", fv_order=d *)
`endif
module bp_c_forward1 # ( parameter d=2 ) (
    clk,
    i0,
    i1,
    i2,
    i3,
    i4,
    i5,
    i6,
    i7,
    t1,
    t2,
    t3,
    t4,
    t5,
    t6,
    t7,
    t8,
    t9,
    t10,
    t11,
    t12,
    t13,
    t14,
    t15,
    t16,
    t17,
    t18,
    t19,
    t20,
    t21,
    t22,
    t23,
    t24,
    t25,
    t26,
    t27,
);
`include "MSKand_hpc1.vh"
`include "MSKand_hpc2.vh"
`include "MSKand_hpc3.vh"
(* fv_type="clock" *)
input clk;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i0;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i1;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i2;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i3;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i4;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i5;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i6;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] i7;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t1;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t2;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t3;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t4;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t5;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t6;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t7;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t8;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t9;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t10;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t11;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t12;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t13;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t14;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t15;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t16;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t17;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t18;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t19;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t20;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t21;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t22;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t23;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t24;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t25;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t26;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] t27;
wire [d-1:0] i0_0;
wire [d-1:0] i1_0;
wire [d-1:0] i2_0;
wire [d-1:0] i3_0;
wire [d-1:0] i4_0;
wire [d-1:0] i5_0;
wire [d-1:0] i6_0;
wire [d-1:0] i7_0;
wire [d-1:0] t1_0;
wire [d-1:0] t10_0;
wire [d-1:0] t11_0;
wire [d-1:0] t12_0;
wire [d-1:0] t13_0;
wire [d-1:0] t14_0;
wire [d-1:0] t15_0;
wire [d-1:0] t16_0;
wire [d-1:0] t17_0;
wire [d-1:0] t18_0;
wire [d-1:0] t19_0;
wire [d-1:0] t2_0;
wire [d-1:0] t20_0;
wire [d-1:0] t21_0;
wire [d-1:0] t22_0;
wire [d-1:0] t23_0;
wire [d-1:0] t24_0;
wire [d-1:0] t25_0;
wire [d-1:0] t26_0;
wire [d-1:0] t27_0;
wire [d-1:0] t3_0;
wire [d-1:0] t4_0;
wire [d-1:0] t5_0;
wire [d-1:0] t6_0;
wire [d-1:0] t7_0;
wire [d-1:0] t8_0;
wire [d-1:0] t9_0;
assign i0_0 = i0;
assign i1_0 = i1;
assign i2_0 = i2;
assign i3_0 = i3;
assign i4_0 = i4;
assign i5_0 = i5;
assign i6_0 = i6;
assign i7_0 = i7;
assign t1 = t1_0;
assign t2 = t2_0;
assign t3 = t3_0;
assign t4 = t4_0;
assign t5 = t5_0;
assign t6 = t6_0;
assign t7 = t7_0;
assign t8 = t8_0;
assign t9 = t9_0;
assign t10 = t10_0;
assign t11 = t11_0;
assign t12 = t12_0;
assign t13 = t13_0;
assign t14 = t14_0;
assign t15 = t15_0;
assign t16 = t16_0;
assign t17 = t17_0;
assign t18 = t18_0;
assign t19 = t19_0;
assign t20 = t20_0;
assign t21 = t21_0;
assign t22 = t22_0;
assign t23 = t23_0;
assign t24 = t24_0;
assign t25 = t25_0;
assign t26 = t26_0;
assign t27 = t27_0;




MSKxor #(.d(d)) comp_t1_0 (
    .out(t1_0),
    .ina(i7_0),
    .inb(i4_0)
);
MSKxor #(.d(d)) comp_t2_0 (
    .out(t2_0),
    .ina(i7_0),
    .inb(i2_0)
);
MSKxor #(.d(d)) comp_t3_0 (
    .out(t3_0),
    .ina(i7_0),
    .inb(i1_0)
);
MSKxor #(.d(d)) comp_t4_0 (
    .out(t4_0),
    .ina(i4_0),
    .inb(i2_0)
);
MSKxor #(.d(d)) comp_t5_0 (
    .out(t5_0),
    .ina(i3_0),
    .inb(i1_0)
);
MSKxor #(.d(d)) comp_t6_0 (
    .out(t6_0),
    .ina(t1_0),
    .inb(t5_0)
);
MSKxor #(.d(d)) comp_t7_0 (
    .out(t7_0),
    .ina(i6_0),
    .inb(i5_0)
);
MSKxor #(.d(d)) comp_t8_0 (
    .out(t8_0),
    .ina(i0_0),
    .inb(t6_0)
);
MSKxor #(.d(d)) comp_t9_0 (
    .out(t9_0),
    .ina(i0_0),
    .inb(t7_0)
);
MSKxor #(.d(d)) comp_t10_0 (
    .out(t10_0),
    .ina(t6_0),
    .inb(t7_0)
);
MSKxor #(.d(d)) comp_t11_0 (
    .out(t11_0),
    .ina(i6_0),
    .inb(i2_0)
);
MSKxor #(.d(d)) comp_t12_0 (
    .out(t12_0),
    .ina(i5_0),
    .inb(i2_0)
);
MSKxor #(.d(d)) comp_t13_0 (
    .out(t13_0),
    .ina(t3_0),
    .inb(t4_0)
);
MSKxor #(.d(d)) comp_t14_0 (
    .out(t14_0),
    .ina(t6_0),
    .inb(t11_0)
);
MSKxor #(.d(d)) comp_t15_0 (
    .out(t15_0),
    .ina(t5_0),
    .inb(t11_0)
);
MSKxor #(.d(d)) comp_t16_0 (
    .out(t16_0),
    .ina(t5_0),
    .inb(t12_0)
);
MSKxor #(.d(d)) comp_t17_0 (
    .out(t17_0),
    .ina(t9_0),
    .inb(t16_0)
);
MSKxor #(.d(d)) comp_t18_0 (
    .out(t18_0),
    .ina(i4_0),
    .inb(i0_0)
);
MSKxor #(.d(d)) comp_t19_0 (
    .out(t19_0),
    .ina(t7_0),
    .inb(t18_0)
);
MSKxor #(.d(d)) comp_t20_0 (
    .out(t20_0),
    .ina(t1_0),
    .inb(t19_0)
);
MSKxor #(.d(d)) comp_t21_0 (
    .out(t21_0),
    .ina(i1_0),
    .inb(i0_0)
);
MSKxor #(.d(d)) comp_t22_0 (
    .out(t22_0),
    .ina(t7_0),
    .inb(t21_0)
);
MSKxor #(.d(d)) comp_t23_0 (
    .out(t23_0),
    .ina(t2_0),
    .inb(t22_0)
);
MSKxor #(.d(d)) comp_t24_0 (
    .out(t24_0),
    .ina(t2_0),
    .inb(t10_0)
);
MSKxor #(.d(d)) comp_t25_0 (
    .out(t25_0),
    .ina(t20_0),
    .inb(t17_0)
);
MSKxor #(.d(d)) comp_t26_0 (
    .out(t26_0),
    .ina(t3_0),
    .inb(t16_0)
);
MSKxor #(.d(d)) comp_t27_0 (
    .out(t27_0),
    .ina(t1_0),
    .inb(t12_0)
);
endmodule
