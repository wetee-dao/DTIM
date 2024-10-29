// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

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

  BatchInterrupted batchInterrupted({
    required int index,
    required _i3.DispatchError error,
  }) {
    return BatchInterrupted(
      index: index,
      error: error,
    );
  }

  BatchCompleted batchCompleted() {
    return BatchCompleted();
  }

  BatchCompletedWithErrors batchCompletedWithErrors() {
    return BatchCompletedWithErrors();
  }

  ItemCompleted itemCompleted() {
    return ItemCompleted();
  }

  ItemFailed itemFailed({required _i3.DispatchError error}) {
    return ItemFailed(error: error);
  }

  DispatchedAs dispatchedAs(
      {required _i1.Result<dynamic, _i3.DispatchError> result}) {
    return DispatchedAs(result: result);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return BatchInterrupted._decode(input);
      case 1:
        return const BatchCompleted();
      case 2:
        return const BatchCompletedWithErrors();
      case 3:
        return const ItemCompleted();
      case 4:
        return ItemFailed._decode(input);
      case 5:
        return DispatchedAs._decode(input);
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
      case BatchInterrupted:
        (value as BatchInterrupted).encodeTo(output);
        break;
      case BatchCompleted:
        (value as BatchCompleted).encodeTo(output);
        break;
      case BatchCompletedWithErrors:
        (value as BatchCompletedWithErrors).encodeTo(output);
        break;
      case ItemCompleted:
        (value as ItemCompleted).encodeTo(output);
        break;
      case ItemFailed:
        (value as ItemFailed).encodeTo(output);
        break;
      case DispatchedAs:
        (value as DispatchedAs).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case BatchInterrupted:
        return (value as BatchInterrupted)._sizeHint();
      case BatchCompleted:
        return 1;
      case BatchCompletedWithErrors:
        return 1;
      case ItemCompleted:
        return 1;
      case ItemFailed:
        return (value as ItemFailed)._sizeHint();
      case DispatchedAs:
        return (value as DispatchedAs)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Batch of dispatches did not complete fully. Index of first failing dispatch given, as
/// well as the error.
class BatchInterrupted extends Event {
  const BatchInterrupted({
    required this.index,
    required this.error,
  });

  factory BatchInterrupted._decode(_i1.Input input) {
    return BatchInterrupted(
      index: _i1.U32Codec.codec.decode(input),
      error: _i3.DispatchError.codec.decode(input),
    );
  }

  /// u32
  final int index;

  /// DispatchError
  final _i3.DispatchError error;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'BatchInterrupted': {
          'index': index,
          'error': error.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(index);
    size = size + _i3.DispatchError.codec.sizeHint(error);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      index,
      output,
    );
    _i3.DispatchError.codec.encodeTo(
      error,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BatchInterrupted && other.index == index && other.error == error;

  @override
  int get hashCode => Object.hash(
        index,
        error,
      );
}

/// Batch of dispatches completed fully with no error.
class BatchCompleted extends Event {
  const BatchCompleted();

  @override
  Map<String, dynamic> toJson() => {'BatchCompleted': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is BatchCompleted;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// Batch of dispatches completed but has errors.
class BatchCompletedWithErrors extends Event {
  const BatchCompletedWithErrors();

  @override
  Map<String, dynamic> toJson() => {'BatchCompletedWithErrors': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is BatchCompletedWithErrors;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// A single item within a Batch of dispatches has completed with no error.
class ItemCompleted extends Event {
  const ItemCompleted();

  @override
  Map<String, dynamic> toJson() => {'ItemCompleted': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is ItemCompleted;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// A single item within a Batch of dispatches has completed with error.
class ItemFailed extends Event {
  const ItemFailed({required this.error});

  factory ItemFailed._decode(_i1.Input input) {
    return ItemFailed(error: _i3.DispatchError.codec.decode(input));
  }

  /// DispatchError
  final _i3.DispatchError error;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'ItemFailed': {'error': error.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.DispatchError.codec.sizeHint(error);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i3.DispatchError.codec.encodeTo(
      error,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ItemFailed && other.error == error;

  @override
  int get hashCode => error.hashCode;
}

/// A call was dispatched.
class DispatchedAs extends Event {
  const DispatchedAs({required this.result});

  factory DispatchedAs._decode(_i1.Input input) {
    return DispatchedAs(
        result: const _i1.ResultCodec<dynamic, _i3.DispatchError>(
      _i1.NullCodec.codec,
      _i3.DispatchError.codec,
    ).decode(input));
  }

  /// DispatchResult
  final _i1.Result<dynamic, _i3.DispatchError> result;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'DispatchedAs': {'result': result.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size +
        const _i1.ResultCodec<dynamic, _i3.DispatchError>(
          _i1.NullCodec.codec,
          _i3.DispatchError.codec,
        ).sizeHint(result);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.ResultCodec<dynamic, _i3.DispatchError>(
      _i1.NullCodec.codec,
      _i3.DispatchError.codec,
    ).encodeTo(
      result,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DispatchedAs && other.result == result;

  @override
  int get hashCode => result.hashCode;
}
