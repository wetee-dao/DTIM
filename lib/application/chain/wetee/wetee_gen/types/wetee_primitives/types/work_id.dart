// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'work_type.dart' as _i2;

class WorkId {
  const WorkId({
    required this.wtype,
    required this.id,
  });

  factory WorkId.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// WorkType
  final _i2.WorkType wtype;

  /// TeeAppId
  final BigInt id;

  static const $WorkIdCodec codec = $WorkIdCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'wtype': wtype.toJson(),
        'id': id,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is WorkId && other.wtype == wtype && other.id == id;

  @override
  int get hashCode => Object.hash(
        wtype,
        id,
      );
}

class $WorkIdCodec with _i1.Codec<WorkId> {
  const $WorkIdCodec();

  @override
  void encodeTo(
    WorkId obj,
    _i1.Output output,
  ) {
    _i2.WorkType.codec.encodeTo(
      obj.wtype,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
  }

  @override
  WorkId decode(_i1.Input input) {
    return WorkId(
      wtype: _i2.WorkType.codec.decode(input),
      id: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(WorkId obj) {
    int size = 0;
    size = size + _i2.WorkType.codec.sizeHint(obj.wtype);
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    return size;
  }
}
