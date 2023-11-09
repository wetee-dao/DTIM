// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum TokenError {
  fundsUnavailable('FundsUnavailable', 0),
  onlyProvider('OnlyProvider', 1),
  belowMinimum('BelowMinimum', 2),
  cannotCreate('CannotCreate', 3),
  unknownAsset('UnknownAsset', 4),
  frozen('Frozen', 5),
  unsupported('Unsupported', 6),
  cannotCreateHold('CannotCreateHold', 7),
  notExpendable('NotExpendable', 8),
  blocked('Blocked', 9);

  const TokenError(
    this.variantName,
    this.codecIndex,
  );

  factory TokenError.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $TokenErrorCodec codec = $TokenErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $TokenErrorCodec with _i1.Codec<TokenError> {
  const $TokenErrorCodec();

  @override
  TokenError decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return TokenError.fundsUnavailable;
      case 1:
        return TokenError.onlyProvider;
      case 2:
        return TokenError.belowMinimum;
      case 3:
        return TokenError.cannotCreate;
      case 4:
        return TokenError.unknownAsset;
      case 5:
        return TokenError.frozen;
      case 6:
        return TokenError.unsupported;
      case 7:
        return TokenError.cannotCreateHold;
      case 8:
        return TokenError.notExpendable;
      case 9:
        return TokenError.blocked;
      default:
        throw Exception('TokenError: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    TokenError value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
