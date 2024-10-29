// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

abstract class MultiAddress {
  const MultiAddress();

  factory MultiAddress.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $MultiAddressCodec codec = $MultiAddressCodec();

  static const $MultiAddress values = $MultiAddress();

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

class $MultiAddress {
  const $MultiAddress();

  Id id(_i3.AccountId32 value0) {
    return Id(value0);
  }

  Index index(BigInt value0) {
    return Index(value0);
  }

  Raw raw(List<int> value0) {
    return Raw(value0);
  }

  Address32 address32(List<int> value0) {
    return Address32(value0);
  }

  Address20 address20(List<int> value0) {
    return Address20(value0);
  }
}

class $MultiAddressCodec with _i1.Codec<MultiAddress> {
  const $MultiAddressCodec();

  @override
  MultiAddress decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Id._decode(input);
      case 1:
        return Index._decode(input);
      case 2:
        return Raw._decode(input);
      case 3:
        return Address32._decode(input);
      case 4:
        return Address20._decode(input);
      default:
        throw Exception('MultiAddress: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    MultiAddress value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Id:
        (value as Id).encodeTo(output);
        break;
      case Index:
        (value as Index).encodeTo(output);
        break;
      case Raw:
        (value as Raw).encodeTo(output);
        break;
      case Address32:
        (value as Address32).encodeTo(output);
        break;
      case Address20:
        (value as Address20).encodeTo(output);
        break;
      default:
        throw Exception(
            'MultiAddress: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(MultiAddress value) {
    switch (value.runtimeType) {
      case Id:
        return (value as Id)._sizeHint();
      case Index:
        return (value as Index)._sizeHint();
      case Raw:
        return (value as Raw)._sizeHint();
      case Address32:
        return (value as Address32)._sizeHint();
      case Address20:
        return (value as Address20)._sizeHint();
      default:
        throw Exception(
            'MultiAddress: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Id extends MultiAddress {
  const Id(this.value0);

  factory Id._decode(_i1.Input input) {
    return Id(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AccountId
  final _i3.AccountId32 value0;

  @override
  Map<String, List<int>> toJson() => {'Id': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Id &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Index extends MultiAddress {
  const Index(this.value0);

  factory Index._decode(_i1.Input input) {
    return Index(_i1.CompactBigIntCodec.codec.decode(input));
  }

  /// AccountIndex
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'Index': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Index && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Raw extends MultiAddress {
  const Raw(this.value0);

  factory Raw._decode(_i1.Input input) {
    return Raw(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'Raw': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Raw &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Address32 extends MultiAddress {
  const Address32(this.value0);

  factory Address32._decode(_i1.Input input) {
    return Address32(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// [u8; 32]
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'Address32': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(32).sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Address32 &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Address20 extends MultiAddress {
  const Address20(this.value0);

  factory Address20._decode(_i1.Input input) {
    return Address20(const _i1.U8ArrayCodec(20).decode(input));
  }

  /// [u8; 20]
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'Address20': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(20).sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(20).encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Address20 &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
