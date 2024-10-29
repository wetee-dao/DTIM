// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../pallet_balances/types/account_data.dart' as _i2;

class AccountInfo {
  const AccountInfo({
    required this.nonce,
    required this.consumers,
    required this.providers,
    required this.sufficients,
    required this.data,
  });

  factory AccountInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Nonce
  final int nonce;

  /// RefCount
  final int consumers;

  /// RefCount
  final int providers;

  /// RefCount
  final int sufficients;

  /// AccountData
  final _i2.AccountData data;

  static const $AccountInfoCodec codec = $AccountInfoCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'nonce': nonce,
        'consumers': consumers,
        'providers': providers,
        'sufficients': sufficients,
        'data': data.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AccountInfo &&
          other.nonce == nonce &&
          other.consumers == consumers &&
          other.providers == providers &&
          other.sufficients == sufficients &&
          other.data == data;

  @override
  int get hashCode => Object.hash(
        nonce,
        consumers,
        providers,
        sufficients,
        data,
      );
}

class $AccountInfoCodec with _i1.Codec<AccountInfo> {
  const $AccountInfoCodec();

  @override
  void encodeTo(
    AccountInfo obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.nonce,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.consumers,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.providers,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.sufficients,
      output,
    );
    _i2.AccountData.codec.encodeTo(
      obj.data,
      output,
    );
  }

  @override
  AccountInfo decode(_i1.Input input) {
    return AccountInfo(
      nonce: _i1.U32Codec.codec.decode(input),
      consumers: _i1.U32Codec.codec.decode(input),
      providers: _i1.U32Codec.codec.decode(input),
      sufficients: _i1.U32Codec.codec.decode(input),
      data: _i2.AccountData.codec.decode(input),
    );
  }

  @override
  int sizeHint(AccountInfo obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.nonce);
    size = size + _i1.U32Codec.codec.sizeHint(obj.consumers);
    size = size + _i1.U32Codec.codec.sizeHint(obj.providers);
    size = size + _i1.U32Codec.codec.sizeHint(obj.sufficients);
    size = size + _i2.AccountData.codec.sizeHint(obj.data);
    return size;
  }
}
