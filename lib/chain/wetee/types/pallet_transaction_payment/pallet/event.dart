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

  TransactionFeePaid transactionFeePaid({
    required _i3.AccountId32 who,
    required BigInt actualFee,
    required BigInt tip,
  }) {
    return TransactionFeePaid(
      who: who,
      actualFee: actualFee,
      tip: tip,
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
        return TransactionFeePaid._decode(input);
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
      case TransactionFeePaid:
        (value as TransactionFeePaid).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case TransactionFeePaid:
        return (value as TransactionFeePaid)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A transaction fee `actual_fee`, of which `tip` was added to the minimum inclusion fee,
/// has been paid by `who`.
class TransactionFeePaid extends Event {
  const TransactionFeePaid({
    required this.who,
    required this.actualFee,
    required this.tip,
  });

  factory TransactionFeePaid._decode(_i1.Input input) {
    return TransactionFeePaid(
      who: const _i1.U8ArrayCodec(32).decode(input),
      actualFee: _i1.U128Codec.codec.decode(input),
      tip: _i1.U128Codec.codec.decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 who;

  /// BalanceOf<T>
  final BigInt actualFee;

  /// BalanceOf<T>
  final BigInt tip;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'TransactionFeePaid': {
          'who': who.toList(),
          'actualFee': actualFee,
          'tip': tip,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(who);
    size = size + _i1.U128Codec.codec.sizeHint(actualFee);
    size = size + _i1.U128Codec.codec.sizeHint(tip);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      who,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      actualFee,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      tip,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TransactionFeePaid &&
          _i4.listsEqual(
            other.who,
            who,
          ) &&
          other.actualFee == actualFee &&
          other.tip == tip;

  @override
  int get hashCode => Object.hash(
        who,
        actualFee,
        tip,
      );
}
