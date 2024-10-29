// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

enum WorkType {
  app('APP', 0),
  task('TASK', 1),
  gpu('GPU', 2);

  const WorkType(
    this.variantName,
    this.codecIndex,
  );

  factory WorkType.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $WorkTypeCodec codec = $WorkTypeCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $WorkTypeCodec with _i1.Codec<WorkType> {
  const $WorkTypeCodec();

  @override
  WorkType decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return WorkType.app;
      case 1:
        return WorkType.task;
      case 2:
        return WorkType.gpu;
      default:
        throw Exception('WorkType: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    WorkType value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
