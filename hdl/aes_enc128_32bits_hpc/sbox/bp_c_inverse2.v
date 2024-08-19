`timescale 1ns/1ps

// latency = 0

// Fully pipeline PINI circuit in 0 clock cycles.
// This file has been automatically generated.
`ifdef FULLVERIF
(* fv_prop = "PINI", fv_strat = "composite", fv_order=d *)
`endif
module bp_c_inverse2 # ( parameter d=2 ) (
    clk,
    m1,
    m2,
    m3,
    m4,
    m5,
    m6,
    m7,
    m8,
    m9,
    m10,
    m11,
    m12,
    m13,
    m14,
    m15,
    m16,
    m17,
    m18,
    m19,
    m20,
    m21,
    m22,
    m23,
    m24,
    m25,
    m26,
    m27,
    m28,
    m29,
    m30,
    m31,
    m32,
    m33,
    m34,
    m35,
    m36,
    m37,
    m38,
    m39,
    m40,
    m41,
    m42,
    m43,
    m44,
    m45,
    m46,
    m47,
    m48,
    m49,
    m50,
    m51,
    m52,
    m53,
    m54,
    m55,
    m56,
    m57,
    m58,
    m59,
    m60,
    m61,
    m62,
    m63,
    o0,
    o1,
    o2,
    o3,
    o4,
    o5,
    o6,
    o7,
);
`include "MSKand_hpc1.vh"
`include "MSKand_hpc2.vh"
`include "MSKand_hpc3.vh"
(* fv_type="clock" *)
input clk;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m1;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m2;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m3;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m4;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m5;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m6;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m7;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m8;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m9;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m10;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m11;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m12;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m13;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m14;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m15;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m16;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m17;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m18;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m19;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m20;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m21;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m22;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m23;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m24;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m25;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m26;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m27;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m28;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m29;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m30;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m31;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m32;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m33;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m34;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m35;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m36;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m37;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m38;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m39;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m40;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m41;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m42;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m43;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m44;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m45;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m46;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m47;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m48;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m49;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m50;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m51;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m52;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m53;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m54;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m55;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m56;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m57;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m58;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m59;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m60;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m61;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m62;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
input [d-1:0] m63;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o0;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o1;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o2;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o3;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o4;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o5;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o6;
(* fv_type="sharing", fv_latency=0, fv_count=1 *)
output [d-1:0] o7;
wire [d-1:0] m1_0;
wire [d-1:0] m10_0;
wire [d-1:0] m11_0;
wire [d-1:0] m12_0;
wire [d-1:0] m13_0;
wire [d-1:0] m14_0;
wire [d-1:0] m15_0;
wire [d-1:0] m16_0;
wire [d-1:0] m17_0;
wire [d-1:0] m18_0;
wire [d-1:0] m19_0;
wire [d-1:0] m2_0;
wire [d-1:0] m20_0;
wire [d-1:0] m21_0;
wire [d-1:0] m22_0;
wire [d-1:0] m23_0;
wire [d-1:0] m24_0;
wire [d-1:0] m25_0;
wire [d-1:0] m26_0;
wire [d-1:0] m27_0;
wire [d-1:0] m28_0;
wire [d-1:0] m29_0;
wire [d-1:0] m3_0;
wire [d-1:0] m30_0;
wire [d-1:0] m31_0;
wire [d-1:0] m32_0;
wire [d-1:0] m33_0;
wire [d-1:0] m34_0;
wire [d-1:0] m35_0;
wire [d-1:0] m36_0;
wire [d-1:0] m37_0;
wire [d-1:0] m38_0;
wire [d-1:0] m39_0;
wire [d-1:0] m4_0;
wire [d-1:0] m40_0;
wire [d-1:0] m41_0;
wire [d-1:0] m42_0;
wire [d-1:0] m43_0;
wire [d-1:0] m44_0;
wire [d-1:0] m45_0;
wire [d-1:0] m46_0;
wire [d-1:0] m47_0;
wire [d-1:0] m48_0;
wire [d-1:0] m49_0;
wire [d-1:0] m5_0;
wire [d-1:0] m50_0;
wire [d-1:0] m51_0;
wire [d-1:0] m52_0;
wire [d-1:0] m53_0;
wire [d-1:0] m54_0;
wire [d-1:0] m55_0;
wire [d-1:0] m56_0;
wire [d-1:0] m57_0;
wire [d-1:0] m58_0;
wire [d-1:0] m59_0;
wire [d-1:0] m6_0;
wire [d-1:0] m60_0;
wire [d-1:0] m61_0;
wire [d-1:0] m62_0;
wire [d-1:0] m63_0;
wire [d-1:0] m7_0;
wire [d-1:0] m8_0;
wire [d-1:0] m9_0;
wire [d-1:0] o0_0;
wire [d-1:0] o1_0;
wire [d-1:0] o2_0;
wire [d-1:0] o3_0;
wire [d-1:0] o4_0;
wire [d-1:0] o5_0;
wire [d-1:0] o6_0;
wire [d-1:0] o7_0;
wire [d-1:0] p0_0;
wire [d-1:0] p1_0;
wire [d-1:0] p10_0;
wire [d-1:0] p11_0;
wire [d-1:0] p12_0;
wire [d-1:0] p13_0;
wire [d-1:0] p14_0;
wire [d-1:0] p15_0;
wire [d-1:0] p16_0;
wire [d-1:0] p17_0;
wire [d-1:0] p18_0;
wire [d-1:0] p19_0;
wire [d-1:0] p2_0;
wire [d-1:0] p20_0;
wire [d-1:0] p22_0;
wire [d-1:0] p23_0;
wire [d-1:0] p24_0;
wire [d-1:0] p25_0;
wire [d-1:0] p26_0;
wire [d-1:0] p27_0;
wire [d-1:0] p28_0;
wire [d-1:0] p29_0;
wire [d-1:0] p3_0;
wire [d-1:0] p4_0;
wire [d-1:0] p5_0;
wire [d-1:0] p6_0;
wire [d-1:0] p7_0;
wire [d-1:0] p8_0;
wire [d-1:0] p9_0;
assign m1_0 = m1;
assign m2_0 = m2;
assign m3_0 = m3;
assign m4_0 = m4;
assign m5_0 = m5;
assign m6_0 = m6;
assign m7_0 = m7;
assign m8_0 = m8;
assign m9_0 = m9;
assign m10_0 = m10;
assign m11_0 = m11;
assign m12_0 = m12;
assign m13_0 = m13;
assign m14_0 = m14;
assign m15_0 = m15;
assign m16_0 = m16;
assign m17_0 = m17;
assign m18_0 = m18;
assign m19_0 = m19;
assign m20_0 = m20;
assign m21_0 = m21;
assign m22_0 = m22;
assign m23_0 = m23;
assign m24_0 = m24;
assign m25_0 = m25;
assign m26_0 = m26;
assign m27_0 = m27;
assign m28_0 = m28;
assign m29_0 = m29;
assign m30_0 = m30;
assign m31_0 = m31;
assign m32_0 = m32;
assign m33_0 = m33;
assign m34_0 = m34;
assign m35_0 = m35;
assign m36_0 = m36;
assign m37_0 = m37;
assign m38_0 = m38;
assign m39_0 = m39;
assign m40_0 = m40;
assign m41_0 = m41;
assign m42_0 = m42;
assign m43_0 = m43;
assign m44_0 = m44;
assign m45_0 = m45;
assign m46_0 = m46;
assign m47_0 = m47;
assign m48_0 = m48;
assign m49_0 = m49;
assign m50_0 = m50;
assign m51_0 = m51;
assign m52_0 = m52;
assign m53_0 = m53;
assign m54_0 = m54;
assign m55_0 = m55;
assign m56_0 = m56;
assign m57_0 = m57;
assign m58_0 = m58;
assign m59_0 = m59;
assign m60_0 = m60;
assign m61_0 = m61;
assign m62_0 = m62;
assign m63_0 = m63;
assign o0 = o0_0;
assign o1 = o1_0;
assign o2 = o2_0;
assign o3 = o3_0;
assign o4 = o4_0;
assign o5 = o5_0;
assign o6 = o6_0;
assign o7 = o7_0;




