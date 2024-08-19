module unmsk_sbox
#
(
    parameter d=2
)
(
    input  clk,
    input inverse,
    input  u0, u1, u2, u3, u4, u5, u6, u7,
    output o0, o1, o2, o3, o4, o5, o6, o7
);

`include "design.vh"

wire t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27;
wire ft1, ft2, ft3, ft4, ft5, ft6, ft7, ft8, ft9, ft10, ft11, ft12, ft13, ft14, ft15, ft16, ft17, ft18, ft19, ft20, ft21, ft22, ft23, ft24, ft25, ft26, ft27;
wire rt1, rt2, rt3, rt4, rt6, rt8, rt9, rt10, rt13, rt14, rt15, rt16, rt17, rt19, rt20, rt22, rt23, rt24, rt25, rt26, rt27;
wire m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25, m26, m27, m28, m29, m30, m31, m32, m33, m34, m35, m36, m37, m38, m39, m40, m41, m42, m43, m44, m45, m46, m47, m48, m49, m50, m51, m52, m53, m54, m55, m56, m57, m58, m59, m60, m61, m62, m63;
wire p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p22, p23, p24, p25, p26, p27, p28, p29;
wire r5, r13, r17, r18, r19;
wire l0, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, l25, l26, l27, l28, l29;
wire y5;
wire dd;
wire w0, w1, w2, w3, w4, w5, w6, w7;
wire s0, s1, s2, s3, s4, s5, s6, s7;

// Forward
sbox_xor fxor0 (u0, u3, ft1);
sbox_xor fxor1 (u0, u5, ft2);
sbox_xor fxor2 (u0, u6, ft3);
sbox_xor fxor3 (u3, u5, ft4);
sbox_xor fxor4 (u4, u6, t5);
sbox_xor fxor5 (ft1, t5, ft6);
sbox_xor fxor6 (u1, u2, t7);
sbox_xor fxor7 (u7, ft6, ft8);
sbox_xor fxor8 (u7, t7, ft9);
sbox_xor fxor9 (ft6, t7, ft10);
sbox_xor fxor10 (u1, u5, t11);
sbox_xor fxor11 (u2, u5, t12);
sbox_xor fxor12 (ft3, ft4, ft13);
sbox_xor fxor13 (ft6, t11, ft14);
sbox_xor fxor14 (t5, t11, ft15);
sbox_xor fxor15 (t5, t12, ft16);
sbox_xor fxor16 (ft9, ft16, ft17);
sbox_xor fxor17 (u3, u7, t18);
sbox_xor fxor18 (t7, t18, ft19);
sbox_xor fxor19 (ft1, ft19, ft20);
sbox_xor fxor20 (u6, u7, t21);
sbox_xor fxor21 (t7, t21, ft22);
sbox_xor fxor22 (ft2, ft22, ft23);
sbox_xor fxor23 (ft2, ft10, ft24);
sbox_xor fxor24 (ft20, ft17, ft25);
sbox_xor fxor25 (ft3, ft16, ft26);
sbox_xor fxor26 (ft1, t12, ft27);

// Reverse
sbox_xor xor0 (u0, u3, rt23);
sbox_xnor xnor0 (u1, u3, rt22);
sbox_xnor xnor1 (u0, u1, rt2);
sbox_xor xor1 (u3, u4, rt1);
sbox_xnor xnor2 (u4, u7, rt24);
sbox_xor xor2 (u6, u7, r5);
sbox_xnor xnor3 (u1, rt23, rt8);
sbox_xor xor3 (rt22, r5, rt19);
sbox_xnor xnor4 (u7, rt1, rt9);
sbox_xor xor4 (rt2, rt24, rt10);
sbox_xor xor5 (rt2, r5, rt13);
sbox_xor xor6 (rt1, r5, rt3);
sbox_xnor xnor5 (u2, rt1, rt25);
sbox_xor xor7 (u1, u6, r13);
sbox_xnor xnor6 (u2, rt19, rt17);
sbox_xor xor8 (rt24, r13, rt20);
sbox_xor xor9 (u4, rt8, rt4);
sbox_xnor xnor7 (u2, u5, r17);
sbox_xnor xnor8 (u5, u6, r18);
sbox_xnor xnor9 (u2, u4, r19);
sbox_xor xor10 (u0, r17, y5);
sbox_xor xor11 (rt22, r17, rt6);
sbox_xor xor12 (r13, r19, rt16);
sbox_xor xor13 (rt1, r18, rt27);
sbox_xor xor14 (rt10, rt27, rt15);
sbox_xor xor15 (rt10, r18, rt14);
sbox_xor xor16 (rt3, rt16, rt26);

assign t1 = inverse ? rt1 : ft1;
assign t2 = inverse ? rt2 : ft2;
assign t3 = inverse ? rt3 : ft3;
assign t4 = inverse ? rt4 : ft4;
// assign t5 = inverse ? rt5 : ft5;
assign t6 = inverse ? rt6 : ft6;
// assign t7 = inverse ? rt7 : ft7;
assign t8 = inverse ? rt8 : ft8;
assign t9 = inverse ? rt9 : ft9;
assign t10 = inverse ? rt10 : ft10;
// assign t11 = inverse ? rt11 : ft11;
// assign t12 = inverse ? rt12 : ft12;
assign t13 = inverse ? rt13 : ft13;
assign t14 = inverse ? rt14 : ft14;
assign t15 = inverse ? rt15 : ft15;
assign t16 = inverse ? rt16 : ft16;
assign t17 = inverse ? rt17 : ft17;
// assign t18 = inverse ? rt18 : ft18;
assign t19 = inverse ? rt19 : ft19;
assign t20 = inverse ? rt20 : ft20;
// assign t21 = inverse ? rt21 : ft21;
assign t22 = inverse ? rt22 : ft22;
assign t23 = inverse ? rt23 : ft23;
assign t24 = inverse ? rt24 : ft24;
assign t25 = inverse ? rt25 : ft25;
assign t26 = inverse ? rt26 : ft26;
assign t27 = inverse ? rt27 : ft27;
assign dd = inverse ? y5 : u7;

// Common
sbox_and and0 (t13, t6, m1);
sbox_and and1 (t23, t8, m2);
sbox_xor xor17 (t14, m1, m3);
sbox_and and2 (t19, dd, m4);
sbox_xor xor18 (m4, m1, m5);
sbox_and and3 (t3, t16, m6);
sbox_and and4 (t22, t9, m7);
sbox_xor xor19 (t26, m6, m8);
sbox_and and5 (t20, t17, m9);
sbox_xor xor20 (m9, m6, m10);
sbox_and and6 (t1, t15, m11);
sbox_and and7 (t4, t27, m12);
sbox_xor xor21 (m12, m11, m13);
sbox_and and8 (t2, t10, m14);
sbox_xor xor22 (m14, m11, m15);
sbox_xor xor23 (m3, m2, m16);
sbox_xor xor24 (m5, t24, m17);
sbox_xor xor25 (m8, m7, m18);
sbox_xor xor26 (m10, m15, m19);
sbox_xor xor27 (m16, m13, m20);
sbox_xor xor28 (m17, m15, m21);
sbox_xor xor29 (m18, m13, m22);
sbox_xor xor30 (m19, t25, m23);
sbox_xor xor31 (m22, m23, m24);
sbox_and and9  (m22, m20, m25);
sbox_xor xor32 (m21, m25, m26);
sbox_xor xor33 (m20, m21, m27);
sbox_xor xor34 (m23, m25, m28);
sbox_and and10 (m28, m27, m29);
sbox_and and11 (m26, m24, m30);
sbox_and and12 (m20, m23, m31);
sbox_and and13 (m27, m31, m32);
sbox_xor xor35 (m27, m25, m33);
sbox_and and14 (m21, m22, m34);
sbox_and and15 (m24, m34, m35);
sbox_xor xor36 (m24, m25, m36);
sbox_xor xor37 (m21, m29, m37);
sbox_xor xor38 (m32, m33, m38);
sbox_xor xor39 (m23, m30, m39);
sbox_xor xor40 (m35, m36, m40);
sbox_xor xor41 (m38, m40, m41);
sbox_xor xor42 (m37, m39, m42);
sbox_xor xor43 (m37, m38, m43);
sbox_xor xor44 (m39, m40, m44);
sbox_xor xor45 (m42, m41, m45);
sbox_and and16 (m44, t6, m46);
sbox_and and17 (m40, t8, m47);
sbox_and and18 (m39, dd, m48);
sbox_and and19 (m43, t16, m49);
sbox_and and20 (m38, t9, m50);
sbox_and and21 (m37, t17, m51);
sbox_and and22 (m42, t15, m52);
sbox_and and23 (m45, t27, m53);
sbox_and and24 (m41, t10, m54);
sbox_and and25 (m44, t13, m55);
sbox_and and26 (m40, t23, m56);
sbox_and and27 (m39, t19, m57);
sbox_and and28 (m43, t3, m58);
sbox_and and29 (m38, t22, m59);
sbox_and and30 (m37, t20, m60);
sbox_and and31 (m42, t1, m61);
sbox_and and32 (m45, t4, m62);
sbox_and and33 (m41, t2, m63);

// Forward
sbox_xor fxor27 (m61, m62, l0);
sbox_xor fxor28 (m50, m56, l1);
sbox_xor fxor29 (m46, m48, l2);
sbox_xor fxor30 (m47, m55, l3);
sbox_xor fxor31 (m54, m58, l4);
sbox_xor fxor32 (m49, m61, l5);
sbox_xor fxor33 (m62, l5, l6);
sbox_xor fxor34 (m46, l3, l7);
sbox_xor fxor35 (m51, m59, l8);
sbox_xor fxor36 (m52, m53, l9);
sbox_xor fxor37 (m53, l4, l10);
sbox_xor fxor38 (m60, l2, l11);
sbox_xor fxor39 (m48, m51, l12);
sbox_xor fxor40 (m50, l0, l13);
sbox_xor fxor41 (m52, m61, l14);
sbox_xor fxor42 (m55, l1, l15);
sbox_xor fxor43 (m56, l0, l16);
sbox_xor fxor44 (m57, l1, l17);
sbox_xor fxor45 (m58, l8, l18);
sbox_xor fxor46 (m63, l4, l19);
sbox_xor fxor47 (l0, l1, l20);
sbox_xor fxor48 (l1, l7, l21);
sbox_xor fxor49 (l3, l12, l22);
sbox_xor fxor50 (l18, l2, l23);
sbox_xor fxor51 (l15, l9, l24);
sbox_xor fxor52 (l6, l10, l25);
sbox_xor fxor53 (l7, l9, l26);
sbox_xor fxor54 (l8, l10, l27);
sbox_xor fxor55 (l11, l14, l28);
sbox_xor fxor56 (l11, l17, l29);
sbox_xor fxor57 (l6, l24, s0);
sbox_xnor fxnor0 (l16, l26, s1);
sbox_xnor fxnor1 (l19, l28, s2);
sbox_xor fxor58 (l6, l21, s3);
sbox_xor fxor59 (l20, l22, s4);
sbox_xor fxor60 (l25, l29, s5);
sbox_xnor fxnor2 (l13, l27, s6);
sbox_xnor fxnor3 (l6, l23, s7);

// Inverse
sbox_xor xor46 (m52, m61, p0);
sbox_xor xor47 (m58, m59, p1);
sbox_xor xor48 (m54, m62, p2);
sbox_xor xor49 (m47, m50, p3);
sbox_xor xor50 (m48, m56, p4);
sbox_xor xor51 (m46, m51, p5);
sbox_xor xor52 (m49, m60, p6);
sbox_xor xor53 (p0, p1, p7);
sbox_xor xor54 (m50, m53, p8);
sbox_xor xor55 (m55, m63, p9);
sbox_xor xor56 (m57, p4, p10);
sbox_xor xor57 (p0, p3, p11);
sbox_xor xor58 (m46, m48, p12);
sbox_xor xor59 (m49, m51, p13);
sbox_xor xor60 (m49, m62, p14);
sbox_xor xor61 (m54, m59, p15);
sbox_xor xor62 (m57, m61, p16);
sbox_xor xor63 (m58, p2, p17);
sbox_xor xor64 (m63, p5, p18);
sbox_xor xor65 (p2, p3, p19);
sbox_xor xor66 (p4, p6, p20);
sbox_xor xor67 (p2, p7, p22);
sbox_xor xor68 (p7, p8, p23);
sbox_xor xor69 (p5, p7, p24);
sbox_xor xor70 (p6, p10, p25);
sbox_xor xor71 (p9, p11, p26);
sbox_xor xor72 (p10, p18, p27);
sbox_xor xor73 (p11, p25, p28);
sbox_xor xor74 (p15, p20, p29);
sbox_xor xor75 (p13, p22, w0);
sbox_xor xor76 (p26, p29, w1);
sbox_xor xor77 (p17, p28, w2);
sbox_xor xor78 (p12, p22, w3);
sbox_xor xor79 (p23, p27, w4);
sbox_xor xor80 (p19, p24, w5);
sbox_xor xor81 (p14, p23, w6);
sbox_xor xor82 (p9, p16, w7);

assign o0 = inverse ? w0 : s0; 
assign o1 = inverse ? w1 : s1; 
assign o2 = inverse ? w2 : s2; 
assign o3 = inverse ? w3 : s3; 
assign o4 = inverse ? w4 : s4; 
assign o5 = inverse ? w5 : s5; 
assign o6 = inverse ? w6 : s6; 
assign o7 = inverse ? w7 : s7; 

endmodule

module sbox_xnor
(
    input a, b,
    output out
);

assign out = ~(a ^ b);

endmodule

module sbox_xor
(
    input a, b,
    output out
);

assign out = a ^ b;

endmodule

module sbox_and
(
    input a, b,
    output out
);

assign out = a & b;

endmodule