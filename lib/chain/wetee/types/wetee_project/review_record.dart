// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import 'review_opinion.dart' as _i3;

class ReviewRecord {
  const ReviewRecord({
    required this.who,
    required this.meta,
    required this.option,
  });

  factory ReviewRecord.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccountId
  final _i2.AccountId32 who;

  /// Vec<u8>
  final List<int> meta;

  /// ReviewOpinion
  final _i3.ReviewOpinion option;

  static const $ReviewRecordCodec codec = $ReviewRecordCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'who': who.toList(),
        'meta': meta,
        'option': option.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReviewRecord &&
          _i5.listsEqual(
            other.who,
            who,
          ) &&
          _i5.listsEqual(
            other.meta,
            meta,
          ) &&
          other.option == option;

  @override
  int get hashCode => Object.hash(
        who,
        meta,
        option,
      );
}

class $ReviewRecordCodec with _i1.Codec<ReviewRecord> {
  const $ReviewRecordCodec();

  @override
  void encodeTo(
    ReviewRecord obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.who,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.meta,
      output,
    );
    _i3.ReviewOpinion.codec.encodeTo(
      obj.option,
      output,
    );
  }

  @override
  ReviewRecord decode(_i1.Input input) {
    return ReviewRecord(
      who: const _i1.U8ArrayCodec(32).decode(input),
      meta: _i1.U8SequenceCodec.codec.decode(input),
      option: _i3.ReviewOpinion.codec.decode(input),
    );
  }

  @override
  int sizeHint(ReviewRecord obj) {
    int size = 0;
    size = size + const _i2.AccountId32Codec().sizeHint(obj.who);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.meta);
    size = size + _i3.ReviewOpinion.codec.sizeHint(obj.option);
    return size;
  }
}
