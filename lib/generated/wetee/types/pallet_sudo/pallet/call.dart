// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_runtime/multiaddress/multi_address.dart' as _i5;
import '../../sp_weights/weight_v2/weight.dart' as _i4;
import '../../wetee_runtime/runtime_call.dart' as _i3;

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

  Map<String, Map<String, Map<String, dynamic>>> toJson();
}

class $Call {
  const $Call();

  Sudo sudo({required _i3.RuntimeCall call}) {
    return Sudo(call: call);
  }

  SudoUncheckedWeight sudoUncheckedWeight({
    required _i3.RuntimeCall call,
    required _i4.Weight weight,
  }) {
    return SudoUncheckedWeight(
      call: call,
      weight: weight,
    );
  }

  SetKey setKey({required _i5.MultiAddress new_}) {
    return SetKey(new_: new_);
  }

  SudoAs sudoAs({
    required _i5.MultiAddress who,
    required _i3.RuntimeCall call,
  }) {
    return SudoAs(
      who: who,
      call: call,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Sudo._decode(input);
      case 1:
        return SudoUncheckedWeight._decode(input);
      case 2:
        return SetKey._decode(input);
      case 3:
        return SudoAs._decode(input);
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
      case Sudo:
        (value as Sudo).encodeTo(output);
        break;
      case SudoUncheckedWeight:
        (value as SudoUncheckedWeight).encodeTo(output);
        break;
      case SetKey:
        (value as SetKey).encodeTo(output);
        break;
      case SudoAs:
        (value as SudoAs).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Sudo:
        return (value as Sudo)._sizeHint();
      case SudoUncheckedWeight:
        return (value as SudoUncheckedWeight)._sizeHint();
      case SetKey:
        return (value as SetKey)._sizeHint();
      case SudoAs:
        return (value as SudoAs)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::sudo`].
class Sudo extends Call {
  const Sudo({required this.call});

  factory Sudo._decode(_i1.Input input) {
    return Sudo(call: _i3.RuntimeCall.codec.decode(input));
  }

  /// Box<<T as Config>::RuntimeCall>
  final _i3.RuntimeCall call;

  @override
  Map<String, Map<String, Map<String, Map<String, dynamic>>>> toJson() => {
        'sudo': {'call': call.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.RuntimeCall.codec.sizeHint(call);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Sudo && other.call == call;

  @override
  int get hashCode => call.hashCode;
}

/// See [`Pallet::sudo_unchecked_weight`].
class SudoUncheckedWeight extends Call {
  const SudoUncheckedWeight({
    required this.call,
    required this.weight,
  });

  factory SudoUncheckedWeight._decode(_i1.Input input) {
    return SudoUncheckedWeight(
      call: _i3.RuntimeCall.codec.decode(input),
      weight: _i4.Weight.codec.decode(input),
    );
  }

  /// Box<<T as Config>::RuntimeCall>
  final _i3.RuntimeCall call;

  /// Weight
  final _i4.Weight weight;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'sudo_unchecked_weight': {
          'call': call.toJson(),
          'weight': weight.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.RuntimeCall.codec.sizeHint(call);
    size = size + _i4.Weight.codec.sizeHint(weight);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i3.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
    _i4.Weight.codec.encodeTo(
      weight,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SudoUncheckedWeight &&
          other.call == call &&
          other.weight == weight;

  @override
  int get hashCode => Object.hash(
        call,
        weight,
      );
}

/// See [`Pallet::set_key`].
class SetKey extends Call {
  const SetKey({required this.new_});

  factory SetKey._decode(_i1.Input input) {
    return SetKey(new_: _i5.MultiAddress.codec.decode(input));
  }

  /// AccountIdLookupOf<T>
  final _i5.MultiAddress new_;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'set_key': {'new': new_.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.MultiAddress.codec.sizeHint(new_);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i5.MultiAddress.codec.encodeTo(
      new_,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetKey && other.new_ == new_;

  @override
  int get hashCode => new_.hashCode;
}

/// See [`Pallet::sudo_as`].
class SudoAs extends Call {
  const SudoAs({
    required this.who,
    required this.call,
  });

  factory SudoAs._decode(_i1.Input input) {
    return SudoAs(
      who: _i5.MultiAddress.codec.decode(input),
      call: _i3.RuntimeCall.codec.decode(input),
    );
  }

  /// AccountIdLookupOf<T>
  final _i5.MultiAddress who;

  /// Box<<T as Config>::RuntimeCall>
  final _i3.RuntimeCall call;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'sudo_as': {
          'who': who.toJson(),
          'call': call.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i5.MultiAddress.codec.sizeHint(who);
    size = size + _i3.RuntimeCall.codec.sizeHint(call);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i5.MultiAddress.codec.encodeTo(
      who,
      output,
    );
    _i3.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SudoAs && other.who == who && other.call == call;

  @override
  int get hashCode => Object.hash(
        who,
        call,
      );
}