MSKxor #(.d(d)) comp_p0_0 (
    .out(p0_0),
    .ina(m52_0),
    .inb(m61_0)
);
MSKxor #(.d(d)) comp_p1_0 (
    .out(p1_0),
    .ina(m58_0),
    .inb(m59_0)
);
MSKxor #(.d(d)) comp_p2_0 (
    .out(p2_0),
    .ina(m54_0),
    .inb(m62_0)
);
MSKxor #(.d(d)) comp_p3_0 (
    .out(p3_0),
    .ina(m47_0),
    .inb(m50_0)
);
MSKxor #(.d(d)) comp_p4_0 (
    .out(p4_0),
    .ina(m48_0),
    .inb(m56_0)
);
MSKxor #(.d(d)) comp_p5_0 (
    .out(p5_0),
    .ina(m46_0),
    .inb(m51_0)
);
MSKxor #(.d(d)) comp_p6_0 (
    .out(p6_0),
    .ina(m49_0),
    .inb(m60_0)
);
MSKxor #(.d(d)) comp_p7_0 (
    .out(p7_0),
    .ina(p0_0),
    .inb(p1_0)
);
MSKxor #(.d(d)) comp_p8_0 (
    .out(p8_0),
    .ina(m50_0),
    .inb(m53_0)
);
MSKxor #(.d(d)) comp_p9_0 (
    .out(p9_0),
    .ina(m55_0),
    .inb(m63_0)
);
MSKxor #(.d(d)) comp_p10_0 (
    .out(p10_0),
    .ina(m57_0),
    .inb(p4_0)
);
MSKxor #(.d(d)) comp_p11_0 (
    .out(p11_0),
    .ina(p0_0),
    .inb(p3_0)
);
MSKxor #(.d(d)) comp_p12_0 (
    .out(p12_0),
    .ina(m46_0),
    .inb(m48_0)
);
MSKxor #(.d(d)) comp_p13_0 (
    .out(p13_0),
    .ina(m49_0),
    .inb(m51_0)
);
MSKxor #(.d(d)) comp_p14_0 (
    .out(p14_0),
    .ina(m49_0),
    .inb(m62_0)
);
MSKxor #(.d(d)) comp_p15_0 (
    .out(p15_0),
    .ina(m54_0),
    .inb(m59_0)
);
MSKxor #(.d(d)) comp_p16_0 (
    .out(p16_0),
    .ina(m57_0),
    .inb(m61_0)
);
MSKxor #(.d(d)) comp_p17_0 (
    .out(p17_0),
    .ina(m58_0),
    .inb(p2_0)
);
MSKxor #(.d(d)) comp_p18_0 (
    .out(p18_0),
    .ina(m63_0),
    .inb(p5_0)
);
MSKxor #(.d(d)) comp_p19_0 (
    .out(p19_0),
    .ina(p2_0),
    .inb(p3_0)
);
MSKxor #(.d(d)) comp_p20_0 (
    .out(p20_0),
    .ina(p4_0),
    .inb(p6_0)
);
MSKxor #(.d(d)) comp_p22_0 (
    .out(p22_0),
    .ina(p2_0),
    .inb(p7_0)
);
MSKxor #(.d(d)) comp_p23_0 (
    .out(p23_0),
    .ina(p7_0),
    .inb(p8_0)
);
MSKxor #(.d(d)) comp_p24_0 (
    .out(p24_0),
    .ina(p5_0),
    .inb(p7_0)
);
MSKxor #(.d(d)) comp_p25_0 (
    .out(p25_0),
    .ina(p6_0),
    .inb(p10_0)
);
MSKxor #(.d(d)) comp_p26_0 (
    .out(p26_0),
    .ina(p9_0),
    .inb(p11_0)
);
MSKxor #(.d(d)) comp_p27_0 (
    .out(p27_0),
    .ina(p10_0),
    .inb(p18_0)
);
MSKxor #(.d(d)) comp_p28_0 (
    .out(p28_0),
    .ina(p11_0),
    .inb(p25_0)
);
MSKxor #(.d(d)) comp_p29_0 (
    .out(p29_0),
    .ina(p15_0),
    .inb(p20_0)
);
MSKxor #(.d(d)) comp_o7_0 (
    .out(o7_0),
    .ina(p13_0),
    .inb(p22_0)
);
MSKxor #(.d(d)) comp_o6_0 (
    .out(o6_0),
    .ina(p26_0),
    .inb(p29_0)
);
MSKxor #(.d(d)) comp_o5_0 (
    .out(o5_0),
    .ina(p17_0),
    .inb(p28_0)
);
MSKxor #(.d(d)) comp_o4_0 (
    .out(o4_0),
    .ina(p12_0),
    .inb(p22_0)
);
MSKxor #(.d(d)) comp_o3_0 (
    .out(o3_0),
    .ina(p23_0),
    .inb(p27_0)
);
MSKxor #(.d(d)) comp_o2_0 (
    .out(o2_0),
    .ina(p19_0),
    .inb(p24_0)
);
MSKxor #(.d(d)) comp_o1_0 (
    .out(o1_0),
    .ina(p14_0),
    .inb(p23_0)
);
MSKxor #(.d(d)) comp_o0_0 (
    .out(o0_0),
    .ina(p9_0),
    .inb(p16_0)
);
endmodule
