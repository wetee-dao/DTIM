// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import 'review_record.dart' as _i2;
import 'tally.dart' as _i3;

class ReviewStatus {
  const ReviewStatus({
    required this.records,
    required this.tally,
  });

  factory ReviewStatus.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<ReviewRecord<AccountId>>
  final List<_i2.ReviewRecord> records;

  /// Tally
  final _i3.Tally tally;

  static const $ReviewStatusCodec codec = $ReviewStatusCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'records': records.map((value) => value.toJson()).toList(),
        'tally': tally.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReviewStatus &&
          _i5.listsEqual(
            other.records,
            records,
          ) &&
          other.tally == tally;

  @override
  int get hashCode => Object.hash(
        records,
        tally,
      );
}

class $ReviewStatusCodec with _i1.Codec<ReviewStatus> {
  const $ReviewStatusCodec();

  @override
  void encodeTo(
    ReviewStatus obj,
    _i1.Output output,
  ) {
    const _i1.SequenceCodec<_i2.ReviewRecord>(_i2.ReviewRecord.codec).encodeTo(
      obj.records,
      output,
    );
    _i3.Tally.codec.encodeTo(
      obj.tally,
      output,
    );
  }

  @override
  ReviewStatus decode(_i1.Input input) {
    return ReviewStatus(
      records: const _i1.SequenceCodec<_i2.ReviewRecord>(_i2.ReviewRecord.codec)
          .decode(input),
      tally: _i3.Tally.codec.decode(input),
    );
  }

  @override
  int sizeHint(ReviewStatus obj) {
    int size = 0;
    size = size +
        const _i1.SequenceCodec<_i2.ReviewRecord>(_i2.ReviewRecord.codec)
            .sizeHint(obj.records);
    size = size + _i3.Tally.codec.sizeHint(obj.tally);
    return size;
  }
}
