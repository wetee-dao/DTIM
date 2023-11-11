// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class StoredState {
  const StoredState();

  factory StoredState.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $StoredStateCodec codec = $StoredStateCodec();

  static const $StoredState values = $StoredState();

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

class $StoredState {
  const $StoredState();

  Live live() {
    return Live();
  }

  PendingPause pendingPause({
    required BigInt scheduledAt,
    required BigInt delay,
  }) {
    return PendingPause(
      scheduledAt: scheduledAt,
      delay: delay,
    );
  }

  Paused paused() {
    return Paused();
  }

  PendingResume pendingResume({
    required BigInt scheduledAt,
    required BigInt delay,
  }) {
    return PendingResume(
      scheduledAt: scheduledAt,
      delay: delay,
    );
  }
}

class $StoredStateCodec with _i1.Codec<StoredState> {
  const $StoredStateCodec();

  @override
  StoredState decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const Live();
      case 1:
        return PendingPause._decode(input);
      case 2:
        return const Paused();
      case 3:
        return PendingResume._decode(input);
      default:
        throw Exception('StoredState: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    StoredState value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Live:
        (value as Live).encodeTo(output);
        break;
      case PendingPause:
        (value as PendingPause).encodeTo(output);
        break;
      case Paused:
        (value as Paused).encodeTo(output);
        break;
      case PendingResume:
        (value as PendingResume).encodeTo(output);
        break;
      default:
        throw Exception(
            'StoredState: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(StoredState value) {
    switch (value.runtimeType) {
      case Live:
        return 1;
      case PendingPause:
        return (value as PendingPause)._sizeHint();
      case Paused:
        return 1;
      case PendingResume:
        return (value as PendingResume)._sizeHint();
      default:
        throw Exception(
            'StoredState: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Live extends StoredState {
  const Live();

  @override
  Map<String, dynamic> toJson() => {'Live': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Live;

  @override
  int get hashCode => runtimeType.hashCode;
}

class PendingPause extends StoredState {
  const PendingPause({
    required this.scheduledAt,
    required this.delay,
  });

  factory PendingPause._decode(_i1.Input input) {
    return PendingPause(
      scheduledAt: _i1.U64Codec.codec.decode(input),
      delay: _i1.U64Codec.codec.decode(input),
    );
  }

  /// N
  final BigInt scheduledAt;

  /// N
  final BigInt delay;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'PendingPause': {
          'scheduledAt': scheduledAt,
          'delay': delay,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(scheduledAt);
    size = size + _i1.U64Codec.codec.sizeHint(delay);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      scheduledAt,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      delay,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PendingPause &&
          other.scheduledAt == scheduledAt &&
          other.delay == delay;

  @override
  int get hashCode => Object.hash(
        scheduledAt,
        delay,
      );
}

class Paused extends StoredState {
  const Paused();

  @override
  Map<String, dynamic> toJson() => {'Paused': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Paused;

  @override
  int get hashCode => runtimeType.hashCode;
}

class PendingResume extends StoredState {
  const PendingResume({
    required this.scheduledAt,
    required this.delay,
  });

  factory PendingResume._decode(_i1.Input input) {
    return PendingResume(
      scheduledAt: _i1.U64Codec.codec.decode(input),
      delay: _i1.U64Codec.codec.decode(input),
    );
  }

  /// N
  final BigInt scheduledAt;

  /// N
  final BigInt delay;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'PendingResume': {
          'scheduledAt': scheduledAt,
          'delay': delay,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(scheduledAt);
    size = size + _i1.U64Codec.codec.sizeHint(delay);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      scheduledAt,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      delay,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PendingResume &&
          other.scheduledAt == scheduledAt &&
          other.delay == delay;

  @override
  int get hashCode => Object.hash(
        scheduledAt,
        delay,
      );
}
