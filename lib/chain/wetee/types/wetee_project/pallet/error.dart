// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  inVailCall('InVailCall', 0),
  tooManyMembers('TooManyMembers', 1),
  projectCreateError('ProjectCreateError', 2),
  project403('Project403', 3),
  alreadyAssignee('AlreadyAssignee', 4),
  notAssignee('NotAssignee', 5),
  notReviewer('NotReviewer', 6),
  alreadyReviewer('AlreadyReviewer', 7),
  tooManyAssignee('TooManyAssignee', 8),
  taskIsStared('TaskIsStared', 9),
  noReviewer('NoReviewer', 10),
  repeatReview('RepeatReview', 11),
  reviewPending('ReviewPending', 12),
  badDaoOrigin('BadDaoOrigin', 13);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.inVailCall;
      case 1:
        return Error.tooManyMembers;
      case 2:
        return Error.projectCreateError;
      case 3:
        return Error.project403;
      case 4:
        return Error.alreadyAssignee;
      case 5:
        return Error.notAssignee;
      case 6:
        return Error.notReviewer;
      case 7:
        return Error.alreadyReviewer;
      case 8:
        return Error.tooManyAssignee;
      case 9:
        return Error.taskIsStared;
      case 10:
        return Error.noReviewer;
      case 11:
        return Error.repeatReview;
      case 12:
        return Error.reviewPending;
      case 13:
        return Error.badDaoOrigin;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
