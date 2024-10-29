// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'opinion.dart' as _i2;

class VoteInfo {
  const VoteInfo({
    required this.daoId,
    required this.pledge,
    required this.opinion,
    required this.voteWeight,
    required this.unlockBlock,
    required this.propIndex,
  });

  factory VoteInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// DaoId
  final BigInt daoId;

  /// Balance
  final BigInt pledge;

  /// Opinion
  final _i2.Opinion opinion;

  /// Balance
  final BigInt voteWeight;

  /// BlockNumber
  final BigInt unlockBlock;

  /// PropIndex
  final int propIndex;

  static const $VoteInfoCodec codec = $VoteInfoCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'daoId': daoId,
        'pledge': pledge,
        'opinion': opinion.toJson(),
        'voteWeight': voteWeight,
        'unlockBlock': unlockBlock,
        'propIndex': propIndex,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is VoteInfo &&
          other.daoId == daoId &&
          other.pledge == pledge &&
          other.opinion == opinion &&
          other.voteWeight == voteWeight &&
          other.unlockBlock == unlockBlock &&
          other.propIndex == propIndex;

  @override
  int get hashCode => Object.hash(
        daoId,
        pledge,
        opinion,
        voteWeight,
        unlockBlock,
        propIndex,
      );
}

class $VoteInfoCodec with _i1.Codec<VoteInfo> {
  const $VoteInfoCodec();

  @override
  void encodeTo(
    VoteInfo obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.daoId,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.pledge,
      output,
    );
    _i2.Opinion.codec.encodeTo(
      obj.opinion,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.voteWeight,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.unlockBlock,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.propIndex,
      output,
    );
  }

  @override
  VoteInfo decode(_i1.Input input) {
    return VoteInfo(
      daoId: _i1.U64Codec.codec.decode(input),
      pledge: _i1.U128Codec.codec.decode(input),
      opinion: _i2.Opinion.codec.decode(input),
      voteWeight: _i1.U128Codec.codec.decode(input),
      unlockBlock: _i1.U64Codec.codec.decode(input),
      propIndex: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(VoteInfo obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.daoId);
    size = size + _i1.U128Codec.codec.sizeHint(obj.pledge);
    size = size + _i2.Opinion.codec.sizeHint(obj.opinion);
    size = size + _i1.U128Codec.codec.sizeHint(obj.voteWeight);
    size = size + _i1.U64Codec.codec.sizeHint(obj.unlockBlock);
    size = size + _i1.U32Codec.codec.sizeHint(obj.propIndex);
    return size;
  }
}
