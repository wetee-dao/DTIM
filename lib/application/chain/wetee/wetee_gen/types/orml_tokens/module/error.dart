// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// The balance is too low
  balanceTooLow('BalanceTooLow', 0),

  /// Cannot convert Amount into Balance type
  amountIntoBalanceFailed('AmountIntoBalanceFailed', 1),

  /// Failed because liquidity restrictions due to locking
  liquidityRestrictions('LiquidityRestrictions', 2),

  /// Failed because the maximum locks was exceeded
  maxLocksExceeded('MaxLocksExceeded', 3),

  /// Transfer/payment would kill account
  keepAlive('KeepAlive', 4),

  /// Value too low to create account due to existential deposit
  existentialDeposit('ExistentialDeposit', 5),

  /// Beneficiary account must pre-exist
  deadAccount('DeadAccount', 6),
  tooManyReserves('TooManyReserves', 7);

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
        return Error.balanceTooLow;
      case 1:
        return Error.amountIntoBalanceFailed;
      case 2:
        return Error.liquidityRestrictions;
      case 3:
        return Error.maxLocksExceeded;
      case 4:
        return Error.keepAlive;
      case 5:
        return Error.existentialDeposit;
      case 6:
        return Error.deadAccount;
      case 7:
        return Error.tooManyReserves;
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
