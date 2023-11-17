// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class Period {
  const Period({
    required this.name,
    required this.palletIndex,
    required this.preparePeriod,
    required this.maxDeciding,
    required this.confirmPeriod,
    required this.decisionPeriod,
    required this.minEnactmentPeriod,
    required this.decisionDeposit,
    required this.minApproval,
    required this.minSupport,
    required this.maxBalance,
  });

  factory Period.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> name;

  /// u16
  final int palletIndex;

  /// BlockNumber
  final BigInt preparePeriod;

  /// BlockNumber
  final BigInt maxDeciding;

  /// BlockNumber
  final BigInt confirmPeriod;

  /// BlockNumber
  final BigInt decisionPeriod;

  /// BlockNumber
  final BigInt minEnactmentPeriod;

  /// Balance
  final BigInt decisionDeposit;

  /// u8
  final int minApproval;

  /// u8
  final int minSupport;

  /// Balance
  final BigInt maxBalance;

  static const $PeriodCodec codec = $PeriodCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'palletIndex': palletIndex,
        'preparePeriod': preparePeriod,
        'maxDeciding': maxDeciding,
        'confirmPeriod': confirmPeriod,
        'decisionPeriod': decisionPeriod,
        'minEnactmentPeriod': minEnactmentPeriod,
        'decisionDeposit': decisionDeposit,
        'minApproval': minApproval,
        'minSupport': minSupport,
        'maxBalance': maxBalance,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Period &&
          _i3.listsEqual(
            other.name,
            name,
          ) &&
          other.palletIndex == palletIndex &&
          other.preparePeriod == preparePeriod &&
          other.maxDeciding == maxDeciding &&
          other.confirmPeriod == confirmPeriod &&
          other.decisionPeriod == decisionPeriod &&
          other.minEnactmentPeriod == minEnactmentPeriod &&
          other.decisionDeposit == decisionDeposit &&
          other.minApproval == minApproval &&
          other.minSupport == minSupport &&
          other.maxBalance == maxBalance;

  @override
  int get hashCode => Object.hash(
        name,
        palletIndex,
        preparePeriod,
        maxDeciding,
        confirmPeriod,
        decisionPeriod,
        minEnactmentPeriod,
        decisionDeposit,
        minApproval,
        minSupport,
        maxBalance,
      );
}

class $PeriodCodec with _i1.Codec<Period> {
  const $PeriodCodec();

  @override
  void encodeTo(
    Period obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.palletIndex,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.preparePeriod,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.maxDeciding,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.confirmPeriod,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.decisionPeriod,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.minEnactmentPeriod,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.decisionDeposit,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.minApproval,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.minSupport,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.maxBalance,
      output,
    );
  }

  @override
  Period decode(_i1.Input input) {
    return Period(
      name: _i1.U8SequenceCodec.codec.decode(input),
      palletIndex: _i1.U16Codec.codec.decode(input),
      preparePeriod: _i1.U64Codec.codec.decode(input),
      maxDeciding: _i1.U64Codec.codec.decode(input),
      confirmPeriod: _i1.U64Codec.codec.decode(input),
      decisionPeriod: _i1.U64Codec.codec.decode(input),
      minEnactmentPeriod: _i1.U64Codec.codec.decode(input),
      decisionDeposit: _i1.U128Codec.codec.decode(input),
      minApproval: _i1.U8Codec.codec.decode(input),
      minSupport: _i1.U8Codec.codec.decode(input),
      maxBalance: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Period obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U16Codec.codec.sizeHint(obj.palletIndex);
    size = size + _i1.U64Codec.codec.sizeHint(obj.preparePeriod);
    size = size + _i1.U64Codec.codec.sizeHint(obj.maxDeciding);
    size = size + _i1.U64Codec.codec.sizeHint(obj.confirmPeriod);
    size = size + _i1.U64Codec.codec.sizeHint(obj.decisionPeriod);
    size = size + _i1.U64Codec.codec.sizeHint(obj.minEnactmentPeriod);
    size = size + _i1.U128Codec.codec.sizeHint(obj.decisionDeposit);
    size = size + _i1.U8Codec.codec.sizeHint(obj.minApproval);
    size = size + _i1.U8Codec.codec.sizeHint(obj.minSupport);
    size = size + _i1.U128Codec.codec.sizeHint(obj.maxBalance);
    return size;
  }
}
