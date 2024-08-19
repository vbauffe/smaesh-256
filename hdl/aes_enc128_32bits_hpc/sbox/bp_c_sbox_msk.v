(* fv_prop = "PINI", fv_strat = "composite", fv_order=d *)
module bp_c_sbox_msk
#
(
    parameter d=2
)
(
    	// Circuit inputs IOs
	clk,
    inverse_in,
    inverse_out,
	i0,
	i1,
	i2,
	i3,
	i4,
	i5,
	i6,
	i7,
	rnd_0,
	rnd_1,
	rnd_2,
	// Circuit outputs IOs
	o0,
	o1,
	o2,
	o3,
	o4,
	o5,
	o6,
	o7

);

`include "design.vh"

// Inputs ports
(* fv_type="clock" *)
input clk;
input inverse_in;
input inverse_out;
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
input [rnd_bus0-1:0] rnd_0;
input [rnd_bus1-1:0] rnd_1;
input [rnd_bus2-1:0] rnd_2;

// Outputs ports
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o0;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o1;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o2;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o3;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o4;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o5;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o6;
(* fv_type="sharing", fv_latency=6, fv_count=1 *)
output [d-1:0] o7;

// Internal variables
wire [d-1:0] t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27;
wire [d-1:0] ft1, ft2, ft3, ft4, ft5, ft6, ft7, ft8, ft9, ft10, ft11, ft12, ft13, ft14, ft15, ft16, ft17, ft18, ft19, ft20, ft21, ft22, ft23, ft24, ft25, ft26, ft27;
wire [d-1:0] it1, it2, it3, it4, it6, it8, it9, it10, it13, it14, it15, it16, it17, it19, it20, it22, it23, it24, it25, it26, it27;
wire [d-1:0] m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m32, m33, m34, m35, m36, m37, m38, m39, m40, m41, m42, m43, m44, m45, m46, m47, m48, m49, m50, m51, m52, m53, m54, m55, m56, m57, m58, m59, m60, m61, m62, m63;
wire [d-1:0] y5;
wire [d-1:0] w0, w1, w2, w3, w4, w5, w6, w7;
wire [d-1:0] s0, s1, s2, s3, s4, s5, s6, s7;


bp_c_forward1 #(.d(d))
    sbox_forward1(
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .t1(ft1),
        .t2(ft2),
        .t3(ft3),
        .t4(ft4),
        .t5(t5),
        .t6(ft6),
        .t7(t7),
        .t8(ft8),
        .t9(ft9),
        .t10(ft10),
        .t11(t11),
        .t12(t12),
        .t13(ft13),
        .t14(ft14),
        .t15(ft15),
        .t16(ft16),
        .t17(ft17),
        .t18(t18),
        .t19(ft19),
        .t20(ft20),
        .t21(t21),
        .t22(ft22),
        .t23(ft23),
        .t24(ft24),
        .t25(ft25),
        .t26(ft26),
        .t27(ft27)
    );

bp_c_inverse1 #(.d(d))
    sbox_inverse1(
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .t1(it1),
        .t2(it2),
        .t3(it3),
        .t4(it4),
        .t6(it6),
        .t8(it8),
        .t9(it9),
        .t10(it10),
        .t13(it13),
        .t14(it14),
        .t15(it15),
        .t16(it16),
        .t17(it17),
        .t19(it19),
        .t20(it20),
        .t22(it22),
        .t23(it23),
        .t24(it24),
        .t25(it25),
        .t26(it26),
        .t27(it27),
        .y5(y5)
    );

wire [d-1:0] ds;
MSKmux #(.d(d),.count(1))
mux_ds(
    .sel(inverse_in),
    .in_true(y5),
    .in_false(i0), // Or i7 depending on endian
    .out(ds)
);

MSKmux #(.d(d),.count(1))
mux_t1(
    .sel(inverse_in),
    .in_true(it1),
    .in_false(ft1),
    .out(t1)
);

MSKmux #(.d(d),.count(1))
mux_t2(
    .sel(inverse_in),
    .in_true(it2),
    .in_false(ft2),
    .out(t2)
);

MSKmux #(.d(d),.count(1))
mux_t3(
    .sel(inverse_in),
    .in_true(it3),
    .in_false(ft3),
    .out(t3)
);

MSKmux #(.d(d),.count(1))
mux_t4(
    .sel(inverse_in),
    .in_true(it4),
    .in_false(ft4),
    .out(t4)
);

MSKmux #(.d(d),.count(1))
mux_t6(
    .sel(inverse_in),
    .in_true(it6),
    .in_false(ft6),
    .out(t6)
);

MSKmux #(.d(d),.count(1))
mux_t8(
    .sel(inverse_in),
    .in_true(it8),
    .in_false(ft8),
    .out(t8)
);

MSKmux #(.d(d),.count(1))
mux_t9(
    .sel(inverse_in),
    .in_true(it9),
    .in_false(ft9),
    .out(t9)
);

MSKmux #(.d(d),.count(1))
mux_t10(
    .sel(inverse_in),
    .in_true(it10),
    .in_false(ft10),
    .out(t10)
);

MSKmux #(.d(d),.count(1))
mux_t13(
    .sel(inverse_in),
    .in_true(it13),
    .in_false(ft13),
    .out(t13)
);

MSKmux #(.d(d),.count(1))
mux_t14(
    .sel(inverse_in),
    .in_true(it14),
    .in_false(ft14),
    .out(t14)
);

MSKmux #(.d(d),.count(1))
mux_t15(
    .sel(inverse_in),
    .in_true(it15),
    .in_false(ft15),
    .out(t15)
);

MSKmux #(.d(d),.count(1))
mux_t16(
    .sel(inverse_in),
    .in_true(it16),
    .in_false(ft16),
    .out(t16)
);

MSKmux #(.d(d),.count(1))
mux_t17(
    .sel(inverse_in),
    .in_true(it17),
    .in_false(ft17),
    .out(t17)
);

MSKmux #(.d(d),.count(1))
mux_t19(
    .sel(inverse_in),
    .in_true(it19),
    .in_false(ft19),
    .out(t19)
);

MSKmux #(.d(d),.count(1))
mux_t20(
    .sel(inverse_in),
    .in_true(it20),
    .in_false(ft20),
    .out(t20)
);

MSKmux #(.d(d),.count(1))
mux_t22(
    .sel(inverse_in),
    .in_true(it22),
    .in_false(ft22),
    .out(t22)
);

MSKmux #(.d(d),.count(1))
mux_t23(
    .sel(inverse_in),
    .in_true(it23),
    .in_false(ft23),
    .out(t23)
);

MSKmux #(.d(d),.count(1))
mux_t24(
    .sel(inverse_in),
    .in_true(it24),
    .in_false(ft24),
    .out(t24)
);

MSKmux #(.d(d),.count(1))
mux_t25(
    .sel(inverse_in),
    .in_true(it25),
    .in_false(ft25),
    .out(t25)
);

MSKmux #(.d(d),.count(1))
mux_t26(
    .sel(inverse_in),
    .in_true(it26),
    .in_false(ft26),
    .out(t26)
);

MSKmux #(.d(d),.count(1))
mux_t27(
    .sel(inverse_in),
    .in_true(it27),
    .in_false(ft27),
    .out(t27)
);

bp_c_common #(.d(d))
    sbox_common(
        .clk(clk),
        .t1(t1),
        .t2(t2),
        .t3(t3),
        .t4(t4),
        .t5(t5),
        .t6(t6),
        .t7(t7),
        .t8(t8),
        .t9(t9),
        .t10(t10),
        .t11(t11),
        .t12(t12),
        .t13(t13),
        .t14(t14),
        .t15(t15),
        .t16(t16),
        .t17(t17),
        .t18(t18),
        .t19(t19),
        .t20(t20),
        .t21(t21),
        .t22(t22),
        .t23(t23),
        .t24(t24),
        .t25(t25),
        .t26(t26),
        .t27(t27),
        .ds(ds),
        .rnd_0(rnd_0),
        .rnd_1(rnd_1),
        .rnd_2(rnd_2),
        // Circuit outputs IOs
        .m1(m1),
        .m2(m2),
        .m3(m3),
        .m4(m4),
        .m5(m5),
        .m6(m6),
        .m7(m7),
        .m8(m8),
        .m9(m9),
        .m10(m10),
        .m11(m11),
        .m12(m12),
        .m13(m13),
        .m14(m14),
        .m15(m15),
        .m16(m16),
        .m17(m17),
        .m18(m18),
        .m19(m19),
        .m20(m20),
        .m21(m21),
        .m22(m22),
        .m23(m23),
        .m24(m24),
        .m25(m25),
        .m26(m26),
        .m27(m27),
        .m28(m28),
        .m29(m29),
        .m30(m30),
        .m31(m31),
        .m32(m32),
        .m33(m33),
        .m34(m34),
        .m35(m35),
        .m36(m36),
        .m37(m37),
        .m38(m38),
        .m39(m39),
        .m40(m40),
        .m41(m41),
        .m42(m42),
        .m43(m43),
        .m44(m44),
        .m45(m45),
        .m46(m46),
        .m47(m47),
        .m48(m48),
        .m49(m49),
        .m50(m50),
        .m51(m51),
        .m52(m52),
        .m53(m53),
        .m54(m54),
        .m55(m55),
        .m56(m56),
        .m57(m57),
        .m58(m58),
        .m59(m59),
        .m60(m60),
        .m61(m61),
        .m62(m62),
        .m63(m63)
    );

bp_c_forward2 #(.d(d))
    sbox_forward2(
        .m1(m1),
        .m2(m2),
        .m3(m3),
        .m4(m4),
        .m5(m5),
        .m6(m6),
        .m7(m7),
        .m8(m8),
        .m9(m9),
        .m10(m10),
        .m11(m11),
        .m12(m12),
        .m13(m13),
        .m14(m14),
        .m15(m15),
        .m16(m16),
        .m17(m17),
        .m18(m18),
        .m19(m19),
        .m20(m20),
        .m21(m21),
        .m22(m22),
        .m23(m23),
        .m24(m24),
        .m25(m25),
        .m26(m26),
        .m27(m27),
        .m28(m28),
        .m29(m29),
        .m30(m30),
        .m31(m31),
        .m32(m32),
        .m33(m33),
        .m34(m34),
        .m35(m35),
        .m36(m36),
        .m37(m37),
        .m38(m38),
        .m39(m39),
        .m40(m40),
        .m41(m41),
        .m42(m42),
        .m43(m43),
        .m44(m44),
        .m45(m45),
        .m46(m46),
        .m47(m47),
        .m48(m48),
        .m49(m49),
        .m50(m50),
        .m51(m51),
        .m52(m52),
        .m53(m53),
        .m54(m54),
        .m55(m55),
        .m56(m56),
        .m57(m57),
        .m58(m58),
        .m59(m59),
        .m60(m60),
        .m61(m61),
        .m62(m62),
        .m63(m63),
        .o0(s0),
        .o1(s1),
        .o2(s2),
        .o3(s3),
        .o4(s4),
        .o5(s5),
        .o6(s6),
        .o7(s7)
    );

bp_c_inverse2 #(.d(d))
    sbox_inverse2(
        .m1(m1),
        .m2(m2),
        .m3(m3),
        .m4(m4),
        .m5(m5),
        .m6(m6),
        .m7(m7),
        .m8(m8),
        .m9(m9),
        .m10(m10),
        .m11(m11),
        .m12(m12),
        .m13(m13),
        .m14(m14),
        .m15(m15),
        .m16(m16),
        .m17(m17),
        .m18(m18),
        .m19(m19),
        .m20(m20),
        .m21(m21),
        .m22(m22),
        .m23(m23),
        .m24(m24),
        .m25(m25),
        .m26(m26),
        .m27(m27),
        .m28(m28),
        .m29(m29),
        .m30(m30),
        .m31(m31),
        .m32(m32),
        .m33(m33),
        .m34(m34),
        .m35(m35),
        .m36(m36),
        .m37(m37),
        .m38(m38),
        .m39(m39),
        .m40(m40),
        .m41(m41),
        .m42(m42),
        .m43(m43),
        .m44(m44),
        .m45(m45),
        .m46(m46),
        .m47(m47),
        .m48(m48),
        .m49(m49),
        .m50(m50),
        .m51(m51),
        .m52(m52),
        .m53(m53),
        .m54(m54),
        .m55(m55),
        .m56(m56),
        .m57(m57),
        .m58(m58),
        .m59(m59),
        .m60(m60),
        .m61(m61),
        .m62(m62),
        .m63(m63),
        .o0(w0),
        .o1(w1),
        .o2(w2),
        .o3(w3),
        .o4(w4),
        .o5(w5),
        .o6(w6),
        .o7(w7)
    );

MSKmux #(.d(d),.count(1))
mux_o0(
    .sel(inverse_out),
    .in_true(w0),
    .in_false(s0),
    .out(o0)
);

MSKmux #(.d(d),.count(1))
mux_o1(
    .sel(inverse_out),
    .in_true(w1),
    .in_false(s1),
    .out(o1)
);

MSKmux #(.d(d),.count(1))
mux_o2(
    .sel(inverse_out),
    .in_true(w2),
    .in_false(s2),
    .out(o2)
);

MSKmux #(.d(d),.count(1))
mux_o3(
    .sel(inverse_out),
    .in_true(w3),
    .in_false(s3),
    .out(o3)
);

MSKmux #(.d(d),.count(1))
mux_o4(
    .sel(inverse_out),
    .in_true(w4),
    .in_false(s4),
    .out(o4)
);

MSKmux #(.d(d),.count(1))
mux_o5(
    .sel(inverse_out),
    .in_true(w5),
    .in_false(s5),
    .out(o5)
);

MSKmux #(.d(d),.count(1))
mux_o6(
    .sel(inverse_out),
    .in_true(w6),
    .in_false(s6),
    .out(o6)
);

MSKmux #(.d(d),.count(1))
mux_o7(
    .sel(inverse_out),
    .in_true(w7),
    .in_false(s7),
    .out(o7)
);

endmodule