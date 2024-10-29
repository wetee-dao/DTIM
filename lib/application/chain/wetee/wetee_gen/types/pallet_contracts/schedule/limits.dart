// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Limits {
  const Limits({
    required this.eventTopics,
    required this.memoryPages,
    required this.subjectLen,
    required this.payloadLen,
    required this.runtimeMemory,
  });

  factory Limits.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int eventTopics;

  /// u32
  final int memoryPages;

  /// u32
  final int subjectLen;

  /// u32
  final int payloadLen;

  /// u32
  final int runtimeMemory;

  static const $LimitsCodec codec = $LimitsCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'eventTopics': eventTopics,
        'memoryPages': memoryPages,
        'subjectLen': subjectLen,
        'payloadLen': payloadLen,
        'runtimeMemory': runtimeMemory,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Limits &&
          other.eventTopics == eventTopics &&
          other.memoryPages == memoryPages &&
          other.subjectLen == subjectLen &&
          other.payloadLen == payloadLen &&
          other.runtimeMemory == runtimeMemory;

  @override
  int get hashCode => Object.hash(
        eventTopics,
        memoryPages,
        subjectLen,
        payloadLen,
        runtimeMemory,
      );
}

class $LimitsCodec with _i1.Codec<Limits> {
  const $LimitsCodec();

  @override
  void encodeTo(
    Limits obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.eventTopics,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.memoryPages,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.subjectLen,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.payloadLen,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.runtimeMemory,
      output,
    );
  }

  @override
  Limits decode(_i1.Input input) {
    return Limits(
      eventTopics: _i1.U32Codec.codec.decode(input),
      memoryPages: _i1.U32Codec.codec.decode(input),
      subjectLen: _i1.U32Codec.codec.decode(input),
      payloadLen: _i1.U32Codec.codec.decode(input),
      runtimeMemory: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Limits obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.eventTopics);
    size = size + _i1.U32Codec.codec.sizeHint(obj.memoryPages);
    size = size + _i1.U32Codec.codec.sizeHint(obj.subjectLen);
    size = size + _i1.U32Codec.codec.sizeHint(obj.payloadLen);
    size = size + _i1.U32Codec.codec.sizeHint(obj.runtimeMemory);
    return size;
  }
}
