// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum TaskStatus {
  toDo('ToDo', 0),
  inProgress('InProgress', 1),
  inReview('InReview', 2),
  done('Done', 3);

  const TaskStatus(
    this.variantName,
    this.codecIndex,
  );

  factory TaskStatus.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $TaskStatusCodec codec = $TaskStatusCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $TaskStatusCodec with _i1.Codec<TaskStatus> {
  const $TaskStatusCodec();

  @override
  TaskStatus decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return TaskStatus.toDo;
      case 1:
        return TaskStatus.inProgress;
      case 2:
        return TaskStatus.inReview;
      case 3:
        return TaskStatus.done;
      default:
        throw Exception('TaskStatus: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    TaskStatus value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
