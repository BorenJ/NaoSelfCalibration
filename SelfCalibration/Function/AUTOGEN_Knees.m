function [LKneePos,RKneePos] = AUTOGEN_Knees(q)
%AUTOGEN_KNEES
%    [LKNEEPOS,RKNEEPOS] = AUTOGEN_KNEES(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    17-Jul-2021 15:34:46

q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);
q7 = q(7);
q8 = q(8);
q9 = q(9);
q10 = q(10);
q11 = q(11);

t2 = cos(q1);
t3 = cos(q2);
t4 = cos(q3);
t5 = cos(q7);
t6 = cos(q8);
t7 = cos(q9);
t8 = cos(q10);
t9 = cos(q11);
t10 = sin(q1);
t11 = sin(q2);
t12 = sin(q3);
t13 = sin(q7);
t14 = sin(q8);
t15 = sin(q9);
t16 = sin(q10);
t17 = sin(q11);
t18 = -q1;
t19 = -q7;
t20 = -q8;
t21 = -q9;
t22 = -q10;
t23 = q1+q7+q9+q10;
t24 = sqrt(2.0);
t25 = pi./4.0;
t26 = cos(t23);
t27 = sin(t23);
t28 = t3.*t4.*5.0e+1;
t29 = t5.*t6.*5.0e+1;
t30 = t3.*t12.*5.0e+1;
t31 = t5.*t14.*5.0e+1;
t32 = (t6.*t9)./2.0;
t33 = (t6.*t17)./2.0;
t34 = (t9.*t14)./2.0;
t36 = t2.*t11.*1.0e+2;
t37 = t2.*t13.*1.0e+2;
t38 = (t14.*t17)./2.0;
t39 = q7+q9+q10+t18;
t49 = q7+q8+q9+q10+t25;
t51 = t2.*t3.*t4.*-5.0e+1;
t52 = t2.*t5.*t6.*-5.0e+1;
t56 = t2.*t3.*t12.*-5.0e+1;
t57 = t2.*t5.*t14.*-5.0e+1;
t60 = q8+t23+t25;
t61 = t2.*t5.*t7.*t9.*t16;
t62 = t2.*t5.*t8.*t9.*t15;
t63 = t2.*t7.*t8.*t9.*t13;
t64 = t2.*t5.*t7.*t16.*t17;
t65 = t2.*t5.*t8.*t15.*t17;
t66 = t2.*t7.*t8.*t13.*t17;
t67 = t2.*t9.*t13.*t15.*t16;
t68 = t2.*t13.*t15.*t16.*t17;
t69 = t2.*t6.*t9.*(-1.0./2.0);
t70 = t2.*t9.*t14.*(-1.0./2.0);
t73 = t10.*t11.*7.071e+1;
t74 = t10.*t13.*7.071e+1;
t75 = q7+q9+q10+t20+t25;
t81 = t13.*t14.*t15.*5.145e+1;
t87 = t20+t23+t25;
t103 = t5.*t6.*t7.*5.145e+1;
t104 = t2.*t5.*t15.*1.029e+2;
t105 = t2.*t7.*t13.*1.029e+2;
t106 = t5.*t7.*t14.*5.145e+1;
t107 = t6.*t13.*t15.*5.145e+1;
t113 = t5.*t6.*t7.*t8.*t9.*(-1.0./2.0);
t114 = t5.*t6.*t7.*t8.*t17.*(-1.0./2.0);
t115 = t5.*t7.*t8.*t9.*t14.*(-1.0./2.0);
t116 = t5.*t6.*t9.*t15.*t16.*(-1.0./2.0);
t117 = t5.*t7.*t8.*t14.*t17.*(-1.0./2.0);
t118 = t6.*t7.*t9.*t13.*t16.*(-1.0./2.0);
t119 = t6.*t8.*t9.*t13.*t15.*(-1.0./2.0);
t120 = t5.*t9.*t14.*t15.*t16.*(-1.0./2.0);
t121 = t7.*t9.*t13.*t14.*t16.*(-1.0./2.0);
t122 = t8.*t9.*t13.*t14.*t15.*(-1.0./2.0);
t123 = t3.*t4.*t10.*7.071e+1;
t124 = t5.*t6.*t10.*7.071e+1;
t126 = t3.*t10.*t12.*7.071e+1;
t127 = t5.*t10.*t14.*7.071e+1;
t150 = t10.*t14.*t17.*7.071e-1;
t154 = t2.*t5.*t6.*t15.*t16.*t17.*(-1.0./2.0);
t156 = t2.*t6.*t7.*t13.*t16.*t17.*(-1.0./2.0);
t157 = t2.*t6.*t8.*t13.*t15.*t17.*(-1.0./2.0);
t160 = t2.*t5.*t14.*t15.*t16.*t17.*(-1.0./2.0);
t161 = t2.*t7.*t13.*t14.*t16.*t17.*(-1.0./2.0);
t162 = t2.*t8.*t13.*t14.*t15.*t17.*(-1.0./2.0);
t163 = t2.*t5.*t6.*t7.*(-5.145e+1);
t164 = t2.*t5.*t7.*t14.*(-5.145e+1);
t165 = t2.*t6.*t13.*t15.*(-5.145e+1);
t166 = t2.*t13.*t14.*t15.*(-5.145e+1);
t167 = t6.*t9.*t10.*7.071e-1;
t169 = t6.*t10.*t17.*7.071e-1;
t170 = t9.*t10.*t14.*7.071e-1;
t173 = q1+q8+t19+t21+t22+t25;
t176 = t5.*t7.*t9.*t10.*t16.*7.071e-1;
t177 = t5.*t8.*t9.*t10.*t15.*7.071e-1;
t178 = t7.*t8.*t9.*t10.*t13.*7.071e-1;
t179 = t5.*t7.*t10.*t16.*t17.*7.071e-1;
t180 = t5.*t8.*t10.*t15.*t17.*7.071e-1;
t181 = t7.*t8.*t10.*t13.*t17.*7.071e-1;
t182 = t9.*t10.*t13.*t15.*t16.*7.071e-1;
t184 = t10.*t13.*t15.*t16.*t17.*7.071e-1;
t186 = t5.*t10.*t15.*7.276059e+1;
t187 = t7.*t10.*t13.*7.276059e+1;
t213 = t5.*t6.*t7.*t10.*7.276059e+1;
t214 = t5.*t7.*t10.*t14.*7.276059e+1;
t215 = t6.*t10.*t13.*t15.*7.276059e+1;
t216 = t10.*t13.*t14.*t15.*7.276059e+1;
t218 = t5.*t6.*t7.*t8.*t9.*t10.*(-7.071e-1);
t219 = t5.*t7.*t8.*t10.*t14.*t17.*(-7.071e-1);
t220 = t5.*t6.*t10.*t15.*t16.*t17.*(-7.071e-1);
t221 = t5.*t9.*t10.*t14.*t15.*t16.*(-7.071e-1);
t222 = t6.*t7.*t10.*t13.*t16.*t17.*(-7.071e-1);
t223 = t6.*t8.*t10.*t13.*t15.*t17.*(-7.071e-1);
t224 = t7.*t9.*t10.*t13.*t14.*t16.*(-7.071e-1);
t225 = t8.*t9.*t10.*t13.*t14.*t15.*(-7.071e-1);
t35 = -t30;
t40 = -t33;
t41 = -t34;
t42 = -t38;
t43 = t2.*t28;
t44 = t2.*t29;
t45 = cos(t39);
t46 = t2.*t30;
t47 = t2.*t31;
t48 = sin(t39);
t50 = t2.*t32;
t53 = t26./2.0;
t54 = t2.*t33;
t55 = t2.*t34;
t58 = t2.*t38;
t59 = cos(t49);
t71 = cos(t60);
t72 = sin(t60);
t77 = -t61;
t78 = -t62;
t79 = -t63;
t80 = -t68;
t82 = -t73;
t83 = -t74;
t84 = t5.*t7.*t8.*t32;
t85 = t5.*t7.*t8.*t33;
t86 = t5.*t7.*t8.*t34;
t88 = q8+t25+t39;
t89 = t5.*t15.*t16.*t32;
t90 = t5.*t7.*t8.*t38;
t91 = t7.*t13.*t16.*t32;
t92 = t8.*t13.*t15.*t32;
t93 = sin(t75);
t94 = t5.*t15.*t16.*t33;
t95 = t5.*t15.*t16.*t34;
t96 = t7.*t13.*t16.*t33;
t97 = t8.*t13.*t15.*t33;
t98 = t7.*t13.*t16.*t34;
t99 = t8.*t13.*t15.*t34;
t100 = t5.*t15.*t16.*t38;
t101 = t7.*t13.*t16.*t38;
t102 = t8.*t13.*t15.*t38;
t108 = cos(t87);
t110 = -t81;
t111 = sin(t87);
t125 = -t107;
t144 = t2.*t103;
t145 = t2.*t106;
t146 = t2.*t107;
t147 = t2.*t81;
t148 = -t127;
t149 = t20+t25+t39;
t151 = t5.*t7.*t8.*t69;
t152 = t2.*t114;
t153 = t2.*t117;
t155 = t5.*t15.*t16.*t70;
t158 = t7.*t13.*t16.*t70;
t159 = t8.*t13.*t15.*t70;
t168 = t27.*3.5355e-1;
t183 = cos(t173);
t189 = -t179;
t190 = -t180;
t191 = -t181;
t192 = -t182;
t193 = -t184;
t194 = -t186;
t195 = -t187;
t197 = t5.*t7.*t8.*t167;
t198 = t5.*t7.*t8.*t169;
t199 = t5.*t7.*t8.*t170;
t200 = t5.*t15.*t16.*t167;
t201 = t5.*t7.*t8.*t150;
t202 = t7.*t13.*t16.*t167;
t203 = t8.*t13.*t15.*t167;
t204 = t5.*t15.*t16.*t169;
t205 = t5.*t15.*t16.*t170;
t206 = t7.*t13.*t16.*t169;
t207 = t8.*t13.*t15.*t169;
t208 = t7.*t13.*t16.*t170;
t209 = t8.*t13.*t15.*t170;
t210 = t5.*t15.*t16.*t150;
t211 = t7.*t13.*t16.*t150;
t212 = t8.*t13.*t15.*t150;
t226 = -t214;
t227 = -t215;
t239 = t36+t123+t126;
t76 = t45./2.0;
t109 = cos(t88);
t112 = sin(t88);
t128 = t5.*t7.*t8.*t50;
t129 = t5.*t7.*t8.*t54;
t130 = t5.*t7.*t8.*t55;
t131 = t5.*t15.*t16.*t50;
t132 = t5.*t7.*t8.*t58;
t133 = t7.*t13.*t16.*t50;
t134 = t8.*t13.*t15.*t50;
t135 = t5.*t15.*t16.*t54;
t136 = t5.*t15.*t16.*t55;
t137 = t7.*t13.*t16.*t54;
t138 = t8.*t13.*t15.*t54;
t139 = t7.*t13.*t16.*t55;
t140 = t8.*t13.*t15.*t55;
t141 = t5.*t15.*t16.*t58;
t142 = t7.*t13.*t16.*t58;
t143 = t8.*t13.*t15.*t58;
t171 = cos(t149);
t172 = t48.*3.5355e-1;
t174 = (t24.*t59)./4.0;
t188 = (t24.*t72)./8.0;
t196 = (t24.*t93)./4.0;
t228 = (t24.*t108)./8.0;
t232 = t24.*t71.*1.76775e-1;
t235 = t24.*t111.*1.76775e-1;
t237 = t24.*t183.*1.76775e-1;
t240 = t37+t124+t148;
t241 = t29+t31+t47+t52+t74+5.0e+1;
t242 = t28+t35+t51+t56+t73+5.0e+1;
t243 = t28+t35+t43+t46+t82+8.5e+1;
t244 = t29+t31+t44+t57+t83+8.5e+1;
t251 = t64+t65+t66+t80+t167+t170+t198+t210+t211+t212+t219+t220+t222+t223;
t252 = t67+t77+t78+t79+t150+t169+t199+t200+t202+t203+t218+t221+t224+t225;
t253 = (t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1).^2;
t175 = -t172;
t185 = -t174;
t217 = -t196;
t229 = (t24.*t112)./8.0;
t230 = -t228;
t231 = (t24.*t171)./8.0;
t234 = t24.*t109.*1.76775e-1;
t238 = -t237;
t246 = t104+t105+t213+t216+t226+t227+t240;
t249 = t103+t106+t110+t125+t145+t146+t163+t166+t186+t187+t241;
t250 = t103+t106+t110+t125+t144+t147+t164+t165+t194+t195+t244;
t254 = t253.*4.519e+1;
t256 = t38+t40+t54+t58+t89+t91+t92+t95+t98+t99+t113+t115+t130+t131+t133+t134+t151+t155+t158+t159+t176+t177+t178+t192;
t257 = t32+t41+t69+t70+t94+t96+t97+t100+t101+t102+t114+t117+t132+t135+t137+t138+t152+t160+t161+t162+t179+t180+t181+t193;
t258 = t32+t41+t50+t55+t94+t96+t97+t100+t101+t102+t114+t117+t129+t141+t142+t143+t153+t154+t156+t157+t184+t189+t190+t191;
t260 = t33+t42+t54+t58+t84+t86+t116+t118+t119+t120+t121+t122+t130+t131+t133+t134+t151+t155+t158+t159+t176+t177+t178+t192;
t272 = t251.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1).*(-4.519e+1);
t273 = t251.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1).*4.519e+1;
t233 = -t231;
t236 = -t234;
t259 = t256.^2;
t261 = t260.^2;
t267 = t246.*t251;
t269 = -t246.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1);
t271 = t246.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1);
t276 = t249.*t258;
t278 = t249.*t260;
t279 = t250.*t256;
t280 = t250.*t257;
t283 = t256.*t257.*4.519e+1;
t284 = t258.*t260.*4.519e+1;
t245 = t53+t76+t232+t235+t236+t238;
t247 = t168+t174+t175+t188+t217+t229+t230+t233;
t248 = t168+t175+t185+t188+t196+t229+t230+t233;
t262 = t259.*4.519e+1;
t263 = t261.*4.519e+1;
t277 = -t276;
t281 = -t279;
t282 = -t280;
t285 = -t284;
t255 = t245.*t246;
t264 = t247.*t249;
t265 = t248.*t250;
t268 = t245.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1).*(-4.519e+1);
t270 = t245.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1).*4.519e+1;
t274 = t248.*t256.*4.519e+1;
t275 = t247.*t260.*4.519e+1;
t266 = -t265;
LKneePos = [t255+t264+t266+t270+t274+t275-t240.*t245-t241.*t247+t244.*t248,t267+t273+t277+t282+t283+t285-t240.*t251+t241.*t258+t244.*t257,t254+t262+t263+t271+t278+t281-t240.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1)+t244.*t256-t241.*t260];
if nargout > 1
    RKneePos = [t255+t264+t266+t270+t274+t275-t239.*t245+t242.*t247+t243.*t248,t267+t273+t277+t282+t283+t285-t239.*t251-t242.*t258+t243.*t257,t254+t262+t263+t271+t278+t281-t239.*(t61+t62+t63-t67-t150-t169+t197+t205+t208+t209-t5.*t7.*t8.*t9.*t10.*t14.*7.071e-1-t5.*t6.*t9.*t10.*t15.*t16.*7.071e-1-t6.*t7.*t9.*t10.*t13.*t16.*7.071e-1-t6.*t8.*t9.*t10.*t13.*t15.*7.071e-1)+t243.*t256+t242.*t260];
end
