// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class Era {
  const Era();

  factory Era.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EraCodec codec = $EraCodec();

  static const $Era values = $Era();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $Era {
  const $Era();

  Immortal immortal() {
    return Immortal();
  }

  Mortal1 mortal1(int value0) {
    return Mortal1(value0);
  }

  Mortal2 mortal2(int value0) {
    return Mortal2(value0);
  }

  Mortal3 mortal3(int value0) {
    return Mortal3(value0);
  }

  Mortal4 mortal4(int value0) {
    return Mortal4(value0);
  }

  Mortal5 mortal5(int value0) {
    return Mortal5(value0);
  }

  Mortal6 mortal6(int value0) {
    return Mortal6(value0);
  }

  Mortal7 mortal7(int value0) {
    return Mortal7(value0);
  }

  Mortal8 mortal8(int value0) {
    return Mortal8(value0);
  }

  Mortal9 mortal9(int value0) {
    return Mortal9(value0);
  }

  Mortal10 mortal10(int value0) {
    return Mortal10(value0);
  }

  Mortal11 mortal11(int value0) {
    return Mortal11(value0);
  }

  Mortal12 mortal12(int value0) {
    return Mortal12(value0);
  }

  Mortal13 mortal13(int value0) {
    return Mortal13(value0);
  }

  Mortal14 mortal14(int value0) {
    return Mortal14(value0);
  }

  Mortal15 mortal15(int value0) {
    return Mortal15(value0);
  }

  Mortal16 mortal16(int value0) {
    return Mortal16(value0);
  }

  Mortal17 mortal17(int value0) {
    return Mortal17(value0);
  }

  Mortal18 mortal18(int value0) {
    return Mortal18(value0);
  }

  Mortal19 mortal19(int value0) {
    return Mortal19(value0);
  }

  Mortal20 mortal20(int value0) {
    return Mortal20(value0);
  }

  Mortal21 mortal21(int value0) {
    return Mortal21(value0);
  }

  Mortal22 mortal22(int value0) {
    return Mortal22(value0);
  }

  Mortal23 mortal23(int value0) {
    return Mortal23(value0);
  }

  Mortal24 mortal24(int value0) {
    return Mortal24(value0);
  }

  Mortal25 mortal25(int value0) {
    return Mortal25(value0);
  }

  Mortal26 mortal26(int value0) {
    return Mortal26(value0);
  }

  Mortal27 mortal27(int value0) {
    return Mortal27(value0);
  }

  Mortal28 mortal28(int value0) {
    return Mortal28(value0);
  }

  Mortal29 mortal29(int value0) {
    return Mortal29(value0);
  }

  Mortal30 mortal30(int value0) {
    return Mortal30(value0);
  }

  Mortal31 mortal31(int value0) {
    return Mortal31(value0);
  }

  Mortal32 mortal32(int value0) {
    return Mortal32(value0);
  }

  Mortal33 mortal33(int value0) {
    return Mortal33(value0);
  }

  Mortal34 mortal34(int value0) {
    return Mortal34(value0);
  }

  Mortal35 mortal35(int value0) {
    return Mortal35(value0);
  }

  Mortal36 mortal36(int value0) {
    return Mortal36(value0);
  }

  Mortal37 mortal37(int value0) {
    return Mortal37(value0);
  }

  Mortal38 mortal38(int value0) {
    return Mortal38(value0);
  }

  Mortal39 mortal39(int value0) {
    return Mortal39(value0);
  }

  Mortal40 mortal40(int value0) {
    return Mortal40(value0);
  }

  Mortal41 mortal41(int value0) {
    return Mortal41(value0);
  }

  Mortal42 mortal42(int value0) {
    return Mortal42(value0);
  }

  Mortal43 mortal43(int value0) {
    return Mortal43(value0);
  }

  Mortal44 mortal44(int value0) {
    return Mortal44(value0);
  }

  Mortal45 mortal45(int value0) {
    return Mortal45(value0);
  }

  Mortal46 mortal46(int value0) {
    return Mortal46(value0);
  }

  Mortal47 mortal47(int value0) {
    return Mortal47(value0);
  }

  Mortal48 mortal48(int value0) {
    return Mortal48(value0);
  }

  Mortal49 mortal49(int value0) {
    return Mortal49(value0);
  }

  Mortal50 mortal50(int value0) {
    return Mortal50(value0);
  }

  Mortal51 mortal51(int value0) {
    return Mortal51(value0);
  }

  Mortal52 mortal52(int value0) {
    return Mortal52(value0);
  }

  Mortal53 mortal53(int value0) {
    return Mortal53(value0);
  }

  Mortal54 mortal54(int value0) {
    return Mortal54(value0);
  }

  Mortal55 mortal55(int value0) {
    return Mortal55(value0);
  }

  Mortal56 mortal56(int value0) {
    return Mortal56(value0);
  }

  Mortal57 mortal57(int value0) {
    return Mortal57(value0);
  }

  Mortal58 mortal58(int value0) {
    return Mortal58(value0);
  }

  Mortal59 mortal59(int value0) {
    return Mortal59(value0);
  }

  Mortal60 mortal60(int value0) {
    return Mortal60(value0);
  }

  Mortal61 mortal61(int value0) {
    return Mortal61(value0);
  }

  Mortal62 mortal62(int value0) {
    return Mortal62(value0);
  }

  Mortal63 mortal63(int value0) {
    return Mortal63(value0);
  }

  Mortal64 mortal64(int value0) {
    return Mortal64(value0);
  }

  Mortal65 mortal65(int value0) {
    return Mortal65(value0);
  }

  Mortal66 mortal66(int value0) {
    return Mortal66(value0);
  }

  Mortal67 mortal67(int value0) {
    return Mortal67(value0);
  }

  Mortal68 mortal68(int value0) {
    return Mortal68(value0);
  }

  Mortal69 mortal69(int value0) {
    return Mortal69(value0);
  }

  Mortal70 mortal70(int value0) {
    return Mortal70(value0);
  }

  Mortal71 mortal71(int value0) {
    return Mortal71(value0);
  }

  Mortal72 mortal72(int value0) {
    return Mortal72(value0);
  }

  Mortal73 mortal73(int value0) {
    return Mortal73(value0);
  }

  Mortal74 mortal74(int value0) {
    return Mortal74(value0);
  }

  Mortal75 mortal75(int value0) {
    return Mortal75(value0);
  }

  Mortal76 mortal76(int value0) {
    return Mortal76(value0);
  }

  Mortal77 mortal77(int value0) {
    return Mortal77(value0);
  }

  Mortal78 mortal78(int value0) {
    return Mortal78(value0);
  }

  Mortal79 mortal79(int value0) {
    return Mortal79(value0);
  }

  Mortal80 mortal80(int value0) {
    return Mortal80(value0);
  }

  Mortal81 mortal81(int value0) {
    return Mortal81(value0);
  }

  Mortal82 mortal82(int value0) {
    return Mortal82(value0);
  }

  Mortal83 mortal83(int value0) {
    return Mortal83(value0);
  }

  Mortal84 mortal84(int value0) {
    return Mortal84(value0);
  }

  Mortal85 mortal85(int value0) {
    return Mortal85(value0);
  }

  Mortal86 mortal86(int value0) {
    return Mortal86(value0);
  }

  Mortal87 mortal87(int value0) {
    return Mortal87(value0);
  }

  Mortal88 mortal88(int value0) {
    return Mortal88(value0);
  }

  Mortal89 mortal89(int value0) {
    return Mortal89(value0);
  }

  Mortal90 mortal90(int value0) {
    return Mortal90(value0);
  }

  Mortal91 mortal91(int value0) {
    return Mortal91(value0);
  }

  Mortal92 mortal92(int value0) {
    return Mortal92(value0);
  }

  Mortal93 mortal93(int value0) {
    return Mortal93(value0);
  }

  Mortal94 mortal94(int value0) {
    return Mortal94(value0);
  }

  Mortal95 mortal95(int value0) {
    return Mortal95(value0);
  }

  Mortal96 mortal96(int value0) {
    return Mortal96(value0);
  }

  Mortal97 mortal97(int value0) {
    return Mortal97(value0);
  }

  Mortal98 mortal98(int value0) {
    return Mortal98(value0);
  }

  Mortal99 mortal99(int value0) {
    return Mortal99(value0);
  }

  Mortal100 mortal100(int value0) {
    return Mortal100(value0);
  }

  Mortal101 mortal101(int value0) {
    return Mortal101(value0);
  }

  Mortal102 mortal102(int value0) {
    return Mortal102(value0);
  }

  Mortal103 mortal103(int value0) {
    return Mortal103(value0);
  }

  Mortal104 mortal104(int value0) {
    return Mortal104(value0);
  }

  Mortal105 mortal105(int value0) {
    return Mortal105(value0);
  }

  Mortal106 mortal106(int value0) {
    return Mortal106(value0);
  }

  Mortal107 mortal107(int value0) {
    return Mortal107(value0);
  }

  Mortal108 mortal108(int value0) {
    return Mortal108(value0);
  }

  Mortal109 mortal109(int value0) {
    return Mortal109(value0);
  }

  Mortal110 mortal110(int value0) {
    return Mortal110(value0);
  }

  Mortal111 mortal111(int value0) {
    return Mortal111(value0);
  }

  Mortal112 mortal112(int value0) {
    return Mortal112(value0);
  }

  Mortal113 mortal113(int value0) {
    return Mortal113(value0);
  }

  Mortal114 mortal114(int value0) {
    return Mortal114(value0);
  }

  Mortal115 mortal115(int value0) {
    return Mortal115(value0);
  }

  Mortal116 mortal116(int value0) {
    return Mortal116(value0);
  }

  Mortal117 mortal117(int value0) {
    return Mortal117(value0);
  }

  Mortal118 mortal118(int value0) {
    return Mortal118(value0);
  }

  Mortal119 mortal119(int value0) {
    return Mortal119(value0);
  }

  Mortal120 mortal120(int value0) {
    return Mortal120(value0);
  }

  Mortal121 mortal121(int value0) {
    return Mortal121(value0);
  }

  Mortal122 mortal122(int value0) {
    return Mortal122(value0);
  }

  Mortal123 mortal123(int value0) {
    return Mortal123(value0);
  }

  Mortal124 mortal124(int value0) {
    return Mortal124(value0);
  }

  Mortal125 mortal125(int value0) {
    return Mortal125(value0);
  }

  Mortal126 mortal126(int value0) {
    return Mortal126(value0);
  }

  Mortal127 mortal127(int value0) {
    return Mortal127(value0);
  }

  Mortal128 mortal128(int value0) {
    return Mortal128(value0);
  }

  Mortal129 mortal129(int value0) {
    return Mortal129(value0);
  }

  Mortal130 mortal130(int value0) {
    return Mortal130(value0);
  }

  Mortal131 mortal131(int value0) {
    return Mortal131(value0);
  }

  Mortal132 mortal132(int value0) {
    return Mortal132(value0);
  }

  Mortal133 mortal133(int value0) {
    return Mortal133(value0);
  }

  Mortal134 mortal134(int value0) {
    return Mortal134(value0);
  }

  Mortal135 mortal135(int value0) {
    return Mortal135(value0);
  }

  Mortal136 mortal136(int value0) {
    return Mortal136(value0);
  }

  Mortal137 mortal137(int value0) {
    return Mortal137(value0);
  }

  Mortal138 mortal138(int value0) {
    return Mortal138(value0);
  }

  Mortal139 mortal139(int value0) {
    return Mortal139(value0);
  }

  Mortal140 mortal140(int value0) {
    return Mortal140(value0);
  }

  Mortal141 mortal141(int value0) {
    return Mortal141(value0);
  }

  Mortal142 mortal142(int value0) {
    return Mortal142(value0);
  }

  Mortal143 mortal143(int value0) {
    return Mortal143(value0);
  }

  Mortal144 mortal144(int value0) {
    return Mortal144(value0);
  }

  Mortal145 mortal145(int value0) {
    return Mortal145(value0);
  }

  Mortal146 mortal146(int value0) {
    return Mortal146(value0);
  }

  Mortal147 mortal147(int value0) {
    return Mortal147(value0);
  }

  Mortal148 mortal148(int value0) {
    return Mortal148(value0);
  }

  Mortal149 mortal149(int value0) {
    return Mortal149(value0);
  }

  Mortal150 mortal150(int value0) {
    return Mortal150(value0);
  }

  Mortal151 mortal151(int value0) {
    return Mortal151(value0);
  }

  Mortal152 mortal152(int value0) {
    return Mortal152(value0);
  }

  Mortal153 mortal153(int value0) {
    return Mortal153(value0);
  }

  Mortal154 mortal154(int value0) {
    return Mortal154(value0);
  }

  Mortal155 mortal155(int value0) {
    return Mortal155(value0);
  }

  Mortal156 mortal156(int value0) {
    return Mortal156(value0);
  }

  Mortal157 mortal157(int value0) {
    return Mortal157(value0);
  }

  Mortal158 mortal158(int value0) {
    return Mortal158(value0);
  }

  Mortal159 mortal159(int value0) {
    return Mortal159(value0);
  }

  Mortal160 mortal160(int value0) {
    return Mortal160(value0);
  }

  Mortal161 mortal161(int value0) {
    return Mortal161(value0);
  }

  Mortal162 mortal162(int value0) {
    return Mortal162(value0);
  }

  Mortal163 mortal163(int value0) {
    return Mortal163(value0);
  }

  Mortal164 mortal164(int value0) {
    return Mortal164(value0);
  }

  Mortal165 mortal165(int value0) {
    return Mortal165(value0);
  }

  Mortal166 mortal166(int value0) {
    return Mortal166(value0);
  }

  Mortal167 mortal167(int value0) {
    return Mortal167(value0);
  }

  Mortal168 mortal168(int value0) {
    return Mortal168(value0);
  }

  Mortal169 mortal169(int value0) {
    return Mortal169(value0);
  }

  Mortal170 mortal170(int value0) {
    return Mortal170(value0);
  }

  Mortal171 mortal171(int value0) {
    return Mortal171(value0);
  }

  Mortal172 mortal172(int value0) {
    return Mortal172(value0);
  }

  Mortal173 mortal173(int value0) {
    return Mortal173(value0);
  }

  Mortal174 mortal174(int value0) {
    return Mortal174(value0);
  }

  Mortal175 mortal175(int value0) {
    return Mortal175(value0);
  }

  Mortal176 mortal176(int value0) {
    return Mortal176(value0);
  }

  Mortal177 mortal177(int value0) {
    return Mortal177(value0);
  }

  Mortal178 mortal178(int value0) {
    return Mortal178(value0);
  }

  Mortal179 mortal179(int value0) {
    return Mortal179(value0);
  }

  Mortal180 mortal180(int value0) {
    return Mortal180(value0);
  }

  Mortal181 mortal181(int value0) {
    return Mortal181(value0);
  }

  Mortal182 mortal182(int value0) {
    return Mortal182(value0);
  }

  Mortal183 mortal183(int value0) {
    return Mortal183(value0);
  }

  Mortal184 mortal184(int value0) {
    return Mortal184(value0);
  }

  Mortal185 mortal185(int value0) {
    return Mortal185(value0);
  }

  Mortal186 mortal186(int value0) {
    return Mortal186(value0);
  }

  Mortal187 mortal187(int value0) {
    return Mortal187(value0);
  }

  Mortal188 mortal188(int value0) {
    return Mortal188(value0);
  }

  Mortal189 mortal189(int value0) {
    return Mortal189(value0);
  }

  Mortal190 mortal190(int value0) {
    return Mortal190(value0);
  }

  Mortal191 mortal191(int value0) {
    return Mortal191(value0);
  }

  Mortal192 mortal192(int value0) {
    return Mortal192(value0);
  }

  Mortal193 mortal193(int value0) {
    return Mortal193(value0);
  }

  Mortal194 mortal194(int value0) {
    return Mortal194(value0);
  }

  Mortal195 mortal195(int value0) {
    return Mortal195(value0);
  }

  Mortal196 mortal196(int value0) {
    return Mortal196(value0);
  }

  Mortal197 mortal197(int value0) {
    return Mortal197(value0);
  }

  Mortal198 mortal198(int value0) {
    return Mortal198(value0);
  }

  Mortal199 mortal199(int value0) {
    return Mortal199(value0);
  }

  Mortal200 mortal200(int value0) {
    return Mortal200(value0);
  }

  Mortal201 mortal201(int value0) {
    return Mortal201(value0);
  }

  Mortal202 mortal202(int value0) {
    return Mortal202(value0);
  }

  Mortal203 mortal203(int value0) {
    return Mortal203(value0);
  }

  Mortal204 mortal204(int value0) {
    return Mortal204(value0);
  }

  Mortal205 mortal205(int value0) {
    return Mortal205(value0);
  }

  Mortal206 mortal206(int value0) {
    return Mortal206(value0);
  }

  Mortal207 mortal207(int value0) {
    return Mortal207(value0);
  }

  Mortal208 mortal208(int value0) {
    return Mortal208(value0);
  }

  Mortal209 mortal209(int value0) {
    return Mortal209(value0);
  }

  Mortal210 mortal210(int value0) {
    return Mortal210(value0);
  }

  Mortal211 mortal211(int value0) {
    return Mortal211(value0);
  }

  Mortal212 mortal212(int value0) {
    return Mortal212(value0);
  }

  Mortal213 mortal213(int value0) {
    return Mortal213(value0);
  }

  Mortal214 mortal214(int value0) {
    return Mortal214(value0);
  }

  Mortal215 mortal215(int value0) {
    return Mortal215(value0);
  }

  Mortal216 mortal216(int value0) {
    return Mortal216(value0);
  }

  Mortal217 mortal217(int value0) {
    return Mortal217(value0);
  }

  Mortal218 mortal218(int value0) {
    return Mortal218(value0);
  }

  Mortal219 mortal219(int value0) {
    return Mortal219(value0);
  }

  Mortal220 mortal220(int value0) {
    return Mortal220(value0);
  }

  Mortal221 mortal221(int value0) {
    return Mortal221(value0);
  }

  Mortal222 mortal222(int value0) {
    return Mortal222(value0);
  }

  Mortal223 mortal223(int value0) {
    return Mortal223(value0);
  }

  Mortal224 mortal224(int value0) {
    return Mortal224(value0);
  }

  Mortal225 mortal225(int value0) {
    return Mortal225(value0);
  }

  Mortal226 mortal226(int value0) {
    return Mortal226(value0);
  }

  Mortal227 mortal227(int value0) {
    return Mortal227(value0);
  }

  Mortal228 mortal228(int value0) {
    return Mortal228(value0);
  }

  Mortal229 mortal229(int value0) {
    return Mortal229(value0);
  }

  Mortal230 mortal230(int value0) {
    return Mortal230(value0);
  }

  Mortal231 mortal231(int value0) {
    return Mortal231(value0);
  }

  Mortal232 mortal232(int value0) {
    return Mortal232(value0);
  }

  Mortal233 mortal233(int value0) {
    return Mortal233(value0);
  }

  Mortal234 mortal234(int value0) {
    return Mortal234(value0);
  }

  Mortal235 mortal235(int value0) {
    return Mortal235(value0);
  }

  Mortal236 mortal236(int value0) {
    return Mortal236(value0);
  }

  Mortal237 mortal237(int value0) {
    return Mortal237(value0);
  }

  Mortal238 mortal238(int value0) {
    return Mortal238(value0);
  }

  Mortal239 mortal239(int value0) {
    return Mortal239(value0);
  }

  Mortal240 mortal240(int value0) {
    return Mortal240(value0);
  }

  Mortal241 mortal241(int value0) {
    return Mortal241(value0);
  }

  Mortal242 mortal242(int value0) {
    return Mortal242(value0);
  }

  Mortal243 mortal243(int value0) {
    return Mortal243(value0);
  }

  Mortal244 mortal244(int value0) {
    return Mortal244(value0);
  }

  Mortal245 mortal245(int value0) {
    return Mortal245(value0);
  }

  Mortal246 mortal246(int value0) {
    return Mortal246(value0);
  }

  Mortal247 mortal247(int value0) {
    return Mortal247(value0);
  }

  Mortal248 mortal248(int value0) {
    return Mortal248(value0);
  }

  Mortal249 mortal249(int value0) {
    return Mortal249(value0);
  }

  Mortal250 mortal250(int value0) {
    return Mortal250(value0);
  }

  Mortal251 mortal251(int value0) {
    return Mortal251(value0);
  }

  Mortal252 mortal252(int value0) {
    return Mortal252(value0);
  }

  Mortal253 mortal253(int value0) {
    return Mortal253(value0);
  }

  Mortal254 mortal254(int value0) {
    return Mortal254(value0);
  }

  Mortal255 mortal255(int value0) {
    return Mortal255(value0);
  }
}

