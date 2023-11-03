// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import '../../frame_support/traits/messages/process_message_error.dart' as _i4;
import '../../sp_weights/weight_v2/weight.dart' as _i5;
import '../../wetee_primitives/traits/message_origin.dart' as _i3;

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

  ProcessingFailed processingFailed({
    required List<int> id,
    required _i3.MessageOrigin origin,
    required _i4.ProcessMessageError error,
  }) {
    return ProcessingFailed(
      id: id,
      origin: origin,
      error: error,
    );
  }

  Processed processed({
    required List<int> id,
    required _i3.MessageOrigin origin,
    required _i5.Weight weightUsed,
    required bool success,
  }) {
    return Processed(
      id: id,
      origin: origin,
      weightUsed: weightUsed,
      success: success,
    );
  }

  OverweightEnqueued overweightEnqueued({
    required List<int> id,
    required _i3.MessageOrigin origin,
    required int pageIndex,
    required int messageIndex,
  }) {
    return OverweightEnqueued(
      id: id,
      origin: origin,
      pageIndex: pageIndex,
      messageIndex: messageIndex,
    );
  }

  PageReaped pageReaped({
    required _i3.MessageOrigin origin,
    required int index,
  }) {
    return PageReaped(
      origin: origin,
      index: index,
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
        return ProcessingFailed._decode(input);
      case 1:
        return Processed._decode(input);
      case 2:
        return OverweightEnqueued._decode(input);
      case 3:
        return PageReaped._decode(input);
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
      case ProcessingFailed:
        (value as ProcessingFailed).encodeTo(output);
        break;
      case Processed:
        (value as Processed).encodeTo(output);
        break;
      case OverweightEnqueued:
        (value as OverweightEnqueued).encodeTo(output);
        break;
      case PageReaped:
        (value as PageReaped).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case ProcessingFailed:
        return (value as ProcessingFailed)._sizeHint();
      case Processed:
        return (value as Processed)._sizeHint();
      case OverweightEnqueued:
        return (value as OverweightEnqueued)._sizeHint();
      case PageReaped:
        return (value as PageReaped)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Message discarded due to an error in the `MessageProcessor` (usually a format error).
class ProcessingFailed extends Event {
  const ProcessingFailed({
    required this.id,
    required this.origin,
    required this.error,
  });

  factory ProcessingFailed._decode(_i1.Input input) {
    return ProcessingFailed(
      id: const _i1.U8ArrayCodec(32).decode(input),
      origin: _i3.MessageOrigin.codec.decode(input),
      error: _i4.ProcessMessageError.codec.decode(input),
    );
  }

  /// [u8; 32]
  final List<int> id;

  /// MessageOriginOf<T>
  final _i3.MessageOrigin origin;

  /// ProcessMessageError
  final _i4.ProcessMessageError error;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'ProcessingFailed': {
          'id': id.toList(),
          'origin': origin.toJson(),
          'error': error.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(32).sizeHint(id);
    size = size + _i3.MessageOrigin.codec.sizeHint(origin);
    size = size + _i4.ProcessMessageError.codec.sizeHint(error);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      id,
      output,
    );
    _i3.MessageOrigin.codec.encodeTo(
      origin,
      output,
    );
    _i4.ProcessMessageError.codec.encodeTo(
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
      other is ProcessingFailed &&
          _i6.listsEqual(
            other.id,
            id,
          ) &&
          other.origin == origin &&
          other.error == error;

  @override
  int get hashCode => Object.hash(
        id,
        origin,
        error,
      );
}

/// Message is processed.
class Processed extends Event {
  const Processed({
    required this.id,
    required this.origin,
    required this.weightUsed,
    required this.success,
  });

  factory Processed._decode(_i1.Input input) {
    return Processed(
      id: const _i1.U8ArrayCodec(32).decode(input),
      origin: _i3.MessageOrigin.codec.decode(input),
      weightUsed: _i5.Weight.codec.decode(input),
      success: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// [u8; 32]
  final List<int> id;

  /// MessageOriginOf<T>
  final _i3.MessageOrigin origin;

  /// Weight
  final _i5.Weight weightUsed;

  /// bool
  final bool success;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'Processed': {
          'id': id.toList(),
          'origin': origin.toJson(),
          'weightUsed': weightUsed.toJson(),
          'success': success,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(32).sizeHint(id);
    size = size + _i3.MessageOrigin.codec.sizeHint(origin);
    size = size + _i5.Weight.codec.sizeHint(weightUsed);
    size = size + _i1.BoolCodec.codec.sizeHint(success);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      id,
      output,
    );
    _i3.MessageOrigin.codec.encodeTo(
      origin,
      output,
    );
    _i5.Weight.codec.encodeTo(
      weightUsed,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      success,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Processed &&
          _i6.listsEqual(
            other.id,
            id,
          ) &&
          other.origin == origin &&
          other.weightUsed == weightUsed &&
          other.success == success;

  @override
  int get hashCode => Object.hash(
        id,
        origin,
        weightUsed,
        success,
      );
}

/// Message placed in overweight queue.
class OverweightEnqueued extends Event {
  const OverweightEnqueued({
    required this.id,
    required this.origin,
    required this.pageIndex,
    required this.messageIndex,
  });

  factory OverweightEnqueued._decode(_i1.Input input) {
    return OverweightEnqueued(
      id: const _i1.U8ArrayCodec(32).decode(input),
      origin: _i3.MessageOrigin.codec.decode(input),
      pageIndex: _i1.U32Codec.codec.decode(input),
      messageIndex: _i1.U32Codec.codec.decode(input),
    );
  }

  /// [u8; 32]
  final List<int> id;

  /// MessageOriginOf<T>
  final _i3.MessageOrigin origin;

  /// PageIndex
  final int pageIndex;

  /// T::Size
  final int messageIndex;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'OverweightEnqueued': {
          'id': id.toList(),
          'origin': origin.toJson(),
          'pageIndex': pageIndex,
          'messageIndex': messageIndex,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i1.U8ArrayCodec(32).sizeHint(id);
    size = size + _i3.MessageOrigin.codec.sizeHint(origin);
    size = size + _i1.U32Codec.codec.sizeHint(pageIndex);
    size = size + _i1.U32Codec.codec.sizeHint(messageIndex);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      id,
      output,
    );
    _i3.MessageOrigin.codec.encodeTo(
      origin,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      pageIndex,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      messageIndex,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is OverweightEnqueued &&
          _i6.listsEqual(
            other.id,
            id,
          ) &&
          other.origin == origin &&
          other.pageIndex == pageIndex &&
          other.messageIndex == messageIndex;

  @override
  int get hashCode => Object.hash(
        id,
        origin,
        pageIndex,
        messageIndex,
      );
}

/// This page was reaped.
class PageReaped extends Event {
  const PageReaped({
    required this.origin,
    required this.index,
  });

  factory PageReaped._decode(_i1.Input input) {
    return PageReaped(
      origin: _i3.MessageOrigin.codec.decode(input),
      index: _i1.U32Codec.codec.decode(input),
    );
  }

  /// MessageOriginOf<T>
  final _i3.MessageOrigin origin;

  /// PageIndex
  final int index;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'PageReaped': {
          'origin': origin.toJson(),
          'index': index,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MessageOrigin.codec.sizeHint(origin);
    size = size + _i1.U32Codec.codec.sizeHint(index);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i3.MessageOrigin.codec.encodeTo(
      origin,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      index,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PageReaped && other.origin == origin && other.index == index;

  @override
  int get hashCode => Object.hash(
        origin,
        index,
      );
}
