// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i4;
import '../../sp_runtime/dispatch_error.dart' as _i3;

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

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  Sudid sudid({required _i1.Result<dynamic, _i3.DispatchError> sudoResult}) {
    return Sudid(sudoResult: sudoResult);
  }

  KeyChanged keyChanged({
    _i4.AccountId32? old,
    required _i4.AccountId32 new_,
  }) {
    return KeyChanged(
      old: old,
      new_: new_,
    );
  }

  KeyRemoved keyRemoved() {
    return KeyRemoved();
  }

  SudoAsDone sudoAsDone(
      {required _i1.Result<dynamic, _i3.DispatchError> sudoResult}) {
    return SudoAsDone(sudoResult: sudoResult);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Sudid._decode(input);
      case 1:
        return KeyChanged._decode(input);
      case 2:
        return const KeyRemoved();
      case 3:
        return SudoAsDone._decode(input);
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
      case Sudid:
        (value as Sudid).encodeTo(output);
        break;
      case KeyChanged:
        (value as KeyChanged).encodeTo(output);
        break;
      case KeyRemoved:
        (value as KeyRemoved).encodeTo(output);
        break;
      case SudoAsDone:
        (value as SudoAsDone).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case Sudid:
        return (value as Sudid)._sizeHint();
      case KeyChanged:
        return (value as KeyChanged)._sizeHint();
      case KeyRemoved:
        return 1;
      case SudoAsDone:
        return (value as SudoAsDone)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A sudo call just took place.
class Sudid extends Event {
  const Sudid({required this.sudoResult});

  factory Sudid._decode(_i1.Input input) {
    return Sudid(
        sudoResult: const _i1.ResultCodec<dynamic, _i3.DispatchError>(
      _i1.NullCodec.codec,
      _i3.DispatchError.codec,
    ).decode(input));
  }

  /// DispatchResult
  /// The result of the call made by the sudo user.
  final _i1.Result<dynamic, _i3.DispatchError> sudoResult;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'Sudid': {'sudoResult': sudoResult.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.ResultCodec<dynamic, _i3.DispatchError>(
          _i1.NullCodec.codec,
          _i3.DispatchError.codec,
        ).sizeHint(sudoResult);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.ResultCodec<dynamic, _i3.DispatchError>(
      _i1.NullCodec.codec,
      _i3.DispatchError.codec,
    ).encodeTo(
      sudoResult,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Sudid && other.sudoResult == sudoResult;

  @override
  int get hashCode => sudoResult.hashCode;
}

/// The sudo key has been updated.
class KeyChanged extends Event {
  const KeyChanged({
    this.old,
    required this.new_,
  });

  factory KeyChanged._decode(_i1.Input input) {
    return KeyChanged(
      old: const _i1.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec())
          .decode(input),
      new_: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// Option<T::AccountId>
  /// The old sudo key (if one was previously set).
  final _i4.AccountId32? old;

  /// T::AccountId
  /// The new sudo key (if one was set).
  final _i4.AccountId32 new_;

  @override
  Map<String, Map<String, List<int>?>> toJson() => {
        'KeyChanged': {
          'old': old?.toList(),
          'new': new_.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec())
            .sizeHint(old);
    size = size + const _i4.AccountId32Codec().sizeHint(new_);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec()).encodeTo(
      old,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is KeyChanged &&
          other.old == old &&
          _i5.listsEqual(
            other.new_,
            new_,
          );

  @override
  int get hashCode => Object.hash(
        old,
        new_,
      );
}

/// The key was permanently removed.
class KeyRemoved extends Event {
  const KeyRemoved();

  @override
  Map<String, dynamic> toJson() => {'KeyRemoved': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is KeyRemoved;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// A [sudo_as](Pallet::sudo_as) call just took place.
class SudoAsDone extends Event {
  const SudoAsDone({required this.sudoResult});

  factory SudoAsDone._decode(_i1.Input input) {
    return SudoAsDone(
        sudoResult: const _i1.ResultCodec<dynamic, _i3.DispatchError>(
      _i1.NullCodec.codec,
      _i3.DispatchError.codec,
    ).decode(input));
  }

  /// DispatchResult
  /// The result of the call made by the sudo user.
  final _i1.Result<dynamic, _i3.DispatchError> sudoResult;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'SudoAsDone': {'sudoResult': sudoResult.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.ResultCodec<dynamic, _i3.DispatchError>(
          _i1.NullCodec.codec,
          _i3.DispatchError.codec,
        ).sizeHint(sudoResult);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.ResultCodec<dynamic, _i3.DispatchError>(
      _i1.NullCodec.codec,
      _i3.DispatchError.codec,
    ).encodeTo(
      sudoResult,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SudoAsDone && other.sudoResult == sudoResult;

  @override
  int get hashCode => sudoResult.hashCode;
}
