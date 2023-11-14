// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class MemberData {
  const MemberData();

  factory MemberData.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $MemberDataCodec codec = $MemberDataCodec();

  static const $MemberData values = $MemberData();

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

class $MemberData {
  const $MemberData();

  Global global() {
    return Global();
  }

  Guild guild(BigInt value0) {
    return Guild(value0);
  }

  Project project(BigInt value0) {
    return Project(value0);
  }
}

class $MemberDataCodec with _i1.Codec<MemberData> {
  const $MemberDataCodec();

  @override
  MemberData decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const Global();
      case 1:
        return Guild._decode(input);
      case 2:
        return Project._decode(input);
      default:
        throw Exception('MemberData: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    MemberData value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Global:
        (value as Global).encodeTo(output);
        break;
      case Guild:
        (value as Guild).encodeTo(output);
        break;
      case Project:
        (value as Project).encodeTo(output);
        break;
      default:
        throw Exception(
            'MemberData: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(MemberData value) {
    switch (value.runtimeType) {
      case Global:
        return 1;
      case Guild:
        return (value as Guild)._sizeHint();
      case Project:
        return (value as Project)._sizeHint();
      default:
        throw Exception(
            'MemberData: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Global extends MemberData {
  const Global();

  @override
  Map<String, dynamic> toJson() => {'GLOBAL': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Global;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Guild extends MemberData {
  const Guild(this.value0);

  factory Guild._decode(_i1.Input input) {
    return Guild(_i1.U64Codec.codec.decode(input));
  }

  /// u64
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'GUILD': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
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
      other is Guild && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Project extends MemberData {
  const Project(this.value0);

  factory Project._decode(_i1.Input input) {
    return Project(_i1.U64Codec.codec.decode(input));
  }

  /// u64
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'PROJECT': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
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
      other is Project && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
