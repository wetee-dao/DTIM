// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Page is not reapable because it has items remaining to be processed and is not old
  /// enough.
  notReapable('NotReapable', 0),

  /// Page to be reaped does not exist.
  noPage('NoPage', 1),

  /// The referenced message could not be found.
  noMessage('NoMessage', 2),

  /// The message was already processed and cannot be processed again.
  alreadyProcessed('AlreadyProcessed', 3),

  /// The message is queued for future execution.
  queued('Queued', 4),

  /// There is temporarily not enough weight to continue servicing messages.
  insufficientWeight('InsufficientWeight', 5),

  /// This message is temporarily unprocessable.
  ///
  /// Such errors are expected, but not guaranteed, to resolve themselves eventually through
  /// retrying.
  temporarilyUnprocessable('TemporarilyUnprocessable', 6),

  /// The queue is paused and no message can be executed from it.
  ///
  /// This can change at any time and may resolve in the future by re-trying.
  queuePaused('QueuePaused', 7);

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
        return Error.notReapable;
      case 1:
        return Error.noPage;
      case 2:
        return Error.noMessage;
      case 3:
        return Error.alreadyProcessed;
      case 4:
        return Error.queued;
      case 5:
        return Error.insufficientWeight;
      case 6:
        return Error.temporarilyUnprocessable;
      case 7:
        return Error.queuePaused;
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
