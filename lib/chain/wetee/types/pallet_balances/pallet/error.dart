// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Vesting balance too high to send value.
  vestingBalance('VestingBalance', 0),

  /// Account liquidity restrictions prevent withdrawal.
  liquidityRestrictions('LiquidityRestrictions', 1),

  /// Balance too low to send value.
  insufficientBalance('InsufficientBalance', 2),

  /// Value too low to create account due to existential deposit.
  existentialDeposit('ExistentialDeposit', 3),

  /// Transfer/payment would kill account.
  expendability('Expendability', 4),

  /// A vesting schedule already exists for this account.
  existingVestingSchedule('ExistingVestingSchedule', 5),

  /// Beneficiary account must pre-exist.
  deadAccount('DeadAccount', 6),

  /// Number of named reserves exceed `MaxReserves`.
  tooManyReserves('TooManyReserves', 7),

  /// Number of holds exceed `MaxHolds`.
  tooManyHolds('TooManyHolds', 8),

  /// Number of freezes exceed `MaxFreezes`.
  tooManyFreezes('TooManyFreezes', 9);

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
        return Error.vestingBalance;
      case 1:
        return Error.liquidityRestrictions;
      case 2:
        return Error.insufficientBalance;
      case 3:
        return Error.existentialDeposit;
      case 4:
        return Error.expendability;
      case 5:
        return Error.existingVestingSchedule;
      case 6:
        return Error.deadAccount;
      case 7:
        return Error.tooManyReserves;
      case 8:
        return Error.tooManyHolds;
      case 9:
        return Error.tooManyFreezes;
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
