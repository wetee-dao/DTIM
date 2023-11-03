// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

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

  Map<String, Map<String, dynamic>> toJson();
}

class $Event {
  const $Event();

  Sudid sudid({required _i1.Result<dynamic, _i3.DispatchError> sudoResult}) {
    return Sudid(sudoResult: sudoResult);
  }

  KeyChanged keyChanged({_i4.AccountId32? oldSudoer}) {
    return KeyChanged(oldSudoer: oldSudoer);
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
      case SudoAsDone:
        return (value as SudoAsDone)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// A sudo just took place. \[result\]
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

/// The \[sudoer\] just switched identity; the old key is supplied if one existed.
class KeyChanged extends Event {
  const KeyChanged({this.oldSudoer});

  factory KeyChanged._decode(_i1.Input input) {
    return KeyChanged(
        oldSudoer:
            const _i1.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec())
                .decode(input));
  }

  /// Option<T::AccountId>
  final _i4.AccountId32? oldSudoer;

  @override
  Map<String, Map<String, List<int>?>> toJson() => {
        'KeyChanged': {'oldSudoer': oldSudoer?.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec())
            .sizeHint(oldSudoer);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.OptionCodec<_i4.AccountId32>(_i4.AccountId32Codec()).encodeTo(
      oldSudoer,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is KeyChanged && other.oldSudoer == oldSudoer;

  @override
  int get hashCode => oldSudoer.hashCode;
}

/// A sudo just took place. \[result\]
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
      2,
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
