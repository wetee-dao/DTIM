// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../sp_core/crypto/account_id32.dart' as _i2;

class QuarterTask {
  const QuarterTask({
    required this.id,
    required this.name,
    required this.priority,
    required this.creator,
    required this.tags,
    required this.status,
  });

  factory QuarterTask.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// TaskId
  final BigInt id;

  /// Vec<u8>
  final List<int> name;

  /// u8
  final int priority;

  /// AccountId
  final _i2.AccountId32 creator;

  /// Vec<u8>
  final List<int> tags;

  /// u8
  final int status;

  static const $QuarterTaskCodec codec = $QuarterTaskCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'priority': priority,
        'creator': creator.toList(),
        'tags': tags,
        'status': status,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is QuarterTask &&
          other.id == id &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          other.priority == priority &&
          _i4.listsEqual(
            other.creator,
            creator,
          ) &&
          _i4.listsEqual(
            other.tags,
            tags,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        priority,
        creator,
        tags,
        status,
      );
}

class $QuarterTaskCodec with _i1.Codec<QuarterTask> {
  const $QuarterTaskCodec();

  @override
  void encodeTo(
    QuarterTask obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.priority,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creator,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.tags,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  QuarterTask decode(_i1.Input input) {
    return QuarterTask(
      id: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      priority: _i1.U8Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      tags: _i1.U8SequenceCodec.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(QuarterTask obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8Codec.codec.sizeHint(obj.priority);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.tags);
    size = size + _i1.U8Codec.codec.sizeHint(obj.status);
    return size;
  }
}
