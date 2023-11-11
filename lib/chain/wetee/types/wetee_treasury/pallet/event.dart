// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

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

class $Event {
  const $Event();

  SpendApproved spendApproved({
    required BigInt daoId,
    required BigInt amount,
    required _i3.AccountId32 beneficiary,
  }) {
    return SpendApproved(
      daoId: daoId,
      amount: amount,
      beneficiary: beneficiary,
    );
  }

  SpendRejected spendRejected({
    required BigInt daoId,
    required BigInt amount,
    required _i3.AccountId32 beneficiary,
  }) {
    return SpendRejected(
      daoId: daoId,
      amount: amount,
      beneficiary: beneficiary,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return SpendApproved._decode(input);
      case 1:
        return SpendRejected._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case SpendApproved:
        (value as SpendApproved).encodeTo(output);
        break;
      case SpendRejected:
        (value as SpendRejected).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case SpendApproved:
        return (value as SpendApproved)._sizeHint();
      case SpendRejected:
        return (value as SpendRejected)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A new spend proposal has been approved.
class SpendApproved extends Event {
  const SpendApproved({
    required this.daoId,
    required this.amount,
    required this.beneficiary,
  });

  factory SpendApproved._decode(_i1.Input input) {
    return SpendApproved(
      daoId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
      beneficiary: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// BalanceOf<T>
  final BigInt amount;

  /// T::AccountId
  final _i3.AccountId32 beneficiary;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SpendApproved': {
          'daoId': daoId,
          'amount': amount,
          'beneficiary': beneficiary.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    size = size + const _i3.AccountId32Codec().sizeHint(beneficiary);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      beneficiary,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SpendApproved &&
          other.daoId == daoId &&
          other.amount == amount &&
          _i4.listsEqual(
            other.beneficiary,
            beneficiary,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        amount,
        beneficiary,
      );
}

/// A proposal was rejected;
class SpendRejected extends Event {
  const SpendRejected({
    required this.daoId,
    required this.amount,
    required this.beneficiary,
  });

  factory SpendRejected._decode(_i1.Input input) {
    return SpendRejected(
      daoId: _i1.U64Codec.codec.decode(input),
      amount: _i1.U128Codec.codec.decode(input),
      beneficiary: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// BalanceOf<T>
  final BigInt amount;

  /// T::AccountId
  final _i3.AccountId32 beneficiary;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SpendRejected': {
          'daoId': daoId,
          'amount': amount,
          'beneficiary': beneficiary.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U128Codec.codec.sizeHint(amount);
    size = size + const _i3.AccountId32Codec().sizeHint(beneficiary);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      amount,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      beneficiary,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SpendRejected &&
          other.daoId == daoId &&
          other.amount == amount &&
          _i4.listsEqual(
            other.beneficiary,
            beneficiary,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        amount,
        beneficiary,
      );
}
