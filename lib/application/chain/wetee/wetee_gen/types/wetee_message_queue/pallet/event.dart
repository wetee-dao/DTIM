// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../frame_support/traits/messages/process_message_error.dart' as _i5;
import '../../primitive_types/h256.dart' as _i3;
import '../../sp_weights/weight_v2/weight.dart' as _i6;
import '../../wetee_runtime/worker/message_origin.dart' as _i4;

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
    required _i3.H256 id,
    required _i4.MessageOrigin origin,
    required _i5.ProcessMessageError error,
  }) {
    return ProcessingFailed(
      id: id,
      origin: origin,
      error: error,
    );
  }

  Processed processed({
    required _i3.H256 id,
    required _i4.MessageOrigin origin,
    required _i6.Weight weightUsed,
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
    required _i4.MessageOrigin origin,
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
    required _i4.MessageOrigin origin,
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
      origin: _i4.MessageOrigin.codec.decode(input),
      error: _i5.ProcessMessageError.codec.decode(input),
    );
  }

  /// H256
  /// The `blake2_256` hash of the message.
  final _i3.H256 id;

  /// MessageOriginOf<T>
  /// The queue of the message.
  final _i4.MessageOrigin origin;

  /// ProcessMessageError
  /// The error that occurred.
  ///
  /// This error is pretty opaque. More fine-grained errors need to be emitted as events
  /// by the `MessageProcessor`.
  final _i5.ProcessMessageError error;

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
    size = size + const _i3.H256Codec().sizeHint(id);
    size = size + _i4.MessageOrigin.codec.sizeHint(origin);
    size = size + _i5.ProcessMessageError.codec.sizeHint(error);
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
    _i4.MessageOrigin.codec.encodeTo(
      origin,
      output,
    );
    _i5.ProcessMessageError.codec.encodeTo(
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
          _i7.listsEqual(
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
      origin: _i4.MessageOrigin.codec.decode(input),
      weightUsed: _i6.Weight.codec.decode(input),
      success: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// H256
  /// The `blake2_256` hash of the message.
  final _i3.H256 id;

  /// MessageOriginOf<T>
  /// The queue of the message.
  final _i4.MessageOrigin origin;

  /// Weight
  /// How much weight was used to process the message.
  final _i6.Weight weightUsed;

  /// bool
  /// Whether the message was processed.
  ///
  /// Note that this does not mean that the underlying `MessageProcessor` was internally
  /// successful. It *solely* means that the MQ pallet will treat this as a success
  /// condition and discard the message. Any internal error needs to be emitted as events
  /// by the `MessageProcessor`.
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
    size = size + const _i3.H256Codec().sizeHint(id);
    size = size + _i4.MessageOrigin.codec.sizeHint(origin);
    size = size + _i6.Weight.codec.sizeHint(weightUsed);
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
    _i4.MessageOrigin.codec.encodeTo(
      origin,
      output,
    );
    _i6.Weight.codec.encodeTo(
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
          _i7.listsEqual(
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
      origin: _i4.MessageOrigin.codec.decode(input),
      pageIndex: _i1.U32Codec.codec.decode(input),
      messageIndex: _i1.U32Codec.codec.decode(input),
    );
  }

  /// [u8; 32]
  /// The `blake2_256` hash of the message.
  final List<int> id;

  /// MessageOriginOf<T>
  /// The queue of the message.
  final _i4.MessageOrigin origin;

  /// PageIndex
  /// The page of the message.
  final int pageIndex;

  /// T::Size
  /// The index of the message within the page.
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
    size = size + _i4.MessageOrigin.codec.sizeHint(origin);
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
    _i4.MessageOrigin.codec.encodeTo(
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
          _i7.listsEqual(
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
      origin: _i4.MessageOrigin.codec.decode(input),
      index: _i1.U32Codec.codec.decode(input),
    );
  }

  /// MessageOriginOf<T>
  /// The queue of the page.
  final _i4.MessageOrigin origin;

  /// PageIndex
  /// The index of the page.
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
    size = size + _i4.MessageOrigin.codec.sizeHint(origin);
    size = size + _i1.U32Codec.codec.sizeHint(index);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i4.MessageOrigin.codec.encodeTo(
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
