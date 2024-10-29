// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  Spend spend({
    required BigInt daoId,
    required _i3.AccountId32 beneficiary,
    required BigInt amount,
  }) {
    return Spend(
      daoId: daoId,
      beneficiary: beneficiary,
      amount: amount,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 2:
        return Spend._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Spend:
        (value as Spend).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Spend:
        return (value as Spend)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Spend extends Call {
  const Spend({
    required this.daoId,
    required this.beneficiary,
    required this.amount,
  });

  factory Spend._decode(_i1.Input input) {
    return Spend(
      daoId: _i1.U64Codec.codec.decode(input),
      beneficiary: const _i1.U8ArrayCodec(32).decode(input),
      amount: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// T::AccountId
  final _i3.AccountId32 beneficiary;

  /// BalanceOf<T>
  final BigInt amount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'spend': {
          'daoId': daoId,
          'beneficiary': beneficiary.toList(),
          'amount': amount,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + const _i3.AccountId32Codec().sizeHint(beneficiary);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(amount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      beneficiary,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      amount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Spend &&
          other.daoId == daoId &&
          _i4.listsEqual(
            other.beneficiary,
            beneficiary,
          ) &&
          other.amount == amount;

  @override
  int get hashCode => Object.hash(
        daoId,
        beneficiary,
        amount,
      );
}
