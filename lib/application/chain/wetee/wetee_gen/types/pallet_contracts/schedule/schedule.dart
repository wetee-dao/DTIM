// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'instruction_weights.dart' as _i3;
import 'limits.dart' as _i2;

class Schedule {
  const Schedule({
    required this.limits,
    required this.instructionWeights,
  });

  factory Schedule.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Limits
  final _i2.Limits limits;

  /// InstructionWeights<T>
  final _i3.InstructionWeights instructionWeights;

  static const $ScheduleCodec codec = $ScheduleCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, int>> toJson() => {
        'limits': limits.toJson(),
        'instructionWeights': instructionWeights.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Schedule &&
          other.limits == limits &&
          other.instructionWeights == instructionWeights;

  @override
  int get hashCode => Object.hash(
        limits,
        instructionWeights,
      );
}

class $ScheduleCodec with _i1.Codec<Schedule> {
  const $ScheduleCodec();

  @override
  void encodeTo(
    Schedule obj,
    _i1.Output output,
  ) {
    _i2.Limits.codec.encodeTo(
      obj.limits,
      output,
    );
    _i3.InstructionWeights.codec.encodeTo(
      obj.instructionWeights,
      output,
    );
  }

  @override
  Schedule decode(_i1.Input input) {
    return Schedule(
      limits: _i2.Limits.codec.decode(input),
      instructionWeights: _i3.InstructionWeights.codec.decode(input),
    );
  }

  @override
  int sizeHint(Schedule obj) {
    int size = 0;
    size = size + _i2.Limits.codec.sizeHint(obj.limits);
    size = size + _i3.InstructionWeights.codec.sizeHint(obj.instructionWeights);
    return size;
  }
}
