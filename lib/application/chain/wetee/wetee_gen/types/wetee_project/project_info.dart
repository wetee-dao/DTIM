// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import 'status.dart' as _i3;

class ProjectInfo {
  const ProjectInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.daoAccountId,
    required this.creator,
    required this.status,
  });

  factory ProjectInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// ProjectId
  final BigInt id;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> description;

  /// AccountId
  final _i2.AccountId32 daoAccountId;

  /// AccountId
  final _i2.AccountId32 creator;

  /// Status
  final _i3.Status status;

  static const $ProjectInfoCodec codec = $ProjectInfoCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'daoAccountId': daoAccountId.toList(),
        'creator': creator.toList(),
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProjectInfo &&
          other.id == id &&
          _i5.listsEqual(
            other.name,
            name,
          ) &&
          _i5.listsEqual(
            other.description,
            description,
          ) &&
          _i5.listsEqual(
            other.daoAccountId,
            daoAccountId,
          ) &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        description,
        daoAccountId,
        creator,
        status,
      );
}

class $ProjectInfoCodec with _i1.Codec<ProjectInfo> {
  const $ProjectInfoCodec();

  @override
  void encodeTo(
    ProjectInfo obj,
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
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.description,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.daoAccountId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creator,
      output,
    );
    _i3.Status.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  ProjectInfo decode(_i1.Input input) {
    return ProjectInfo(
      id: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      description: _i1.U8SequenceCodec.codec.decode(input),
      daoAccountId: const _i1.U8ArrayCodec(32).decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      status: _i3.Status.codec.decode(input),
    );
  }

  @override
  int sizeHint(ProjectInfo obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.description);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.daoAccountId);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i3.Status.codec.sizeHint(obj.status);
    return size;
  }
}
