// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  amountIntoBalanceFailed('AmountIntoBalanceFailed', 0),
  balanceTooLow('BalanceTooLow', 1),
  assetAlreadyExists('AssetAlreadyExists', 2),
  assetNotExists('AssetNotExists', 3),
  metadataNotChange('MetadataNotChange', 4),
  metadataErr('MetadataErr', 5),
  notOwner('NotOwner', 6),
  shouldNotChangeDecimals('ShouldNotChangeDecimals', 7),
  metadataNotExists('MetadataNotExists', 8),
  nativeCurrency('NativeCurrency', 9),
  currencyIdTooLarge('CurrencyIdTooLarge', 10),
  currencyIdTooLow('CurrencyIdTooLow', 11),
  daoExists('DaoExists', 12),
  cexTransferClosed('CexTransferClosed', 13),
  assetIdExisted('AssetIdExisted', 14),
  depositTooLow('DepositTooLow', 15),
  depositNotZero('DepositNotZero', 16),
  depositRateError('DepositRateError', 17),
  badDaoOrigin('BadDaoOrigin', 18);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.amountIntoBalanceFailed;
      case 1:
        return Error.balanceTooLow;
      case 2:
        return Error.assetAlreadyExists;
      case 3:
        return Error.assetNotExists;
      case 4:
        return Error.metadataNotChange;
      case 5:
        return Error.metadataErr;
      case 6:
        return Error.notOwner;
      case 7:
        return Error.shouldNotChangeDecimals;
      case 8:
        return Error.metadataNotExists;
      case 9:
        return Error.nativeCurrency;
      case 10:
        return Error.currencyIdTooLarge;
      case 11:
        return Error.currencyIdTooLow;
      case 12:
        return Error.daoExists;
      case 13:
        return Error.cexTransferClosed;
      case 14:
        return Error.assetIdExisted;
      case 15:
        return Error.depositTooLow;
      case 16:
        return Error.depositNotZero;
      case 17:
        return Error.depositRateError;
      case 18:
        return Error.badDaoOrigin;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
