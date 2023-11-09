// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

abstract class MessageOrigin {
  const MessageOrigin();

  factory MessageOrigin.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $MessageOriginCodec codec = $MessageOriginCodec();

  static const $MessageOrigin values = $MessageOrigin();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<int>> toJson();
}

class $MessageOrigin {
  const $MessageOrigin();

  Account account(_i3.AccountId32 value0) {
    return Account(value0);
  }
}

class $MessageOriginCodec with _i1.Codec<MessageOrigin> {
  const $MessageOriginCodec();

  @override
  MessageOrigin decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Account._decode(input);
      default:
        throw Exception('MessageOrigin: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    MessageOrigin value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Account:
        (value as Account).encodeTo(output);
        break;
      default:
        throw Exception(
            'MessageOrigin: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(MessageOrigin value) {
    switch (value.runtimeType) {
      case Account:
        return (value as Account)._sizeHint();
      default:
        throw Exception(
            'MessageOrigin: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Account extends MessageOrigin {
  const Account(this.value0);

  factory Account._decode(_i1.Input input) {
    return Account(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AccountId
  final _i3.AccountId32 value0;

  @override
  Map<String, List<int>> toJson() => {'Account': value0.toList()};

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
      other is Account &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
