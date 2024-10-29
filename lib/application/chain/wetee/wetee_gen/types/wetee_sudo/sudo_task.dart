// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../wetee_runtime/runtime_call.dart' as _i2;

class SudoTask {
  const SudoTask({
    required this.id,
    required this.proposal,
    required this.time,
  });

  factory SudoTask.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int id;

  /// Call
  final _i2.RuntimeCall proposal;

  /// BlockNumber
  final BigInt time;

  static const $SudoTaskCodec codec = $SudoTaskCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'proposal': proposal.toJson(),
        'time': time,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SudoTask &&
          other.id == id &&
          other.proposal == proposal &&
          other.time == time;

  @override
  int get hashCode => Object.hash(
        id,
        proposal,
        time,
      );
}

class $SudoTaskCodec with _i1.Codec<SudoTask> {
  const $SudoTaskCodec();

  @override
  void encodeTo(
    SudoTask obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.id,
      output,
    );
    _i2.RuntimeCall.codec.encodeTo(
      obj.proposal,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.time,
      output,
    );
  }

  @override
  SudoTask decode(_i1.Input input) {
    return SudoTask(
      id: _i1.U32Codec.codec.decode(input),
      proposal: _i2.RuntimeCall.codec.decode(input),
      time: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(SudoTask obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.id);
    size = size + _i2.RuntimeCall.codec.sizeHint(obj.proposal);
    size = size + _i1.U64Codec.codec.sizeHint(obj.time);
    return size;
  }
}
