// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'extra_flags.dart' as _i2;

class AccountData {
  const AccountData({
    required this.free,
    required this.reserved,
    required this.frozen,
    required this.flags,
  });

  factory AccountData.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Balance
  final BigInt free;

  /// Balance
  final BigInt reserved;

  /// Balance
  final BigInt frozen;

  /// ExtraFlags
  final _i2.ExtraFlags flags;

  static const $AccountDataCodec codec = $AccountDataCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, BigInt> toJson() => {
        'free': free,
        'reserved': reserved,
        'frozen': frozen,
        'flags': flags,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AccountData &&
          other.free == free &&
          other.reserved == reserved &&
          other.frozen == frozen &&
          other.flags == flags;

  @override
  int get hashCode => Object.hash(
        free,
        reserved,
        frozen,
        flags,
      );
}

class $AccountDataCodec with _i1.Codec<AccountData> {
  const $AccountDataCodec();

  @override
  void encodeTo(
    AccountData obj,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
      obj.free,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.reserved,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.frozen,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.flags,
      output,
    );
  }

  @override
  AccountData decode(_i1.Input input) {
    return AccountData(
      free: _i1.U128Codec.codec.decode(input),
      reserved: _i1.U128Codec.codec.decode(input),
      frozen: _i1.U128Codec.codec.decode(input),
      flags: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AccountData obj) {
    int size = 0;
    size = size + _i1.U128Codec.codec.sizeHint(obj.free);
    size = size + _i1.U128Codec.codec.sizeHint(obj.reserved);
    size = size + _i1.U128Codec.codec.sizeHint(obj.frozen);
    size = size + const _i2.ExtraFlagsCodec().sizeHint(obj.flags);
    return size;
  }
}
