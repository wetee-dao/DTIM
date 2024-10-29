// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i2;
import '../../wetee_primitives/types/work_id.dart' as _i3;

class ClusterContractState {
  const ClusterContractState({
    required this.startNumber,
    required this.user,
    required this.workId,
  });

  factory ClusterContractState.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BlockNumber
  final BigInt startNumber;

  /// AccountId
  final _i2.AccountId32 user;

  /// WorkId
  final _i3.WorkId workId;

  static const $ClusterContractStateCodec codec = $ClusterContractStateCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'startNumber': startNumber,
        'user': user.toList(),
        'workId': workId.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterContractState &&
          other.startNumber == startNumber &&
          _i5.listsEqual(
            other.user,
            user,
          ) &&
          other.workId == workId;

  @override
  int get hashCode => Object.hash(
        startNumber,
        user,
        workId,
      );
}

class $ClusterContractStateCodec with _i1.Codec<ClusterContractState> {
  const $ClusterContractStateCodec();

  @override
  void encodeTo(
    ClusterContractState obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.startNumber,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.user,
      output,
    );
    _i3.WorkId.codec.encodeTo(
      obj.workId,
      output,
    );
  }

  @override
  ClusterContractState decode(_i1.Input input) {
    return ClusterContractState(
      startNumber: _i1.U64Codec.codec.decode(input),
      user: const _i1.U8ArrayCodec(32).decode(input),
      workId: _i3.WorkId.codec.decode(input),
    );
  }

  @override
  int sizeHint(ClusterContractState obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.startNumber);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.user);
    size = size + _i3.WorkId.codec.sizeHint(obj.workId);
    return size;
  }
}
