// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Attempt to signal GRANDPA pause when the authority set isn't live
  /// (either paused or already pending pause).
  pauseFailed('PauseFailed', 0),

  /// Attempt to signal GRANDPA resume when the authority set isn't paused
  /// (either live or already pending resume).
  resumeFailed('ResumeFailed', 1),

  /// Attempt to signal GRANDPA change with one already pending.
  changePending('ChangePending', 2),

  /// Cannot signal forced change so soon after last.
  tooSoon('TooSoon', 3),

  /// A key ownership proof provided as part of an equivocation report is invalid.
  invalidKeyOwnershipProof('InvalidKeyOwnershipProof', 4),

  /// An equivocation proof provided as part of an equivocation report is invalid.
  invalidEquivocationProof('InvalidEquivocationProof', 5),

  /// A given equivocation report is valid but already previously reported.
  duplicateOffenceReport('DuplicateOffenceReport', 6);

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
        return Error.pauseFailed;
      case 1:
        return Error.resumeFailed;
      case 2:
        return Error.changePending;
      case 3:
        return Error.tooSoon;
      case 4:
        return Error.invalidKeyOwnershipProof;
      case 5:
        return Error.invalidEquivocationProof;
      case 6:
        return Error.duplicateOffenceReport;
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