class $EraCodec with _i1.Codec<Era> {
  const $EraCodec();

  @override
  Era decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const Immortal();
      case 1:
        return Mortal1._decode(input);
      case 2:
        return Mortal2._decode(input);
      case 3:
        return Mortal3._decode(input);
      case 4:
        return Mortal4._decode(input);
      case 5:
        return Mortal5._decode(input);
      case 6:
        return Mortal6._decode(input);
      case 7:
        return Mortal7._decode(input);
      case 8:
        return Mortal8._decode(input);
      case 9:
        return Mortal9._decode(input);
      case 10:
        return Mortal10._decode(input);
      case 11:
        return Mortal11._decode(input);
      case 12:
        return Mortal12._decode(input);
      case 13:
        return Mortal13._decode(input);
      case 14:
        return Mortal14._decode(input);
      case 15:
        return Mortal15._decode(input);
      case 16:
        return Mortal16._decode(input);
      case 17:
        return Mortal17._decode(input);
      case 18:
        return Mortal18._decode(input);
      case 19:
        return Mortal19._decode(input);
      case 20:
        return Mortal20._decode(input);
      case 21:
        return Mortal21._decode(input);
      case 22:
        return Mortal22._decode(input);
      case 23:
        return Mortal23._decode(input);
      case 24:
        return Mortal24._decode(input);
      case 25:
        return Mortal25._decode(input);
      case 26:
        return Mortal26._decode(input);
      case 27:
        return Mortal27._decode(input);
      case 28:
        return Mortal28._decode(input);
      case 29:
        return Mortal29._decode(input);
      case 30:
        return Mortal30._decode(input);
      case 31:
        return Mortal31._decode(input);
      case 32:
        return Mortal32._decode(input);
      case 33:
        return Mortal33._decode(input);
      case 34:
        return Mortal34._decode(input);
      case 35:
        return Mortal35._decode(input);
      case 36:
        return Mortal36._decode(input);
      case 37:
        return Mortal37._decode(input);
      case 38:
        return Mortal38._decode(input);
      case 39:
        return Mortal39._decode(input);
      case 40:
        return Mortal40._decode(input);
      case 41:
        return Mortal41._decode(input);
      case 42:
        return Mortal42._decode(input);
      case 43:
        return Mortal43._decode(input);
      case 44:
        return Mortal44._decode(input);
      case 45:
        return Mortal45._decode(input);
      case 46:
        return Mortal46._decode(input);
      case 47:
        return Mortal47._decode(input);
      case 48:
        return Mortal48._decode(input);
      case 49:
        return Mortal49._decode(input);
      case 50:
        return Mortal50._decode(input);
      case 51:
        return Mortal51._decode(input);
      case 52:
        return Mortal52._decode(input);
      case 53:
        return Mortal53._decode(input);
      case 54:
        return Mortal54._decode(input);
      case 55:
        return Mortal55._decode(input);
      case 56:
        return Mortal56._decode(input);
      case 57:
        return Mortal57._decode(input);
      case 58:
        return Mortal58._decode(input);
      case 59:
        return Mortal59._decode(input);
      case 60:
        return Mortal60._decode(input);
      case 61:
        return Mortal61._decode(input);
      case 62:
        return Mortal62._decode(input);
      case 63:
        return Mortal63._decode(input);
      case 64:
        return Mortal64._decode(input);
      case 65:
        return Mortal65._decode(input);
      case 66:
        return Mortal66._decode(input);
      case 67:
        return Mortal67._decode(input);
      case 68:
        return Mortal68._decode(input);
      case 69:
        return Mortal69._decode(input);
      case 70:
        return Mortal70._decode(input);
      case 71:
        return Mortal71._decode(input);
      case 72:
        return Mortal72._decode(input);
      case 73:
        return Mortal73._decode(input);
      case 74:
        return Mortal74._decode(input);
      case 75:
        return Mortal75._decode(input);
      case 76:
        return Mortal76._decode(input);
      case 77:
        return Mortal77._decode(input);
      case 78:
        return Mortal78._decode(input);
      case 79:
        return Mortal79._decode(input);
      case 80:
        return Mortal80._decode(input);
      case 81:
        return Mortal81._decode(input);
      case 82:
        return Mortal82._decode(input);
      case 83:
        return Mortal83._decode(input);
      case 84:
        return Mortal84._decode(input);
      case 85:
        return Mortal85._decode(input);
      case 86:
        return Mortal86._decode(input);
      case 87:
        return Mortal87._decode(input);
      case 88:
        return Mortal88._decode(input);
      case 89:
        return Mortal89._decode(input);
      case 90:
        return Mortal90._decode(input);
      case 91:
        return Mortal91._decode(input);
      case 92:
        return Mortal92._decode(input);
      case 93:
        return Mortal93._decode(input);
      case 94:
        return Mortal94._decode(input);
      case 95:
        return Mortal95._decode(input);
      case 96:
        return Mortal96._decode(input);
      case 97:
        return Mortal97._decode(input);
      case 98:
        return Mortal98._decode(input);
      case 99:
        return Mortal99._decode(input);
      case 100:
        return Mortal100._decode(input);
      case 101:
        return Mortal101._decode(input);
      case 102:
        return Mortal102._decode(input);
      case 103:
        return Mortal103._decode(input);
      case 104:
        return Mortal104._decode(input);
      case 105:
        return Mortal105._decode(input);
      case 106:
        return Mortal106._decode(input);
      case 107:
        return Mortal107._decode(input);
      case 108:
        return Mortal108._decode(input);
      case 109:
        return Mortal109._decode(input);
      case 110:
        return Mortal110._decode(input);
      case 111:
        return Mortal111._decode(input);
      case 112:
        return Mortal112._decode(input);
      case 113:
        return Mortal113._decode(input);
      case 114:
        return Mortal114._decode(input);
      case 115:
        return Mortal115._decode(input);
      case 116:
        return Mortal116._decode(input);
      case 117:
        return Mortal117._decode(input);
      case 118:
        return Mortal118._decode(input);
      case 119:
        return Mortal119._decode(input);
      case 120:
        return Mortal120._decode(input);
      case 121:
        return Mortal121._decode(input);
      case 122:
        return Mortal122._decode(input);
      case 123:
        return Mortal123._decode(input);
      case 124:
        return Mortal124._decode(input);
      case 125:
        return Mortal125._decode(input);
      case 126:
        return Mortal126._decode(input);
      case 127:
        return Mortal127._decode(input);
      case 128:
        return Mortal128._decode(input);
      case 129:
        return Mortal129._decode(input);
      case 130:
        return Mortal130._decode(input);
      case 131:
        return Mortal131._decode(input);
      case 132:
        return Mortal132._decode(input);
      case 133:
        return Mortal133._decode(input);
      case 134:
        return Mortal134._decode(input);
      case 135:
        return Mortal135._decode(input);
      case 136:
        return Mortal136._decode(input);
      case 137:
        return Mortal137._decode(input);
      case 138:
        return Mortal138._decode(input);
      case 139:
        return Mortal139._decode(input);
      case 140:
        return Mortal140._decode(input);
      case 141:
        return Mortal141._decode(input);
      case 142:
        return Mortal142._decode(input);
      case 143:
        return Mortal143._decode(input);
      case 144:
        return Mortal144._decode(input);
      case 145:
        return Mortal145._decode(input);
      case 146:
        return Mortal146._decode(input);
      case 147:
        return Mortal147._decode(input);
      case 148:
        return Mortal148._decode(input);
      case 149:
        return Mortal149._decode(input);
      case 150:
        return Mortal150._decode(input);
      case 151:
        return Mortal151._decode(input);
      case 152:
        return Mortal152._decode(input);
      case 153:
        return Mortal153._decode(input);
      case 154:
        return Mortal154._decode(input);
      case 155:
        return Mortal155._decode(input);
      case 156:
        return Mortal156._decode(input);
      case 157:
        return Mortal157._decode(input);
      case 158:
        return Mortal158._decode(input);
      case 159:
        return Mortal159._decode(input);
      case 160:
        return Mortal160._decode(input);
      case 161:
        return Mortal161._decode(input);
      case 162:
        return Mortal162._decode(input);
      case 163:
        return Mortal163._decode(input);
      case 164:
        return Mortal164._decode(input);
      case 165:
        return Mortal165._decode(input);
      case 166:
        return Mortal166._decode(input);
      case 167:
        return Mortal167._decode(input);
      case 168:
        return Mortal168._decode(input);
      case 169:
        return Mortal169._decode(input);
      case 170:
        return Mortal170._decode(input);
      case 171:
        return Mortal171._decode(input);
      case 172:
        return Mortal172._decode(input);
      case 173:
        return Mortal173._decode(input);
      case 174:
        return Mortal174._decode(input);
      case 175:
        return Mortal175._decode(input);
      case 176:
        return Mortal176._decode(input);
      case 177:
        return Mortal177._decode(input);
      case 178:
        return Mortal178._decode(input);
      case 179:
        return Mortal179._decode(input);
      case 180:
        return Mortal180._decode(input);
      case 181:
        return Mortal181._decode(input);
      case 182:
        return Mortal182._decode(input);
      case 183:
        return Mortal183._decode(input);
      case 184:
        return Mortal184._decode(input);
      case 185:
        return Mortal185._decode(input);
      case 186:
        return Mortal186._decode(input);
      case 187:
        return Mortal187._decode(input);
      case 188:
        return Mortal188._decode(input);
      case 189:
        return Mortal189._decode(input);
      case 190:
        return Mortal190._decode(input);
      case 191:
        return Mortal191._decode(input);
      case 192:
        return Mortal192._decode(input);
      case 193:
        return Mortal193._decode(input);
      case 194:
        return Mortal194._decode(input);
      case 195:
        return Mortal195._decode(input);
      case 196:
        return Mortal196._decode(input);
      case 197:
        return Mortal197._decode(input);
      case 198:
        return Mortal198._decode(input);
      case 199:
        return Mortal199._decode(input);
      case 200:
        return Mortal200._decode(input);
      case 201:
        return Mortal201._decode(input);
      case 202:
        return Mortal202._decode(input);
      case 203:
        return Mortal203._decode(input);
      case 204:
        return Mortal204._decode(input);
      case 205:
        return Mortal205._decode(input);
      case 206:
        return Mortal206._decode(input);
      case 207:
        return Mortal207._decode(input);
      case 208:
        return Mortal208._decode(input);
      case 209:
        return Mortal209._decode(input);
      case 210:
        return Mortal210._decode(input);
      case 211:
        return Mortal211._decode(input);
      case 212:
        return Mortal212._decode(input);
      case 213:
        return Mortal213._decode(input);
      case 214:
        return Mortal214._decode(input);
      case 215:
        return Mortal215._decode(input);
      case 216:
        return Mortal216._decode(input);
      case 217:
        return Mortal217._decode(input);
      case 218:
        return Mortal218._decode(input);
      case 219:
        return Mortal219._decode(input);
      case 220:
        return Mortal220._decode(input);
      case 221:
        return Mortal221._decode(input);
      case 222:
        return Mortal222._decode(input);
      case 223:
        return Mortal223._decode(input);
      case 224:
        return Mortal224._decode(input);
      case 225:
        return Mortal225._decode(input);
      case 226:
        return Mortal226._decode(input);
      case 227:
        return Mortal227._decode(input);
      case 228:
        return Mortal228._decode(input);
      case 229:
        return Mortal229._decode(input);
      case 230:
        return Mortal230._decode(input);
      case 231:
        return Mortal231._decode(input);
      case 232:
        return Mortal232._decode(input);
      case 233:
        return Mortal233._decode(input);
      case 234:
        return Mortal234._decode(input);
      case 235:
        return Mortal235._decode(input);
      case 236:
        return Mortal236._decode(input);
      case 237:
        return Mortal237._decode(input);
      case 238:
        return Mortal238._decode(input);
      case 239:
        return Mortal239._decode(input);
      case 240:
        return Mortal240._decode(input);
      case 241:
        return Mortal241._decode(input);
      case 242:
        return Mortal242._decode(input);
      case 243:
        return Mortal243._decode(input);
      case 244:
        return Mortal244._decode(input);
      case 245:
        return Mortal245._decode(input);
      case 246:
        return Mortal246._decode(input);
      case 247:
        return Mortal247._decode(input);
      case 248:
        return Mortal248._decode(input);
      case 249:
        return Mortal249._decode(input);
      case 250:
        return Mortal250._decode(input);
      case 251:
        return Mortal251._decode(input);
      case 252:
        return Mortal252._decode(input);
      case 253:
        return Mortal253._decode(input);
      case 254:
        return Mortal254._decode(input);
      case 255:
        return Mortal255._decode(input);
      default:
        throw Exception('Era: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Era value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Immortal:
        (value as Immortal).encodeTo(output);
        break;
      case Mortal1:
        (value as Mortal1).encodeTo(output);
        break;
      case Mortal2:
        (value as Mortal2).encodeTo(output);
        break;
      case Mortal3:
        (value as Mortal3).encodeTo(output);
        break;
      case Mortal4:
        (value as Mortal4).encodeTo(output);
        break;
      case Mortal5:
        (value as Mortal5).encodeTo(output);
        break;
      case Mortal6:
        (value as Mortal6).encodeTo(output);
        break;
      case Mortal7:
        (value as Mortal7).encodeTo(output);
        break;
      case Mortal8:
        (value as Mortal8).encodeTo(output);
        break;
      case Mortal9:
        (value as Mortal9).encodeTo(output);
        break;
      case Mortal10:
        (value as Mortal10).encodeTo(output);
        break;
      case Mortal11:
        (value as Mortal11).encodeTo(output);
        break;
      case Mortal12:
        (value as Mortal12).encodeTo(output);
        break;
      case Mortal13:
        (value as Mortal13).encodeTo(output);
        break;
      case Mortal14:
        (value as Mortal14).encodeTo(output);
        break;
      case Mortal15:
        (value as Mortal15).encodeTo(output);
        break;
      case Mortal16:
        (value as Mortal16).encodeTo(output);
        break;
      case Mortal17:
        (value as Mortal17).encodeTo(output);
        break;
      case Mortal18:
        (value as Mortal18).encodeTo(output);
        break;
      case Mortal19:
        (value as Mortal19).encodeTo(output);
        break;
      case Mortal20:
        (value as Mortal20).encodeTo(output);
        break;
      case Mortal21:
        (value as Mortal21).encodeTo(output);
        break;
      case Mortal22:
        (value as Mortal22).encodeTo(output);
        break;
      case Mortal23:
        (value as Mortal23).encodeTo(output);
        break;
      case Mortal24:
        (value as Mortal24).encodeTo(output);
        break;
      case Mortal25:
        (value as Mortal25).encodeTo(output);
        break;
      case Mortal26:
        (value as Mortal26).encodeTo(output);
        break;
      case Mortal27:
        (value as Mortal27).encodeTo(output);
        break;
      case Mortal28:
        (value as Mortal28).encodeTo(output);
        break;
      case Mortal29:
        (value as Mortal29).encodeTo(output);
        break;
      case Mortal30:
        (value as Mortal30).encodeTo(output);
        break;
      case Mortal31:
        (value as Mortal31).encodeTo(output);
        break;
      case Mortal32:
        (value as Mortal32).encodeTo(output);
        break;
      case Mortal33:
        (value as Mortal33).encodeTo(output);
        break;
      case Mortal34:
        (value as Mortal34).encodeTo(output);
        break;
      case Mortal35:
        (value as Mortal35).encodeTo(output);
        break;
      case Mortal36:
        (value as Mortal36).encodeTo(output);
        break;
      case Mortal37:
        (value as Mortal37).encodeTo(output);
        break;
      case Mortal38:
        (value as Mortal38).encodeTo(output);
        break;
      case Mortal39:
        (value as Mortal39).encodeTo(output);
        break;
      case Mortal40:
        (value as Mortal40).encodeTo(output);
        break;
      case Mortal41:
        (value as Mortal41).encodeTo(output);
        break;
      case Mortal42:
        (value as Mortal42).encodeTo(output);
        break;
      case Mortal43:
        (value as Mortal43).encodeTo(output);
        break;
      case Mortal44:
        (value as Mortal44).encodeTo(output);
        break;
      case Mortal45:
        (value as Mortal45).encodeTo(output);
        break;
      case Mortal46:
        (value as Mortal46).encodeTo(output);
        break;
      case Mortal47:
        (value as Mortal47).encodeTo(output);
        break;
      case Mortal48:
        (value as Mortal48).encodeTo(output);
        break;
      case Mortal49:
        (value as Mortal49).encodeTo(output);
        break;
      case Mortal50:
        (value as Mortal50).encodeTo(output);
        break;
      case Mortal51:
        (value as Mortal51).encodeTo(output);
        break;
      case Mortal52:
        (value as Mortal52).encodeTo(output);
        break;
      case Mortal53:
        (value as Mortal53).encodeTo(output);
        break;
      case Mortal54:
        (value as Mortal54).encodeTo(output);
        break;
      case Mortal55:
        (value as Mortal55).encodeTo(output);
        break;
      case Mortal56:
        (value as Mortal56).encodeTo(output);
        break;
      case Mortal57:
        (value as Mortal57).encodeTo(output);
        break;
      case Mortal58:
        (value as Mortal58).encodeTo(output);
        break;
      case Mortal59:
        (value as Mortal59).encodeTo(output);
        break;
      case Mortal60:
        (value as Mortal60).encodeTo(output);
        break;
      case Mortal61:
        (value as Mortal61).encodeTo(output);
        break;
      case Mortal62:
        (value as Mortal62).encodeTo(output);
        break;
      case Mortal63:
        (value as Mortal63).encodeTo(output);
        break;
      case Mortal64:
        (value as Mortal64).encodeTo(output);
        break;
      case Mortal65:
        (value as Mortal65).encodeTo(output);
        break;
      case Mortal66:
        (value as Mortal66).encodeTo(output);
        break;
      case Mortal67:
        (value as Mortal67).encodeTo(output);
        break;
      case Mortal68:
        (value as Mortal68).encodeTo(output);
        break;
      case Mortal69:
        (value as Mortal69).encodeTo(output);
        break;
      case Mortal70:
        (value as Mortal70).encodeTo(output);
        break;
      case Mortal71:
        (value as Mortal71).encodeTo(output);
        break;
      case Mortal72:
        (value as Mortal72).encodeTo(output);
        break;
      case Mortal73:
        (value as Mortal73).encodeTo(output);
        break;
      case Mortal74:
        (value as Mortal74).encodeTo(output);
        break;
      case Mortal75:
        (value as Mortal75).encodeTo(output);
        break;
      case Mortal76:
        (value as Mortal76).encodeTo(output);
        break;
      case Mortal77:
        (value as Mortal77).encodeTo(output);
        break;
      case Mortal78:
        (value as Mortal78).encodeTo(output);
        break;
      case Mortal79:
        (value as Mortal79).encodeTo(output);
        break;
      case Mortal80:
        (value as Mortal80).encodeTo(output);
        break;
      case Mortal81:
        (value as Mortal81).encodeTo(output);
        break;
      case Mortal82:
        (value as Mortal82).encodeTo(output);
        break;
      case Mortal83:
        (value as Mortal83).encodeTo(output);
        break;
      case Mortal84:
        (value as Mortal84).encodeTo(output);
        break;
      case Mortal85:
        (value as Mortal85).encodeTo(output);
        break;
      case Mortal86:
        (value as Mortal86).encodeTo(output);
        break;
      case Mortal87:
        (value as Mortal87).encodeTo(output);
        break;
      case Mortal88:
        (value as Mortal88).encodeTo(output);
        break;
      case Mortal89:
        (value as Mortal89).encodeTo(output);
        break;
      case Mortal90:
        (value as Mortal90).encodeTo(output);
        break;
      case Mortal91:
        (value as Mortal91).encodeTo(output);
        break;
      case Mortal92:
        (value as Mortal92).encodeTo(output);
        break;
      case Mortal93:
        (value as Mortal93).encodeTo(output);
        break;
      case Mortal94:
        (value as Mortal94).encodeTo(output);
        break;
      case Mortal95:
        (value as Mortal95).encodeTo(output);
        break;
      case Mortal96:
        (value as Mortal96).encodeTo(output);
        break;
      case Mortal97:
        (value as Mortal97).encodeTo(output);
        break;
      case Mortal98:
        (value as Mortal98).encodeTo(output);
        break;
      case Mortal99:
        (value as Mortal99).encodeTo(output);
        break;
      case Mortal100:
        (value as Mortal100).encodeTo(output);
        break;
      case Mortal101:
        (value as Mortal101).encodeTo(output);
        break;
      case Mortal102:
        (value as Mortal102).encodeTo(output);
        break;
      case Mortal103:
        (value as Mortal103).encodeTo(output);
        break;
      case Mortal104:
        (value as Mortal104).encodeTo(output);
        break;
      case Mortal105:
        (value as Mortal105).encodeTo(output);
        break;
      case Mortal106:
        (value as Mortal106).encodeTo(output);
        break;
      case Mortal107:
        (value as Mortal107).encodeTo(output);
        break;
      case Mortal108:
        (value as Mortal108).encodeTo(output);
        break;
      case Mortal109:
        (value as Mortal109).encodeTo(output);
        break;
      case Mortal110:
        (value as Mortal110).encodeTo(output);
        break;
      case Mortal111:
        (value as Mortal111).encodeTo(output);
        break;
      case Mortal112:
        (value as Mortal112).encodeTo(output);
        break;
      case Mortal113:
        (value as Mortal113).encodeTo(output);
        break;
      case Mortal114:
        (value as Mortal114).encodeTo(output);
        break;
      case Mortal115:
        (value as Mortal115).encodeTo(output);
        break;
      case Mortal116:
        (value as Mortal116).encodeTo(output);
        break;
      case Mortal117:
        (value as Mortal117).encodeTo(output);
        break;
      case Mortal118:
        (value as Mortal118).encodeTo(output);
        break;
      case Mortal119:
        (value as Mortal119).encodeTo(output);
        break;
      case Mortal120:
        (value as Mortal120).encodeTo(output);
        break;
      case Mortal121:
        (value as Mortal121).encodeTo(output);
        break;
      case Mortal122:
        (value as Mortal122).encodeTo(output);
        break;
      case Mortal123:
        (value as Mortal123).encodeTo(output);
        break;
      case Mortal124:
        (value as Mortal124).encodeTo(output);
        break;
      case Mortal125:
        (value as Mortal125).encodeTo(output);
        break;
      case Mortal126:
        (value as Mortal126).encodeTo(output);
        break;
      case Mortal127:
        (value as Mortal127).encodeTo(output);
        break;
      case Mortal128:
        (value as Mortal128).encodeTo(output);
        break;
      case Mortal129:
        (value as Mortal129).encodeTo(output);
        break;
      case Mortal130:
        (value as Mortal130).encodeTo(output);
        break;
      case Mortal131:
        (value as Mortal131).encodeTo(output);
        break;
      case Mortal132:
        (value as Mortal132).encodeTo(output);
        break;
      case Mortal133:
        (value as Mortal133).encodeTo(output);
        break;
      case Mortal134:
        (value as Mortal134).encodeTo(output);
        break;
      case Mortal135:
        (value as Mortal135).encodeTo(output);
        break;
      case Mortal136:
        (value as Mortal136).encodeTo(output);
        break;
      case Mortal137:
        (value as Mortal137).encodeTo(output);
        break;
      case Mortal138:
        (value as Mortal138).encodeTo(output);
        break;
      case Mortal139:
        (value as Mortal139).encodeTo(output);
        break;
      case Mortal140:
        (value as Mortal140).encodeTo(output);
        break;
      case Mortal141:
        (value as Mortal141).encodeTo(output);
        break;
      case Mortal142:
        (value as Mortal142).encodeTo(output);
        break;
      case Mortal143:
        (value as Mortal143).encodeTo(output);
        break;
      case Mortal144:
        (value as Mortal144).encodeTo(output);
        break;
      case Mortal145:
        (value as Mortal145).encodeTo(output);
        break;
      case Mortal146:
        (value as Mortal146).encodeTo(output);
        break;
      case Mortal147:
        (value as Mortal147).encodeTo(output);
        break;
      case Mortal148:
        (value as Mortal148).encodeTo(output);
        break;
      case Mortal149:
        (value as Mortal149).encodeTo(output);
        break;
      case Mortal150:
        (value as Mortal150).encodeTo(output);
        break;
      case Mortal151:
        (value as Mortal151).encodeTo(output);
        break;
      case Mortal152:
        (value as Mortal152).encodeTo(output);
        break;
      case Mortal153:
        (value as Mortal153).encodeTo(output);
        break;
      case Mortal154:
        (value as Mortal154).encodeTo(output);
        break;
      case Mortal155:
        (value as Mortal155).encodeTo(output);
        break;
      case Mortal156:
        (value as Mortal156).encodeTo(output);
        break;
      case Mortal157:
        (value as Mortal157).encodeTo(output);
        break;
      case Mortal158:
        (value as Mortal158).encodeTo(output);
        break;
      case Mortal159:
        (value as Mortal159).encodeTo(output);
        break;
      case Mortal160:
        (value as Mortal160).encodeTo(output);
        break;
      case Mortal161:
        (value as Mortal161).encodeTo(output);
        break;
      case Mortal162:
        (value as Mortal162).encodeTo(output);
        break;
      case Mortal163:
        (value as Mortal163).encodeTo(output);
        break;
      case Mortal164:
        (value as Mortal164).encodeTo(output);
        break;
      case Mortal165:
        (value as Mortal165).encodeTo(output);
        break;
      case Mortal166:
        (value as Mortal166).encodeTo(output);
        break;
      case Mortal167:
        (value as Mortal167).encodeTo(output);
        break;
      case Mortal168:
        (value as Mortal168).encodeTo(output);
        break;
      case Mortal169:
        (value as Mortal169).encodeTo(output);
        break;
      case Mortal170:
        (value as Mortal170).encodeTo(output);
        break;
      case Mortal171:
        (value as Mortal171).encodeTo(output);
        break;
      case Mortal172:
        (value as Mortal172).encodeTo(output);
        break;
      case Mortal173:
        (value as Mortal173).encodeTo(output);
        break;
      case Mortal174:
        (value as Mortal174).encodeTo(output);
        break;
      case Mortal175:
        (value as Mortal175).encodeTo(output);
        break;
      case Mortal176:
        (value as Mortal176).encodeTo(output);
        break;
      case Mortal177:
        (value as Mortal177).encodeTo(output);
        break;
      case Mortal178:
        (value as Mortal178).encodeTo(output);
        break;
      case Mortal179:
        (value as Mortal179).encodeTo(output);
        break;
      case Mortal180:
        (value as Mortal180).encodeTo(output);
        break;
      case Mortal181:
        (value as Mortal181).encodeTo(output);
        break;
      case Mortal182:
        (value as Mortal182).encodeTo(output);
        break;
      case Mortal183:
        (value as Mortal183).encodeTo(output);
        break;
      case Mortal184:
        (value as Mortal184).encodeTo(output);
        break;
      case Mortal185:
        (value as Mortal185).encodeTo(output);
        break;
      case Mortal186:
        (value as Mortal186).encodeTo(output);
        break;
      case Mortal187:
        (value as Mortal187).encodeTo(output);
        break;
      case Mortal188:
        (value as Mortal188).encodeTo(output);
        break;
      case Mortal189:
        (value as Mortal189).encodeTo(output);
        break;
      case Mortal190:
        (value as Mortal190).encodeTo(output);
        break;
      case Mortal191:
        (value as Mortal191).encodeTo(output);
        break;
      case Mortal192:
        (value as Mortal192).encodeTo(output);
        break;
      case Mortal193:
        (value as Mortal193).encodeTo(output);
        break;
      case Mortal194:
        (value as Mortal194).encodeTo(output);
        break;
      case Mortal195:
        (value as Mortal195).encodeTo(output);
        break;
      case Mortal196:
        (value as Mortal196).encodeTo(output);
        break;
      case Mortal197:
        (value as Mortal197).encodeTo(output);
        break;
      case Mortal198:
        (value as Mortal198).encodeTo(output);
        break;
      case Mortal199:
        (value as Mortal199).encodeTo(output);
        break;
      case Mortal200:
        (value as Mortal200).encodeTo(output);
        break;
      case Mortal201:
        (value as Mortal201).encodeTo(output);
        break;
      case Mortal202:
        (value as Mortal202).encodeTo(output);
        break;
      case Mortal203:
        (value as Mortal203).encodeTo(output);
        break;
      case Mortal204:
        (value as Mortal204).encodeTo(output);
        break;
      case Mortal205:
        (value as Mortal205).encodeTo(output);
        break;
      case Mortal206:
        (value as Mortal206).encodeTo(output);
        break;
      case Mortal207:
        (value as Mortal207).encodeTo(output);
        break;
      case Mortal208:
        (value as Mortal208).encodeTo(output);
        break;
      case Mortal209:
        (value as Mortal209).encodeTo(output);
        break;
      case Mortal210:
        (value as Mortal210).encodeTo(output);
        break;
      case Mortal211:
        (value as Mortal211).encodeTo(output);
        break;
      case Mortal212:
        (value as Mortal212).encodeTo(output);
        break;
      case Mortal213:
        (value as Mortal213).encodeTo(output);
        break;
      case Mortal214:
        (value as Mortal214).encodeTo(output);
        break;
      case Mortal215:
        (value as Mortal215).encodeTo(output);
        break;
      case Mortal216:
        (value as Mortal216).encodeTo(output);
        break;
      case Mortal217:
        (value as Mortal217).encodeTo(output);
        break;
      case Mortal218:
        (value as Mortal218).encodeTo(output);
        break;
      case Mortal219:
        (value as Mortal219).encodeTo(output);
        break;
      case Mortal220:
        (value as Mortal220).encodeTo(output);
        break;
      case Mortal221:
        (value as Mortal221).encodeTo(output);
        break;
      case Mortal222:
        (value as Mortal222).encodeTo(output);
        break;
      case Mortal223:
        (value as Mortal223).encodeTo(output);
        break;
      case Mortal224:
        (value as Mortal224).encodeTo(output);
        break;
      case Mortal225:
        (value as Mortal225).encodeTo(output);
        break;
      case Mortal226:
        (value as Mortal226).encodeTo(output);
        break;
      case Mortal227:
        (value as Mortal227).encodeTo(output);
        break;
      case Mortal228:
        (value as Mortal228).encodeTo(output);
        break;
      case Mortal229:
        (value as Mortal229).encodeTo(output);
        break;
      case Mortal230:
        (value as Mortal230).encodeTo(output);
        break;
      case Mortal231:
        (value as Mortal231).encodeTo(output);
        break;
      case Mortal232:
        (value as Mortal232).encodeTo(output);
        break;
      case Mortal233:
        (value as Mortal233).encodeTo(output);
        break;
      case Mortal234:
        (value as Mortal234).encodeTo(output);
        break;
      case Mortal235:
        (value as Mortal235).encodeTo(output);
        break;
      case Mortal236:
        (value as Mortal236).encodeTo(output);
        break;
      case Mortal237:
        (value as Mortal237).encodeTo(output);
        break;
      case Mortal238:
        (value as Mortal238).encodeTo(output);
        break;
      case Mortal239:
        (value as Mortal239).encodeTo(output);
        break;
      case Mortal240:
        (value as Mortal240).encodeTo(output);
        break;
      case Mortal241:
        (value as Mortal241).encodeTo(output);
        break;
      case Mortal242:
        (value as Mortal242).encodeTo(output);
        break;
      case Mortal243:
        (value as Mortal243).encodeTo(output);
        break;
      case Mortal244:
        (value as Mortal244).encodeTo(output);
        break;
      case Mortal245:
        (value as Mortal245).encodeTo(output);
        break;
      case Mortal246:
        (value as Mortal246).encodeTo(output);
        break;
      case Mortal247:
        (value as Mortal247).encodeTo(output);
        break;
      case Mortal248:
        (value as Mortal248).encodeTo(output);
        break;
      case Mortal249:
        (value as Mortal249).encodeTo(output);
        break;
      case Mortal250:
        (value as Mortal250).encodeTo(output);
        break;
      case Mortal251:
        (value as Mortal251).encodeTo(output);
        break;
      case Mortal252:
        (value as Mortal252).encodeTo(output);
        break;
      case Mortal253:
        (value as Mortal253).encodeTo(output);
        break;
      case Mortal254:
        (value as Mortal254).encodeTo(output);
        break;
      case Mortal255:
        (value as Mortal255).encodeTo(output);
        break;
      default:
        throw Exception(
            'Era: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Era value) {
    switch (value.runtimeType) {
      case Immortal:
        return 1;
      case Mortal1:
        return (value as Mortal1)._sizeHint();
      case Mortal2:
        return (value as Mortal2)._sizeHint();
      case Mortal3:
        return (value as Mortal3)._sizeHint();
      case Mortal4:
        return (value as Mortal4)._sizeHint();
      case Mortal5:
        return (value as Mortal5)._sizeHint();
      case Mortal6:
        return (value as Mortal6)._sizeHint();
      case Mortal7:
        return (value as Mortal7)._sizeHint();
      case Mortal8:
        return (value as Mortal8)._sizeHint();
      case Mortal9:
        return (value as Mortal9)._sizeHint();
      case Mortal10:
        return (value as Mortal10)._sizeHint();
      case Mortal11:
        return (value as Mortal11)._sizeHint();
      case Mortal12:
        return (value as Mortal12)._sizeHint();
      case Mortal13:
        return (value as Mortal13)._sizeHint();
      case Mortal14:
        return (value as Mortal14)._sizeHint();
      case Mortal15:
        return (value as Mortal15)._sizeHint();
      case Mortal16:
        return (value as Mortal16)._sizeHint();
      case Mortal17:
        return (value as Mortal17)._sizeHint();
      case Mortal18:
        return (value as Mortal18)._sizeHint();
      case Mortal19:
        return (value as Mortal19)._sizeHint();
      case Mortal20:
        return (value as Mortal20)._sizeHint();
      case Mortal21:
        return (value as Mortal21)._sizeHint();
      case Mortal22:
        return (value as Mortal22)._sizeHint();
      case Mortal23:
        return (value as Mortal23)._sizeHint();
      case Mortal24:
        return (value as Mortal24)._sizeHint();
      case Mortal25:
        return (value as Mortal25)._sizeHint();
      case Mortal26:
        return (value as Mortal26)._sizeHint();
      case Mortal27:
        return (value as Mortal27)._sizeHint();
      case Mortal28:
        return (value as Mortal28)._sizeHint();
      case Mortal29:
        return (value as Mortal29)._sizeHint();
      case Mortal30:
        return (value as Mortal30)._sizeHint();
      case Mortal31:
        return (value as Mortal31)._sizeHint();
      case Mortal32:
        return (value as Mortal32)._sizeHint();
      case Mortal33:
        return (value as Mortal33)._sizeHint();
      case Mortal34:
        return (value as Mortal34)._sizeHint();
      case Mortal35:
        return (value as Mortal35)._sizeHint();
      case Mortal36:
        return (value as Mortal36)._sizeHint();
      case Mortal37:
        return (value as Mortal37)._sizeHint();
      case Mortal38:
        return (value as Mortal38)._sizeHint();
      case Mortal39:
        return (value as Mortal39)._sizeHint();
      case Mortal40:
        return (value as Mortal40)._sizeHint();
      case Mortal41:
        return (value as Mortal41)._sizeHint();
      case Mortal42:
        return (value as Mortal42)._sizeHint();
      case Mortal43:
        return (value as Mortal43)._sizeHint();
      case Mortal44:
        return (value as Mortal44)._sizeHint();
      case Mortal45:
        return (value as Mortal45)._sizeHint();
      case Mortal46:
        return (value as Mortal46)._sizeHint();
      case Mortal47:
        return (value as Mortal47)._sizeHint();
      case Mortal48:
        return (value as Mortal48)._sizeHint();
      case Mortal49:
        return (value as Mortal49)._sizeHint();
      case Mortal50:
        return (value as Mortal50)._sizeHint();
      case Mortal51:
        return (value as Mortal51)._sizeHint();
      case Mortal52:
        return (value as Mortal52)._sizeHint();
      case Mortal53:
        return (value as Mortal53)._sizeHint();
      case Mortal54:
        return (value as Mortal54)._sizeHint();
      case Mortal55:
        return (value as Mortal55)._sizeHint();
      case Mortal56:
        return (value as Mortal56)._sizeHint();
      case Mortal57:
        return (value as Mortal57)._sizeHint();
      case Mortal58:
        return (value as Mortal58)._sizeHint();
      case Mortal59:
        return (value as Mortal59)._sizeHint();
      case Mortal60:
        return (value as Mortal60)._sizeHint();
      case Mortal61:
        return (value as Mortal61)._sizeHint();
      case Mortal62:
        return (value as Mortal62)._sizeHint();
      case Mortal63:
        return (value as Mortal63)._sizeHint();
      case Mortal64:
        return (value as Mortal64)._sizeHint();
      case Mortal65:
        return (value as Mortal65)._sizeHint();
      case Mortal66:
        return (value as Mortal66)._sizeHint();
      case Mortal67:
        return (value as Mortal67)._sizeHint();
      case Mortal68:
        return (value as Mortal68)._sizeHint();
      case Mortal69:
        return (value as Mortal69)._sizeHint();
      case Mortal70:
        return (value as Mortal70)._sizeHint();
      case Mortal71:
        return (value as Mortal71)._sizeHint();
      case Mortal72:
        return (value as Mortal72)._sizeHint();
      case Mortal73:
        return (value as Mortal73)._sizeHint();
      case Mortal74:
        return (value as Mortal74)._sizeHint();
      case Mortal75:
        return (value as Mortal75)._sizeHint();
      case Mortal76:
        return (value as Mortal76)._sizeHint();
      case Mortal77:
        return (value as Mortal77)._sizeHint();
      case Mortal78:
        return (value as Mortal78)._sizeHint();
      case Mortal79:
        return (value as Mortal79)._sizeHint();
      case Mortal80:
        return (value as Mortal80)._sizeHint();
      case Mortal81:
        return (value as Mortal81)._sizeHint();
      case Mortal82:
        return (value as Mortal82)._sizeHint();
      case Mortal83:
        return (value as Mortal83)._sizeHint();
      case Mortal84:
        return (value as Mortal84)._sizeHint();
      case Mortal85:
        return (value as Mortal85)._sizeHint();
      case Mortal86:
        return (value as Mortal86)._sizeHint();
      case Mortal87:
        return (value as Mortal87)._sizeHint();
      case Mortal88:
        return (value as Mortal88)._sizeHint();
      case Mortal89:
        return (value as Mortal89)._sizeHint();
      case Mortal90:
        return (value as Mortal90)._sizeHint();
      case Mortal91:
        return (value as Mortal91)._sizeHint();
      case Mortal92:
        return (value as Mortal92)._sizeHint();
      case Mortal93:
        return (value as Mortal93)._sizeHint();
      case Mortal94:
        return (value as Mortal94)._sizeHint();
      case Mortal95:
        return (value as Mortal95)._sizeHint();
      case Mortal96:
        return (value as Mortal96)._sizeHint();
      case Mortal97:
        return (value as Mortal97)._sizeHint();
      case Mortal98:
        return (value as Mortal98)._sizeHint();
      case Mortal99:
        return (value as Mortal99)._sizeHint();
      case Mortal100:
        return (value as Mortal100)._sizeHint();
      case Mortal101:
        return (value as Mortal101)._sizeHint();
      case Mortal102:
        return (value as Mortal102)._sizeHint();
      case Mortal103:
        return (value as Mortal103)._sizeHint();
      case Mortal104:
        return (value as Mortal104)._sizeHint();
      case Mortal105:
        return (value as Mortal105)._sizeHint();
      case Mortal106:
        return (value as Mortal106)._sizeHint();
      case Mortal107:
        return (value as Mortal107)._sizeHint();
      case Mortal108:
        return (value as Mortal108)._sizeHint();
      case Mortal109:
        return (value as Mortal109)._sizeHint();
      case Mortal110:
        return (value as Mortal110)._sizeHint();
      case Mortal111:
        return (value as Mortal111)._sizeHint();
      case Mortal112:
        return (value as Mortal112)._sizeHint();
      case Mortal113:
        return (value as Mortal113)._sizeHint();
      case Mortal114:
        return (value as Mortal114)._sizeHint();
      case Mortal115:
        return (value as Mortal115)._sizeHint();
      case Mortal116:
        return (value as Mortal116)._sizeHint();
      case Mortal117:
        return (value as Mortal117)._sizeHint();
      case Mortal118:
        return (value as Mortal118)._sizeHint();
      case Mortal119:
        return (value as Mortal119)._sizeHint();
      case Mortal120:
        return (value as Mortal120)._sizeHint();
      case Mortal121:
        return (value as Mortal121)._sizeHint();
      case Mortal122:
        return (value as Mortal122)._sizeHint();
      case Mortal123:
        return (value as Mortal123)._sizeHint();
      case Mortal124:
        return (value as Mortal124)._sizeHint();
      case Mortal125:
        return (value as Mortal125)._sizeHint();
      case Mortal126:
        return (value as Mortal126)._sizeHint();
      case Mortal127:
        return (value as Mortal127)._sizeHint();
      case Mortal128:
        return (value as Mortal128)._sizeHint();
      case Mortal129:
        return (value as Mortal129)._sizeHint();
      case Mortal130:
        return (value as Mortal130)._sizeHint();
      case Mortal131:
        return (value as Mortal131)._sizeHint();
      case Mortal132:
        return (value as Mortal132)._sizeHint();
      case Mortal133:
        return (value as Mortal133)._sizeHint();
      case Mortal134:
        return (value as Mortal134)._sizeHint();
      case Mortal135:
        return (value as Mortal135)._sizeHint();
      case Mortal136:
        return (value as Mortal136)._sizeHint();
      case Mortal137:
        return (value as Mortal137)._sizeHint();
      case Mortal138:
        return (value as Mortal138)._sizeHint();
      case Mortal139:
        return (value as Mortal139)._sizeHint();
      case Mortal140:
        return (value as Mortal140)._sizeHint();
      case Mortal141:
        return (value as Mortal141)._sizeHint();
      case Mortal142:
        return (value as Mortal142)._sizeHint();
      case Mortal143:
        return (value as Mortal143)._sizeHint();
      case Mortal144:
        return (value as Mortal144)._sizeHint();
      case Mortal145:
        return (value as Mortal145)._sizeHint();
      case Mortal146:
        return (value as Mortal146)._sizeHint();
      case Mortal147:
        return (value as Mortal147)._sizeHint();
      case Mortal148:
        return (value as Mortal148)._sizeHint();
      case Mortal149:
        return (value as Mortal149)._sizeHint();
      case Mortal150:
        return (value as Mortal150)._sizeHint();
      case Mortal151:
        return (value as Mortal151)._sizeHint();
      case Mortal152:
        return (value as Mortal152)._sizeHint();
      case Mortal153:
        return (value as Mortal153)._sizeHint();
      case Mortal154:
        return (value as Mortal154)._sizeHint();
      case Mortal155:
        return (value as Mortal155)._sizeHint();
      case Mortal156:
        return (value as Mortal156)._sizeHint();
      case Mortal157:
        return (value as Mortal157)._sizeHint();
      case Mortal158:
        return (value as Mortal158)._sizeHint();
      case Mortal159:
        return (value as Mortal159)._sizeHint();
      case Mortal160:
        return (value as Mortal160)._sizeHint();
      case Mortal161:
        return (value as Mortal161)._sizeHint();
      case Mortal162:
        return (value as Mortal162)._sizeHint();
      case Mortal163:
        return (value as Mortal163)._sizeHint();
      case Mortal164:
        return (value as Mortal164)._sizeHint();
      case Mortal165:
        return (value as Mortal165)._sizeHint();
      case Mortal166:
        return (value as Mortal166)._sizeHint();
      case Mortal167:
        return (value as Mortal167)._sizeHint();
      case Mortal168:
        return (value as Mortal168)._sizeHint();
      case Mortal169:
        return (value as Mortal169)._sizeHint();
      case Mortal170:
        return (value as Mortal170)._sizeHint();
      case Mortal171:
        return (value as Mortal171)._sizeHint();
      case Mortal172:
        return (value as Mortal172)._sizeHint();
      case Mortal173:
        return (value as Mortal173)._sizeHint();
      case Mortal174:
        return (value as Mortal174)._sizeHint();
      case Mortal175:
        return (value as Mortal175)._sizeHint();
      case Mortal176:
        return (value as Mortal176)._sizeHint();
      case Mortal177:
        return (value as Mortal177)._sizeHint();
      case Mortal178:
        return (value as Mortal178)._sizeHint();
      case Mortal179:
        return (value as Mortal179)._sizeHint();
      case Mortal180:
        return (value as Mortal180)._sizeHint();
      case Mortal181:
        return (value as Mortal181)._sizeHint();
      case Mortal182:
        return (value as Mortal182)._sizeHint();
      case Mortal183:
        return (value as Mortal183)._sizeHint();
      case Mortal184:
        return (value as Mortal184)._sizeHint();
      case Mortal185:
        return (value as Mortal185)._sizeHint();
      case Mortal186:
        return (value as Mortal186)._sizeHint();
      case Mortal187:
        return (value as Mortal187)._sizeHint();
      case Mortal188:
        return (value as Mortal188)._sizeHint();
      case Mortal189:
        return (value as Mortal189)._sizeHint();
      case Mortal190:
        return (value as Mortal190)._sizeHint();
      case Mortal191:
        return (value as Mortal191)._sizeHint();
      case Mortal192:
        return (value as Mortal192)._sizeHint();
      case Mortal193:
        return (value as Mortal193)._sizeHint();
      case Mortal194:
        return (value as Mortal194)._sizeHint();
      case Mortal195:
        return (value as Mortal195)._sizeHint();
      case Mortal196:
        return (value as Mortal196)._sizeHint();
      case Mortal197:
        return (value as Mortal197)._sizeHint();
      case Mortal198:
        return (value as Mortal198)._sizeHint();
      case Mortal199:
        return (value as Mortal199)._sizeHint();
      case Mortal200:
        return (value as Mortal200)._sizeHint();
      case Mortal201:
        return (value as Mortal201)._sizeHint();
      case Mortal202:
        return (value as Mortal202)._sizeHint();
      case Mortal203:
        return (value as Mortal203)._sizeHint();
      case Mortal204:
        return (value as Mortal204)._sizeHint();
      case Mortal205:
        return (value as Mortal205)._sizeHint();
      case Mortal206:
        return (value as Mortal206)._sizeHint();
      case Mortal207:
        return (value as Mortal207)._sizeHint();
      case Mortal208:
        return (value as Mortal208)._sizeHint();
      case Mortal209:
        return (value as Mortal209)._sizeHint();
      case Mortal210:
        return (value as Mortal210)._sizeHint();
      case Mortal211:
        return (value as Mortal211)._sizeHint();
      case Mortal212:
        return (value as Mortal212)._sizeHint();
      case Mortal213:
        return (value as Mortal213)._sizeHint();
      case Mortal214:
        return (value as Mortal214)._sizeHint();
      case Mortal215:
        return (value as Mortal215)._sizeHint();
      case Mortal216:
        return (value as Mortal216)._sizeHint();
      case Mortal217:
        return (value as Mortal217)._sizeHint();
      case Mortal218:
        return (value as Mortal218)._sizeHint();
      case Mortal219:
        return (value as Mortal219)._sizeHint();
      case Mortal220:
        return (value as Mortal220)._sizeHint();
      case Mortal221:
        return (value as Mortal221)._sizeHint();
      case Mortal222:
        return (value as Mortal222)._sizeHint();
      case Mortal223:
        return (value as Mortal223)._sizeHint();
      case Mortal224:
        return (value as Mortal224)._sizeHint();
      case Mortal225:
        return (value as Mortal225)._sizeHint();
      case Mortal226:
        return (value as Mortal226)._sizeHint();
      case Mortal227:
        return (value as Mortal227)._sizeHint();
      case Mortal228:
        return (value as Mortal228)._sizeHint();
      case Mortal229:
        return (value as Mortal229)._sizeHint();
      case Mortal230:
        return (value as Mortal230)._sizeHint();
      case Mortal231:
        return (value as Mortal231)._sizeHint();
      case Mortal232:
        return (value as Mortal232)._sizeHint();
      case Mortal233:
        return (value as Mortal233)._sizeHint();
      case Mortal234:
        return (value as Mortal234)._sizeHint();
      case Mortal235:
        return (value as Mortal235)._sizeHint();
      case Mortal236:
        return (value as Mortal236)._sizeHint();
      case Mortal237:
        return (value as Mortal237)._sizeHint();
      case Mortal238:
        return (value as Mortal238)._sizeHint();
      case Mortal239:
        return (value as Mortal239)._sizeHint();
      case Mortal240:
        return (value as Mortal240)._sizeHint();
      case Mortal241:
        return (value as Mortal241)._sizeHint();
      case Mortal242:
        return (value as Mortal242)._sizeHint();
      case Mortal243:
        return (value as Mortal243)._sizeHint();
      case Mortal244:
        return (value as Mortal244)._sizeHint();
      case Mortal245:
        return (value as Mortal245)._sizeHint();
      case Mortal246:
        return (value as Mortal246)._sizeHint();
      case Mortal247:
        return (value as Mortal247)._sizeHint();
      case Mortal248:
        return (value as Mortal248)._sizeHint();
      case Mortal249:
        return (value as Mortal249)._sizeHint();
      case Mortal250:
        return (value as Mortal250)._sizeHint();
      case Mortal251:
        return (value as Mortal251)._sizeHint();
      case Mortal252:
        return (value as Mortal252)._sizeHint();
      case Mortal253:
        return (value as Mortal253)._sizeHint();
      case Mortal254:
        return (value as Mortal254)._sizeHint();
      case Mortal255:
        return (value as Mortal255)._sizeHint();
      default:
        throw Exception(
            'Era: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Immortal extends Era {
  const Immortal();

  @override
  Map<String, dynamic> toJson() => {'Immortal': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Immortal;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Mortal1 extends Era {
  const Mortal1(this.value0);

  factory Mortal1._decode(_i1.Input input) {
    return Mortal1(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal1': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal1 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal2 extends Era {
  const Mortal2(this.value0);

  factory Mortal2._decode(_i1.Input input) {
    return Mortal2(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal2': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal2 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal3 extends Era {
  const Mortal3(this.value0);

  factory Mortal3._decode(_i1.Input input) {
    return Mortal3(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal3': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal3 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal4 extends Era {
  const Mortal4(this.value0);

  factory Mortal4._decode(_i1.Input input) {
    return Mortal4(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal4': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal4 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal5 extends Era {
  const Mortal5(this.value0);

  factory Mortal5._decode(_i1.Input input) {
    return Mortal5(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal5': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal5 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal6 extends Era {
  const Mortal6(this.value0);

  factory Mortal6._decode(_i1.Input input) {
    return Mortal6(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal6': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal6 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal7 extends Era {
  const Mortal7(this.value0);

  factory Mortal7._decode(_i1.Input input) {
    return Mortal7(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal7': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal7 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal8 extends Era {
  const Mortal8(this.value0);

  factory Mortal8._decode(_i1.Input input) {
    return Mortal8(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal8': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal8 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal9 extends Era {
  const Mortal9(this.value0);

  factory Mortal9._decode(_i1.Input input) {
    return Mortal9(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal9': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal9 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal10 extends Era {
  const Mortal10(this.value0);

  factory Mortal10._decode(_i1.Input input) {
    return Mortal10(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal10': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal10 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal11 extends Era {
  const Mortal11(this.value0);

  factory Mortal11._decode(_i1.Input input) {
    return Mortal11(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal11': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal11 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal12 extends Era {
  const Mortal12(this.value0);

  factory Mortal12._decode(_i1.Input input) {
    return Mortal12(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal12': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      12,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal12 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal13 extends Era {
  const Mortal13(this.value0);

  factory Mortal13._decode(_i1.Input input) {
    return Mortal13(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal13': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      13,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal13 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal14 extends Era {
  const Mortal14(this.value0);

  factory Mortal14._decode(_i1.Input input) {
    return Mortal14(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal14': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      14,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal14 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal15 extends Era {
  const Mortal15(this.value0);

  factory Mortal15._decode(_i1.Input input) {
    return Mortal15(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal15': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      15,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal15 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal16 extends Era {
  const Mortal16(this.value0);

  factory Mortal16._decode(_i1.Input input) {
    return Mortal16(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal16': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      16,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal16 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal17 extends Era {
  const Mortal17(this.value0);

  factory Mortal17._decode(_i1.Input input) {
    return Mortal17(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal17': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      17,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal17 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal18 extends Era {
  const Mortal18(this.value0);

  factory Mortal18._decode(_i1.Input input) {
    return Mortal18(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal18': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      18,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal18 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal19 extends Era {
  const Mortal19(this.value0);

  factory Mortal19._decode(_i1.Input input) {
    return Mortal19(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal19': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      19,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal19 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal20 extends Era {
  const Mortal20(this.value0);

  factory Mortal20._decode(_i1.Input input) {
    return Mortal20(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal20': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      20,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal20 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal21 extends Era {
  const Mortal21(this.value0);

  factory Mortal21._decode(_i1.Input input) {
    return Mortal21(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal21': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      21,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal21 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal22 extends Era {
  const Mortal22(this.value0);

  factory Mortal22._decode(_i1.Input input) {
    return Mortal22(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal22': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      22,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal22 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal23 extends Era {
  const Mortal23(this.value0);

  factory Mortal23._decode(_i1.Input input) {
    return Mortal23(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal23': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      23,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal23 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal24 extends Era {
  const Mortal24(this.value0);

  factory Mortal24._decode(_i1.Input input) {
    return Mortal24(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal24': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      24,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal24 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal25 extends Era {
  const Mortal25(this.value0);

  factory Mortal25._decode(_i1.Input input) {
    return Mortal25(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal25': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      25,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal25 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal26 extends Era {
  const Mortal26(this.value0);

  factory Mortal26._decode(_i1.Input input) {
    return Mortal26(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal26': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      26,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal26 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal27 extends Era {
  const Mortal27(this.value0);

  factory Mortal27._decode(_i1.Input input) {
    return Mortal27(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal27': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      27,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal27 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal28 extends Era {
  const Mortal28(this.value0);

  factory Mortal28._decode(_i1.Input input) {
    return Mortal28(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal28': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      28,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal28 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal29 extends Era {
  const Mortal29(this.value0);

  factory Mortal29._decode(_i1.Input input) {
    return Mortal29(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal29': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      29,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal29 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal30 extends Era {
  const Mortal30(this.value0);

  factory Mortal30._decode(_i1.Input input) {
    return Mortal30(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal30': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      30,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal30 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal31 extends Era {
  const Mortal31(this.value0);

  factory Mortal31._decode(_i1.Input input) {
    return Mortal31(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal31': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      31,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal31 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal32 extends Era {
  const Mortal32(this.value0);

  factory Mortal32._decode(_i1.Input input) {
    return Mortal32(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal32': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      32,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal32 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal33 extends Era {
  const Mortal33(this.value0);

  factory Mortal33._decode(_i1.Input input) {
    return Mortal33(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal33': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      33,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal33 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal34 extends Era {
  const Mortal34(this.value0);

  factory Mortal34._decode(_i1.Input input) {
    return Mortal34(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal34': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      34,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal34 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal35 extends Era {
  const Mortal35(this.value0);

  factory Mortal35._decode(_i1.Input input) {
    return Mortal35(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal35': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      35,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal35 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal36 extends Era {
  const Mortal36(this.value0);

  factory Mortal36._decode(_i1.Input input) {
    return Mortal36(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal36': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      36,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal36 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal37 extends Era {
  const Mortal37(this.value0);

  factory Mortal37._decode(_i1.Input input) {
    return Mortal37(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal37': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      37,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal37 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal38 extends Era {
  const Mortal38(this.value0);

  factory Mortal38._decode(_i1.Input input) {
    return Mortal38(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal38': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      38,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal38 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal39 extends Era {
  const Mortal39(this.value0);

  factory Mortal39._decode(_i1.Input input) {
    return Mortal39(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal39': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      39,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal39 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal40 extends Era {
  const Mortal40(this.value0);

  factory Mortal40._decode(_i1.Input input) {
    return Mortal40(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal40': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      40,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal40 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal41 extends Era {
  const Mortal41(this.value0);

  factory Mortal41._decode(_i1.Input input) {
    return Mortal41(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal41': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      41,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal41 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal42 extends Era {
  const Mortal42(this.value0);

  factory Mortal42._decode(_i1.Input input) {
    return Mortal42(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal42': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      42,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal42 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal43 extends Era {
  const Mortal43(this.value0);

  factory Mortal43._decode(_i1.Input input) {
    return Mortal43(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal43': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      43,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal43 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal44 extends Era {
  const Mortal44(this.value0);

  factory Mortal44._decode(_i1.Input input) {
    return Mortal44(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal44': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      44,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal44 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal45 extends Era {
  const Mortal45(this.value0);

  factory Mortal45._decode(_i1.Input input) {
    return Mortal45(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal45': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      45,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal45 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal46 extends Era {
  const Mortal46(this.value0);

  factory Mortal46._decode(_i1.Input input) {
    return Mortal46(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal46': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      46,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal46 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal47 extends Era {
  const Mortal47(this.value0);

  factory Mortal47._decode(_i1.Input input) {
    return Mortal47(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal47': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      47,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal47 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal48 extends Era {
  const Mortal48(this.value0);

  factory Mortal48._decode(_i1.Input input) {
    return Mortal48(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal48': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      48,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal48 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal49 extends Era {
  const Mortal49(this.value0);

  factory Mortal49._decode(_i1.Input input) {
    return Mortal49(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal49': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      49,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal49 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal50 extends Era {
  const Mortal50(this.value0);

  factory Mortal50._decode(_i1.Input input) {
    return Mortal50(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal50': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      50,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal50 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal51 extends Era {
  const Mortal51(this.value0);

  factory Mortal51._decode(_i1.Input input) {
    return Mortal51(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal51': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      51,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal51 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal52 extends Era {
  const Mortal52(this.value0);

  factory Mortal52._decode(_i1.Input input) {
    return Mortal52(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal52': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      52,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal52 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal53 extends Era {
  const Mortal53(this.value0);

  factory Mortal53._decode(_i1.Input input) {
    return Mortal53(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal53': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      53,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal53 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal54 extends Era {
  const Mortal54(this.value0);

  factory Mortal54._decode(_i1.Input input) {
    return Mortal54(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal54': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      54,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal54 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal55 extends Era {
  const Mortal55(this.value0);

  factory Mortal55._decode(_i1.Input input) {
    return Mortal55(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal55': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      55,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal55 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal56 extends Era {
  const Mortal56(this.value0);

  factory Mortal56._decode(_i1.Input input) {
    return Mortal56(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal56': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      56,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal56 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal57 extends Era {
  const Mortal57(this.value0);

  factory Mortal57._decode(_i1.Input input) {
    return Mortal57(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal57': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      57,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal57 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal58 extends Era {
  const Mortal58(this.value0);

  factory Mortal58._decode(_i1.Input input) {
    return Mortal58(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal58': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      58,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal58 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal59 extends Era {
  const Mortal59(this.value0);

  factory Mortal59._decode(_i1.Input input) {
    return Mortal59(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal59': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      59,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal59 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal60 extends Era {
  const Mortal60(this.value0);

  factory Mortal60._decode(_i1.Input input) {
    return Mortal60(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal60': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      60,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal60 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal61 extends Era {
  const Mortal61(this.value0);

  factory Mortal61._decode(_i1.Input input) {
    return Mortal61(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal61': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      61,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal61 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal62 extends Era {
  const Mortal62(this.value0);

  factory Mortal62._decode(_i1.Input input) {
    return Mortal62(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal62': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      62,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal62 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal63 extends Era {
  const Mortal63(this.value0);

  factory Mortal63._decode(_i1.Input input) {
    return Mortal63(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal63': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      63,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal63 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal64 extends Era {
  const Mortal64(this.value0);

  factory Mortal64._decode(_i1.Input input) {
    return Mortal64(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal64': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      64,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal64 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal65 extends Era {
  const Mortal65(this.value0);

  factory Mortal65._decode(_i1.Input input) {
    return Mortal65(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal65': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      65,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal65 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal66 extends Era {
  const Mortal66(this.value0);

  factory Mortal66._decode(_i1.Input input) {
    return Mortal66(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal66': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      66,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal66 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal67 extends Era {
  const Mortal67(this.value0);

  factory Mortal67._decode(_i1.Input input) {
    return Mortal67(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal67': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      67,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal67 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal68 extends Era {
  const Mortal68(this.value0);

  factory Mortal68._decode(_i1.Input input) {
    return Mortal68(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal68': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      68,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal68 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal69 extends Era {
  const Mortal69(this.value0);

  factory Mortal69._decode(_i1.Input input) {
    return Mortal69(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal69': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      69,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal69 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal70 extends Era {
  const Mortal70(this.value0);

  factory Mortal70._decode(_i1.Input input) {
    return Mortal70(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal70': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      70,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal70 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal71 extends Era {
  const Mortal71(this.value0);

  factory Mortal71._decode(_i1.Input input) {
    return Mortal71(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal71': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      71,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal71 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal72 extends Era {
  const Mortal72(this.value0);

  factory Mortal72._decode(_i1.Input input) {
    return Mortal72(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal72': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      72,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal72 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal73 extends Era {
  const Mortal73(this.value0);

  factory Mortal73._decode(_i1.Input input) {
    return Mortal73(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal73': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      73,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal73 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal74 extends Era {
  const Mortal74(this.value0);

  factory Mortal74._decode(_i1.Input input) {
    return Mortal74(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal74': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      74,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal74 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal75 extends Era {
  const Mortal75(this.value0);

  factory Mortal75._decode(_i1.Input input) {
    return Mortal75(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal75': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      75,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal75 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal76 extends Era {
  const Mortal76(this.value0);

  factory Mortal76._decode(_i1.Input input) {
    return Mortal76(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal76': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      76,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal76 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal77 extends Era {
  const Mortal77(this.value0);

  factory Mortal77._decode(_i1.Input input) {
    return Mortal77(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal77': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      77,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal77 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal78 extends Era {
  const Mortal78(this.value0);

  factory Mortal78._decode(_i1.Input input) {
    return Mortal78(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal78': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      78,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal78 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal79 extends Era {
  const Mortal79(this.value0);

  factory Mortal79._decode(_i1.Input input) {
    return Mortal79(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal79': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      79,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal79 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal80 extends Era {
  const Mortal80(this.value0);

  factory Mortal80._decode(_i1.Input input) {
    return Mortal80(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal80': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      80,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal80 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal81 extends Era {
  const Mortal81(this.value0);

  factory Mortal81._decode(_i1.Input input) {
    return Mortal81(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal81': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      81,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal81 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal82 extends Era {
  const Mortal82(this.value0);

  factory Mortal82._decode(_i1.Input input) {
    return Mortal82(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal82': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      82,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal82 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal83 extends Era {
  const Mortal83(this.value0);

  factory Mortal83._decode(_i1.Input input) {
    return Mortal83(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal83': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      83,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal83 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal84 extends Era {
  const Mortal84(this.value0);

  factory Mortal84._decode(_i1.Input input) {
    return Mortal84(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal84': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      84,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal84 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal85 extends Era {
  const Mortal85(this.value0);

  factory Mortal85._decode(_i1.Input input) {
    return Mortal85(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal85': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      85,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal85 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal86 extends Era {
  const Mortal86(this.value0);

  factory Mortal86._decode(_i1.Input input) {
    return Mortal86(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal86': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      86,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal86 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal87 extends Era {
  const Mortal87(this.value0);

  factory Mortal87._decode(_i1.Input input) {
    return Mortal87(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal87': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      87,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal87 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal88 extends Era {
  const Mortal88(this.value0);

  factory Mortal88._decode(_i1.Input input) {
    return Mortal88(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal88': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      88,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal88 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal89 extends Era {
  const Mortal89(this.value0);

  factory Mortal89._decode(_i1.Input input) {
    return Mortal89(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal89': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      89,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal89 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal90 extends Era {
  const Mortal90(this.value0);

  factory Mortal90._decode(_i1.Input input) {
    return Mortal90(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal90': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      90,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal90 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal91 extends Era {
  const Mortal91(this.value0);

  factory Mortal91._decode(_i1.Input input) {
    return Mortal91(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal91': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      91,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal91 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal92 extends Era {
  const Mortal92(this.value0);

  factory Mortal92._decode(_i1.Input input) {
    return Mortal92(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal92': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      92,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal92 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal93 extends Era {
  const Mortal93(this.value0);

  factory Mortal93._decode(_i1.Input input) {
    return Mortal93(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal93': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      93,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal93 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal94 extends Era {
  const Mortal94(this.value0);

  factory Mortal94._decode(_i1.Input input) {
    return Mortal94(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal94': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      94,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal94 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal95 extends Era {
  const Mortal95(this.value0);

  factory Mortal95._decode(_i1.Input input) {
    return Mortal95(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal95': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      95,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal95 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal96 extends Era {
  const Mortal96(this.value0);

  factory Mortal96._decode(_i1.Input input) {
    return Mortal96(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal96': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      96,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal96 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal97 extends Era {
  const Mortal97(this.value0);

  factory Mortal97._decode(_i1.Input input) {
    return Mortal97(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal97': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      97,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal97 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal98 extends Era {
  const Mortal98(this.value0);

  factory Mortal98._decode(_i1.Input input) {
    return Mortal98(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal98': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      98,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal98 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal99 extends Era {
  const Mortal99(this.value0);

  factory Mortal99._decode(_i1.Input input) {
    return Mortal99(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal99': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      99,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal99 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal100 extends Era {
  const Mortal100(this.value0);

  factory Mortal100._decode(_i1.Input input) {
    return Mortal100(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal100': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      100,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal100 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal101 extends Era {
  const Mortal101(this.value0);

  factory Mortal101._decode(_i1.Input input) {
    return Mortal101(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal101': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      101,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal101 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal102 extends Era {
  const Mortal102(this.value0);

  factory Mortal102._decode(_i1.Input input) {
    return Mortal102(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal102': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      102,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal102 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal103 extends Era {
  const Mortal103(this.value0);

  factory Mortal103._decode(_i1.Input input) {
    return Mortal103(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal103': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      103,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal103 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal104 extends Era {
  const Mortal104(this.value0);

  factory Mortal104._decode(_i1.Input input) {
    return Mortal104(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal104': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      104,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal104 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal105 extends Era {
  const Mortal105(this.value0);

  factory Mortal105._decode(_i1.Input input) {
    return Mortal105(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal105': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      105,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal105 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal106 extends Era {
  const Mortal106(this.value0);

  factory Mortal106._decode(_i1.Input input) {
    return Mortal106(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal106': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      106,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal106 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal107 extends Era {
  const Mortal107(this.value0);

  factory Mortal107._decode(_i1.Input input) {
    return Mortal107(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal107': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      107,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal107 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal108 extends Era {
  const Mortal108(this.value0);

  factory Mortal108._decode(_i1.Input input) {
    return Mortal108(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal108': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      108,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal108 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal109 extends Era {
  const Mortal109(this.value0);

  factory Mortal109._decode(_i1.Input input) {
    return Mortal109(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal109': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      109,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal109 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal110 extends Era {
  const Mortal110(this.value0);

  factory Mortal110._decode(_i1.Input input) {
    return Mortal110(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal110': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      110,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal110 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal111 extends Era {
  const Mortal111(this.value0);

  factory Mortal111._decode(_i1.Input input) {
    return Mortal111(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal111': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      111,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal111 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal112 extends Era {
  const Mortal112(this.value0);

  factory Mortal112._decode(_i1.Input input) {
    return Mortal112(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal112': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      112,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal112 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal113 extends Era {
  const Mortal113(this.value0);

  factory Mortal113._decode(_i1.Input input) {
    return Mortal113(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal113': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      113,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal113 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal114 extends Era {
  const Mortal114(this.value0);

  factory Mortal114._decode(_i1.Input input) {
    return Mortal114(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal114': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      114,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal114 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal115 extends Era {
  const Mortal115(this.value0);

  factory Mortal115._decode(_i1.Input input) {
    return Mortal115(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal115': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      115,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal115 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal116 extends Era {
  const Mortal116(this.value0);

  factory Mortal116._decode(_i1.Input input) {
    return Mortal116(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal116': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      116,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal116 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal117 extends Era {
  const Mortal117(this.value0);

  factory Mortal117._decode(_i1.Input input) {
    return Mortal117(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal117': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      117,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal117 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal118 extends Era {
  const Mortal118(this.value0);

  factory Mortal118._decode(_i1.Input input) {
    return Mortal118(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal118': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      118,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal118 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal119 extends Era {
  const Mortal119(this.value0);

  factory Mortal119._decode(_i1.Input input) {
    return Mortal119(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal119': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      119,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal119 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal120 extends Era {
  const Mortal120(this.value0);

  factory Mortal120._decode(_i1.Input input) {
    return Mortal120(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal120': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      120,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal120 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal121 extends Era {
  const Mortal121(this.value0);

  factory Mortal121._decode(_i1.Input input) {
    return Mortal121(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal121': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      121,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal121 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal122 extends Era {
  const Mortal122(this.value0);

  factory Mortal122._decode(_i1.Input input) {
    return Mortal122(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal122': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      122,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal122 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal123 extends Era {
  const Mortal123(this.value0);

  factory Mortal123._decode(_i1.Input input) {
    return Mortal123(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal123': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      123,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal123 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal124 extends Era {
  const Mortal124(this.value0);

  factory Mortal124._decode(_i1.Input input) {
    return Mortal124(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal124': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      124,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal124 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal125 extends Era {
  const Mortal125(this.value0);

  factory Mortal125._decode(_i1.Input input) {
    return Mortal125(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal125': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      125,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal125 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal126 extends Era {
  const Mortal126(this.value0);

  factory Mortal126._decode(_i1.Input input) {
    return Mortal126(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal126': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      126,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal126 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal127 extends Era {
  const Mortal127(this.value0);

  factory Mortal127._decode(_i1.Input input) {
    return Mortal127(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal127': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      127,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal127 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal128 extends Era {
  const Mortal128(this.value0);

  factory Mortal128._decode(_i1.Input input) {
    return Mortal128(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal128': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      128,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal128 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal129 extends Era {
  const Mortal129(this.value0);

  factory Mortal129._decode(_i1.Input input) {
    return Mortal129(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal129': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      129,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal129 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal130 extends Era {
  const Mortal130(this.value0);

  factory Mortal130._decode(_i1.Input input) {
    return Mortal130(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal130': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      130,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal130 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal131 extends Era {
  const Mortal131(this.value0);

  factory Mortal131._decode(_i1.Input input) {
    return Mortal131(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal131': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      131,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal131 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal132 extends Era {
  const Mortal132(this.value0);

  factory Mortal132._decode(_i1.Input input) {
    return Mortal132(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal132': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      132,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal132 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal133 extends Era {
  const Mortal133(this.value0);

  factory Mortal133._decode(_i1.Input input) {
    return Mortal133(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal133': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      133,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal133 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal134 extends Era {
  const Mortal134(this.value0);

  factory Mortal134._decode(_i1.Input input) {
    return Mortal134(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal134': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      134,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal134 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal135 extends Era {
  const Mortal135(this.value0);

  factory Mortal135._decode(_i1.Input input) {
    return Mortal135(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal135': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      135,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal135 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal136 extends Era {
  const Mortal136(this.value0);

  factory Mortal136._decode(_i1.Input input) {
    return Mortal136(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal136': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      136,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal136 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal137 extends Era {
  const Mortal137(this.value0);

  factory Mortal137._decode(_i1.Input input) {
    return Mortal137(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal137': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      137,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal137 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal138 extends Era {
  const Mortal138(this.value0);

  factory Mortal138._decode(_i1.Input input) {
    return Mortal138(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal138': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      138,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal138 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal139 extends Era {
  const Mortal139(this.value0);

  factory Mortal139._decode(_i1.Input input) {
    return Mortal139(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal139': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      139,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal139 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal140 extends Era {
  const Mortal140(this.value0);

  factory Mortal140._decode(_i1.Input input) {
    return Mortal140(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal140': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      140,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal140 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal141 extends Era {
  const Mortal141(this.value0);

  factory Mortal141._decode(_i1.Input input) {
    return Mortal141(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal141': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      141,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal141 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal142 extends Era {
  const Mortal142(this.value0);

  factory Mortal142._decode(_i1.Input input) {
    return Mortal142(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal142': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      142,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal142 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal143 extends Era {
  const Mortal143(this.value0);

  factory Mortal143._decode(_i1.Input input) {
    return Mortal143(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal143': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      143,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal143 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal144 extends Era {
  const Mortal144(this.value0);

  factory Mortal144._decode(_i1.Input input) {
    return Mortal144(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal144': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      144,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal144 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal145 extends Era {
  const Mortal145(this.value0);

  factory Mortal145._decode(_i1.Input input) {
    return Mortal145(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal145': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      145,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal145 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal146 extends Era {
  const Mortal146(this.value0);

  factory Mortal146._decode(_i1.Input input) {
    return Mortal146(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal146': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      146,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal146 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal147 extends Era {
  const Mortal147(this.value0);

  factory Mortal147._decode(_i1.Input input) {
    return Mortal147(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal147': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      147,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal147 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal148 extends Era {
  const Mortal148(this.value0);

  factory Mortal148._decode(_i1.Input input) {
    return Mortal148(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal148': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      148,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal148 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal149 extends Era {
  const Mortal149(this.value0);

  factory Mortal149._decode(_i1.Input input) {
    return Mortal149(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal149': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      149,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal149 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal150 extends Era {
  const Mortal150(this.value0);

  factory Mortal150._decode(_i1.Input input) {
    return Mortal150(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal150': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      150,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal150 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal151 extends Era {
  const Mortal151(this.value0);

  factory Mortal151._decode(_i1.Input input) {
    return Mortal151(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal151': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      151,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal151 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal152 extends Era {
  const Mortal152(this.value0);

  factory Mortal152._decode(_i1.Input input) {
    return Mortal152(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal152': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      152,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal152 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal153 extends Era {
  const Mortal153(this.value0);

  factory Mortal153._decode(_i1.Input input) {
    return Mortal153(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal153': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      153,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal153 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal154 extends Era {
  const Mortal154(this.value0);

  factory Mortal154._decode(_i1.Input input) {
    return Mortal154(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal154': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      154,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal154 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal155 extends Era {
  const Mortal155(this.value0);

  factory Mortal155._decode(_i1.Input input) {
    return Mortal155(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal155': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      155,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal155 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal156 extends Era {
  const Mortal156(this.value0);

  factory Mortal156._decode(_i1.Input input) {
    return Mortal156(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal156': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      156,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal156 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal157 extends Era {
  const Mortal157(this.value0);

  factory Mortal157._decode(_i1.Input input) {
    return Mortal157(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal157': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      157,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal157 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal158 extends Era {
  const Mortal158(this.value0);

  factory Mortal158._decode(_i1.Input input) {
    return Mortal158(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal158': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      158,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal158 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal159 extends Era {
  const Mortal159(this.value0);

  factory Mortal159._decode(_i1.Input input) {
    return Mortal159(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal159': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      159,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal159 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal160 extends Era {
  const Mortal160(this.value0);

  factory Mortal160._decode(_i1.Input input) {
    return Mortal160(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal160': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      160,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal160 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal161 extends Era {
  const Mortal161(this.value0);

  factory Mortal161._decode(_i1.Input input) {
    return Mortal161(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal161': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      161,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal161 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal162 extends Era {
  const Mortal162(this.value0);

  factory Mortal162._decode(_i1.Input input) {
    return Mortal162(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal162': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      162,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal162 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal163 extends Era {
  const Mortal163(this.value0);

  factory Mortal163._decode(_i1.Input input) {
    return Mortal163(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal163': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      163,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal163 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal164 extends Era {
  const Mortal164(this.value0);

  factory Mortal164._decode(_i1.Input input) {
    return Mortal164(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal164': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      164,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal164 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal165 extends Era {
  const Mortal165(this.value0);

  factory Mortal165._decode(_i1.Input input) {
    return Mortal165(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal165': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      165,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal165 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal166 extends Era {
  const Mortal166(this.value0);

  factory Mortal166._decode(_i1.Input input) {
    return Mortal166(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal166': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      166,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal166 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal167 extends Era {
  const Mortal167(this.value0);

  factory Mortal167._decode(_i1.Input input) {
    return Mortal167(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal167': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      167,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal167 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal168 extends Era {
  const Mortal168(this.value0);

  factory Mortal168._decode(_i1.Input input) {
    return Mortal168(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal168': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      168,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal168 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal169 extends Era {
  const Mortal169(this.value0);

  factory Mortal169._decode(_i1.Input input) {
    return Mortal169(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal169': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      169,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal169 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal170 extends Era {
  const Mortal170(this.value0);

  factory Mortal170._decode(_i1.Input input) {
    return Mortal170(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal170': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      170,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal170 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal171 extends Era {
  const Mortal171(this.value0);

  factory Mortal171._decode(_i1.Input input) {
    return Mortal171(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal171': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      171,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal171 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal172 extends Era {
  const Mortal172(this.value0);

  factory Mortal172._decode(_i1.Input input) {
    return Mortal172(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal172': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      172,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal172 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal173 extends Era {
  const Mortal173(this.value0);

  factory Mortal173._decode(_i1.Input input) {
    return Mortal173(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal173': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      173,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal173 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal174 extends Era {
  const Mortal174(this.value0);

  factory Mortal174._decode(_i1.Input input) {
    return Mortal174(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal174': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      174,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal174 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal175 extends Era {
  const Mortal175(this.value0);

  factory Mortal175._decode(_i1.Input input) {
    return Mortal175(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal175': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      175,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal175 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal176 extends Era {
  const Mortal176(this.value0);

  factory Mortal176._decode(_i1.Input input) {
    return Mortal176(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal176': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      176,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal176 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal177 extends Era {
  const Mortal177(this.value0);

  factory Mortal177._decode(_i1.Input input) {
    return Mortal177(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal177': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      177,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal177 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal178 extends Era {
  const Mortal178(this.value0);

  factory Mortal178._decode(_i1.Input input) {
    return Mortal178(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal178': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      178,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal178 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal179 extends Era {
  const Mortal179(this.value0);

  factory Mortal179._decode(_i1.Input input) {
    return Mortal179(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal179': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      179,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal179 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal180 extends Era {
  const Mortal180(this.value0);

  factory Mortal180._decode(_i1.Input input) {
    return Mortal180(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal180': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      180,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal180 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal181 extends Era {
  const Mortal181(this.value0);

  factory Mortal181._decode(_i1.Input input) {
    return Mortal181(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal181': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      181,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal181 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal182 extends Era {
  const Mortal182(this.value0);

  factory Mortal182._decode(_i1.Input input) {
    return Mortal182(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal182': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      182,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal182 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal183 extends Era {
  const Mortal183(this.value0);

  factory Mortal183._decode(_i1.Input input) {
    return Mortal183(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal183': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      183,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal183 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal184 extends Era {
  const Mortal184(this.value0);

  factory Mortal184._decode(_i1.Input input) {
    return Mortal184(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal184': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      184,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal184 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal185 extends Era {
  const Mortal185(this.value0);

  factory Mortal185._decode(_i1.Input input) {
    return Mortal185(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal185': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      185,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal185 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal186 extends Era {
  const Mortal186(this.value0);

  factory Mortal186._decode(_i1.Input input) {
    return Mortal186(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal186': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      186,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal186 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal187 extends Era {
  const Mortal187(this.value0);

  factory Mortal187._decode(_i1.Input input) {
    return Mortal187(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal187': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      187,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal187 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal188 extends Era {
  const Mortal188(this.value0);

  factory Mortal188._decode(_i1.Input input) {
    return Mortal188(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal188': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      188,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal188 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal189 extends Era {
  const Mortal189(this.value0);

  factory Mortal189._decode(_i1.Input input) {
    return Mortal189(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal189': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      189,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal189 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal190 extends Era {
  const Mortal190(this.value0);

  factory Mortal190._decode(_i1.Input input) {
    return Mortal190(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal190': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      190,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal190 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal191 extends Era {
  const Mortal191(this.value0);

  factory Mortal191._decode(_i1.Input input) {
    return Mortal191(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal191': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      191,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal191 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal192 extends Era {
  const Mortal192(this.value0);

  factory Mortal192._decode(_i1.Input input) {
    return Mortal192(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal192': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      192,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal192 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal193 extends Era {
  const Mortal193(this.value0);

  factory Mortal193._decode(_i1.Input input) {
    return Mortal193(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal193': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      193,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal193 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal194 extends Era {
  const Mortal194(this.value0);

  factory Mortal194._decode(_i1.Input input) {
    return Mortal194(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal194': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      194,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal194 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal195 extends Era {
  const Mortal195(this.value0);

  factory Mortal195._decode(_i1.Input input) {
    return Mortal195(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal195': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      195,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal195 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal196 extends Era {
  const Mortal196(this.value0);

  factory Mortal196._decode(_i1.Input input) {
    return Mortal196(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal196': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      196,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal196 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal197 extends Era {
  const Mortal197(this.value0);

  factory Mortal197._decode(_i1.Input input) {
    return Mortal197(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal197': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      197,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal197 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal198 extends Era {
  const Mortal198(this.value0);

  factory Mortal198._decode(_i1.Input input) {
    return Mortal198(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal198': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      198,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal198 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal199 extends Era {
  const Mortal199(this.value0);

  factory Mortal199._decode(_i1.Input input) {
    return Mortal199(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal199': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      199,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal199 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal200 extends Era {
  const Mortal200(this.value0);

  factory Mortal200._decode(_i1.Input input) {
    return Mortal200(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal200': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      200,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal200 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal201 extends Era {
  const Mortal201(this.value0);

  factory Mortal201._decode(_i1.Input input) {
    return Mortal201(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal201': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      201,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal201 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal202 extends Era {
  const Mortal202(this.value0);

  factory Mortal202._decode(_i1.Input input) {
    return Mortal202(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal202': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      202,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal202 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal203 extends Era {
  const Mortal203(this.value0);

  factory Mortal203._decode(_i1.Input input) {
    return Mortal203(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal203': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      203,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal203 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal204 extends Era {
  const Mortal204(this.value0);

  factory Mortal204._decode(_i1.Input input) {
    return Mortal204(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal204': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      204,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal204 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal205 extends Era {
  const Mortal205(this.value0);

  factory Mortal205._decode(_i1.Input input) {
    return Mortal205(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal205': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      205,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal205 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal206 extends Era {
  const Mortal206(this.value0);

  factory Mortal206._decode(_i1.Input input) {
    return Mortal206(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal206': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      206,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal206 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal207 extends Era {
  const Mortal207(this.value0);

  factory Mortal207._decode(_i1.Input input) {
    return Mortal207(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal207': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      207,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal207 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal208 extends Era {
  const Mortal208(this.value0);

  factory Mortal208._decode(_i1.Input input) {
    return Mortal208(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal208': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      208,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal208 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal209 extends Era {
  const Mortal209(this.value0);

  factory Mortal209._decode(_i1.Input input) {
    return Mortal209(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal209': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      209,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal209 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal210 extends Era {
  const Mortal210(this.value0);

  factory Mortal210._decode(_i1.Input input) {
    return Mortal210(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal210': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      210,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal210 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal211 extends Era {
  const Mortal211(this.value0);

  factory Mortal211._decode(_i1.Input input) {
    return Mortal211(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal211': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      211,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal211 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal212 extends Era {
  const Mortal212(this.value0);

  factory Mortal212._decode(_i1.Input input) {
    return Mortal212(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal212': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      212,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal212 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal213 extends Era {
  const Mortal213(this.value0);

  factory Mortal213._decode(_i1.Input input) {
    return Mortal213(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal213': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      213,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal213 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal214 extends Era {
  const Mortal214(this.value0);

  factory Mortal214._decode(_i1.Input input) {
    return Mortal214(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal214': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      214,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal214 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal215 extends Era {
  const Mortal215(this.value0);

  factory Mortal215._decode(_i1.Input input) {
    return Mortal215(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal215': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      215,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal215 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal216 extends Era {
  const Mortal216(this.value0);

  factory Mortal216._decode(_i1.Input input) {
    return Mortal216(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal216': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      216,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal216 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal217 extends Era {
  const Mortal217(this.value0);

  factory Mortal217._decode(_i1.Input input) {
    return Mortal217(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal217': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      217,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal217 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal218 extends Era {
  const Mortal218(this.value0);

  factory Mortal218._decode(_i1.Input input) {
    return Mortal218(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal218': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      218,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal218 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal219 extends Era {
  const Mortal219(this.value0);

  factory Mortal219._decode(_i1.Input input) {
    return Mortal219(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal219': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      219,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal219 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal220 extends Era {
  const Mortal220(this.value0);

  factory Mortal220._decode(_i1.Input input) {
    return Mortal220(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal220': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      220,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal220 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal221 extends Era {
  const Mortal221(this.value0);

  factory Mortal221._decode(_i1.Input input) {
    return Mortal221(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal221': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      221,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal221 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal222 extends Era {
  const Mortal222(this.value0);

  factory Mortal222._decode(_i1.Input input) {
    return Mortal222(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal222': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      222,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal222 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal223 extends Era {
  const Mortal223(this.value0);

  factory Mortal223._decode(_i1.Input input) {
    return Mortal223(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal223': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      223,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal223 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal224 extends Era {
  const Mortal224(this.value0);

  factory Mortal224._decode(_i1.Input input) {
    return Mortal224(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal224': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      224,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal224 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal225 extends Era {
  const Mortal225(this.value0);

  factory Mortal225._decode(_i1.Input input) {
    return Mortal225(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal225': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      225,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal225 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal226 extends Era {
  const Mortal226(this.value0);

  factory Mortal226._decode(_i1.Input input) {
    return Mortal226(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal226': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      226,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal226 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal227 extends Era {
  const Mortal227(this.value0);

  factory Mortal227._decode(_i1.Input input) {
    return Mortal227(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal227': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      227,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal227 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal228 extends Era {
  const Mortal228(this.value0);

  factory Mortal228._decode(_i1.Input input) {
    return Mortal228(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal228': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      228,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal228 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal229 extends Era {
  const Mortal229(this.value0);

  factory Mortal229._decode(_i1.Input input) {
    return Mortal229(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal229': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      229,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal229 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal230 extends Era {
  const Mortal230(this.value0);

  factory Mortal230._decode(_i1.Input input) {
    return Mortal230(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal230': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      230,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal230 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal231 extends Era {
  const Mortal231(this.value0);

  factory Mortal231._decode(_i1.Input input) {
    return Mortal231(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal231': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      231,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal231 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal232 extends Era {
  const Mortal232(this.value0);

  factory Mortal232._decode(_i1.Input input) {
    return Mortal232(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal232': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      232,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal232 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal233 extends Era {
  const Mortal233(this.value0);

  factory Mortal233._decode(_i1.Input input) {
    return Mortal233(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal233': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      233,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal233 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal234 extends Era {
  const Mortal234(this.value0);

  factory Mortal234._decode(_i1.Input input) {
    return Mortal234(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal234': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      234,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal234 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal235 extends Era {
  const Mortal235(this.value0);

  factory Mortal235._decode(_i1.Input input) {
    return Mortal235(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal235': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      235,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal235 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal236 extends Era {
  const Mortal236(this.value0);

  factory Mortal236._decode(_i1.Input input) {
    return Mortal236(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal236': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      236,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal236 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal237 extends Era {
  const Mortal237(this.value0);

  factory Mortal237._decode(_i1.Input input) {
    return Mortal237(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal237': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      237,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal237 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal238 extends Era {
  const Mortal238(this.value0);

  factory Mortal238._decode(_i1.Input input) {
    return Mortal238(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal238': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      238,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal238 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal239 extends Era {
  const Mortal239(this.value0);

  factory Mortal239._decode(_i1.Input input) {
    return Mortal239(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal239': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      239,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal239 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal240 extends Era {
  const Mortal240(this.value0);

  factory Mortal240._decode(_i1.Input input) {
    return Mortal240(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal240': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      240,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal240 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal241 extends Era {
  const Mortal241(this.value0);

  factory Mortal241._decode(_i1.Input input) {
    return Mortal241(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal241': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      241,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal241 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal242 extends Era {
  const Mortal242(this.value0);

  factory Mortal242._decode(_i1.Input input) {
    return Mortal242(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal242': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      242,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal242 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal243 extends Era {
  const Mortal243(this.value0);

  factory Mortal243._decode(_i1.Input input) {
    return Mortal243(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal243': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      243,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal243 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal244 extends Era {
  const Mortal244(this.value0);

  factory Mortal244._decode(_i1.Input input) {
    return Mortal244(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal244': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      244,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal244 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal245 extends Era {
  const Mortal245(this.value0);

  factory Mortal245._decode(_i1.Input input) {
    return Mortal245(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal245': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      245,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal245 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal246 extends Era {
  const Mortal246(this.value0);

  factory Mortal246._decode(_i1.Input input) {
    return Mortal246(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal246': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      246,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal246 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal247 extends Era {
  const Mortal247(this.value0);

  factory Mortal247._decode(_i1.Input input) {
    return Mortal247(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal247': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      247,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal247 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal248 extends Era {
  const Mortal248(this.value0);

  factory Mortal248._decode(_i1.Input input) {
    return Mortal248(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal248': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      248,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal248 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal249 extends Era {
  const Mortal249(this.value0);

  factory Mortal249._decode(_i1.Input input) {
    return Mortal249(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal249': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      249,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal249 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal250 extends Era {
  const Mortal250(this.value0);

  factory Mortal250._decode(_i1.Input input) {
    return Mortal250(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal250': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      250,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal250 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal251 extends Era {
  const Mortal251(this.value0);

  factory Mortal251._decode(_i1.Input input) {
    return Mortal251(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal251': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      251,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal251 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal252 extends Era {
  const Mortal252(this.value0);

  factory Mortal252._decode(_i1.Input input) {
    return Mortal252(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal252': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      252,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal252 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal253 extends Era {
  const Mortal253(this.value0);

  factory Mortal253._decode(_i1.Input input) {
    return Mortal253(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal253': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      253,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal253 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal254 extends Era {
  const Mortal254(this.value0);

  factory Mortal254._decode(_i1.Input input) {
    return Mortal254(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal254': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      254,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal254 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Mortal255 extends Era {
  const Mortal255(this.value0);

  factory Mortal255._decode(_i1.Input input) {
    return Mortal255(_i1.U8Codec.codec.decode(input));
  }

  final int value0;

  @override
  Map<String, int> toJson() => {'Mortal255': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      255,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Mortal255 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
