// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class DeletionQueueManager {
  const DeletionQueueManager({
    required this.insertCounter,
    required this.deleteCounter,
  });

  factory DeletionQueueManager.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int insertCounter;

  /// u32
  final int deleteCounter;

  static const $DeletionQueueManagerCodec codec = $DeletionQueueManagerCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'insertCounter': insertCounter,
        'deleteCounter': deleteCounter,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DeletionQueueManager &&
          other.insertCounter == insertCounter &&
          other.deleteCounter == deleteCounter;

  @override
  int get hashCode => Object.hash(
        insertCounter,
        deleteCounter,
      );
}

class $DeletionQueueManagerCodec with _i1.Codec<DeletionQueueManager> {
  const $DeletionQueueManagerCodec();

  @override
  void encodeTo(
    DeletionQueueManager obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.insertCounter,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.deleteCounter,
      output,
    );
  }

  @override
  DeletionQueueManager decode(_i1.Input input) {
    return DeletionQueueManager(
      insertCounter: _i1.U32Codec.codec.decode(input),
      deleteCounter: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DeletionQueueManager obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.insertCounter);
    size = size + _i1.U32Codec.codec.sizeHint(obj.deleteCounter);
    return size;
  }
}
