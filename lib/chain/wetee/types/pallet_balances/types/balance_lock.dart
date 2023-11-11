// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'reasons.dart' as _i2;

class BalanceLock {
  const BalanceLock({
    required this.id,
    required this.amount,
    required this.reasons,
  });

  factory BalanceLock.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// LockIdentifier
  final List<int> id;

  /// Balance
  final BigInt amount;

  /// Reasons
  final _i2.Reasons reasons;

  static const $BalanceLockCodec codec = $BalanceLockCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id.toList(),
        'amount': amount,
        'reasons': reasons.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BalanceLock &&
          _i4.listsEqual(
            other.id,
            id,
          ) &&
          other.amount == amount &&
          other.reasons == reasons;

  @override
  int get hashCode => Object.hash(
        id,
        amount,
        reasons,
      );
}

class $BalanceLockCodec with _i1.Codec<BalanceLock> {
  const $BalanceLockCodec();

  @override
  void encodeTo(
    BalanceLock obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(8).encodeTo(
      obj.id,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.amount,
      output,
    );
    _i2.Reasons.codec.encodeTo(
      obj.reasons,
      output,
    );
  }

  @override
  BalanceLock decode(_i1.Input input) {
    return BalanceLock(
      id: const _i1.U8ArrayCodec(8).decode(input),
      amount: _i1.U128Codec.codec.decode(input),
      reasons: _i2.Reasons.codec.decode(input),
    );
  }

  @override
  int sizeHint(BalanceLock obj) {
    int size = 0;
    size = size + const _i1.U8ArrayCodec(8).sizeHint(obj.id);
    size = size + _i1.U128Codec.codec.sizeHint(obj.amount);
    size = size + _i2.Reasons.codec.sizeHint(obj.reasons);
    return size;
  }
}
