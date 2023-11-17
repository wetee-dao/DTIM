// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_consensus_grandpa/equivocation_proof.dart' as _i3;
import '../../sp_core/void.dart' as _i4;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  ReportEquivocation reportEquivocation({
    required _i3.EquivocationProof equivocationProof,
    required _i4.Void keyOwnerProof,
  }) {
    return ReportEquivocation(
      equivocationProof: equivocationProof,
      keyOwnerProof: keyOwnerProof,
    );
  }

  ReportEquivocationUnsigned reportEquivocationUnsigned({
    required _i3.EquivocationProof equivocationProof,
    required _i4.Void keyOwnerProof,
  }) {
    return ReportEquivocationUnsigned(
      equivocationProof: equivocationProof,
      keyOwnerProof: keyOwnerProof,
    );
  }

  NoteStalled noteStalled({
    required BigInt delay,
    required BigInt bestFinalizedBlockNumber,
  }) {
    return NoteStalled(
      delay: delay,
      bestFinalizedBlockNumber: bestFinalizedBlockNumber,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ReportEquivocation._decode(input);
      case 1:
        return ReportEquivocationUnsigned._decode(input);
      case 2:
        return NoteStalled._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case ReportEquivocation:
        (value as ReportEquivocation).encodeTo(output);
        break;
      case ReportEquivocationUnsigned:
        (value as ReportEquivocationUnsigned).encodeTo(output);
        break;
      case NoteStalled:
        (value as NoteStalled).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case ReportEquivocation:
        return (value as ReportEquivocation)._sizeHint();
      case ReportEquivocationUnsigned:
        return (value as ReportEquivocationUnsigned)._sizeHint();
      case NoteStalled:
        return (value as NoteStalled)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::report_equivocation`].
class ReportEquivocation extends Call {
  const ReportEquivocation({
    required this.equivocationProof,
    required this.keyOwnerProof,
  });

  factory ReportEquivocation._decode(_i1.Input input) {
    return ReportEquivocation(
      equivocationProof: _i3.EquivocationProof.codec.decode(input),
      keyOwnerProof: _i1.NullCodec.codec.decode(input),
    );
  }

  /// Box<EquivocationProof<T::Hash, BlockNumberFor<T>>>
  final _i3.EquivocationProof equivocationProof;

  /// T::KeyOwnerProof
  final _i4.Void keyOwnerProof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'report_equivocation': {
          'equivocationProof': equivocationProof.toJson(),
          'keyOwnerProof': null,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.EquivocationProof.codec.sizeHint(equivocationProof);
    size = size + const _i4.VoidCodec().sizeHint(keyOwnerProof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.EquivocationProof.codec.encodeTo(
      equivocationProof,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      keyOwnerProof,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReportEquivocation &&
          other.equivocationProof == equivocationProof &&
          other.keyOwnerProof == keyOwnerProof;

  @override
  int get hashCode => Object.hash(
        equivocationProof,
        keyOwnerProof,
      );
}

/// See [`Pallet::report_equivocation_unsigned`].
class ReportEquivocationUnsigned extends Call {
  const ReportEquivocationUnsigned({
    required this.equivocationProof,
    required this.keyOwnerProof,
  });

  factory ReportEquivocationUnsigned._decode(_i1.Input input) {
    return ReportEquivocationUnsigned(
      equivocationProof: _i3.EquivocationProof.codec.decode(input),
      keyOwnerProof: _i1.NullCodec.codec.decode(input),
    );
  }

  /// Box<EquivocationProof<T::Hash, BlockNumberFor<T>>>
  final _i3.EquivocationProof equivocationProof;

  /// T::KeyOwnerProof
  final _i4.Void keyOwnerProof;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'report_equivocation_unsigned': {
          'equivocationProof': equivocationProof.toJson(),
          'keyOwnerProof': null,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.EquivocationProof.codec.sizeHint(equivocationProof);
    size = size + const _i4.VoidCodec().sizeHint(keyOwnerProof);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i3.EquivocationProof.codec.encodeTo(
      equivocationProof,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      keyOwnerProof,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReportEquivocationUnsigned &&
          other.equivocationProof == equivocationProof &&
          other.keyOwnerProof == keyOwnerProof;

  @override
  int get hashCode => Object.hash(
        equivocationProof,
        keyOwnerProof,
      );
}

/// See [`Pallet::note_stalled`].
class NoteStalled extends Call {
  const NoteStalled({
    required this.delay,
    required this.bestFinalizedBlockNumber,
  });

  factory NoteStalled._decode(_i1.Input input) {
    return NoteStalled(
      delay: _i1.U64Codec.codec.decode(input),
      bestFinalizedBlockNumber: _i1.U64Codec.codec.decode(input),
    );
  }

  /// BlockNumberFor<T>
  final BigInt delay;

  /// BlockNumberFor<T>
  final BigInt bestFinalizedBlockNumber;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'note_stalled': {
          'delay': delay,
          'bestFinalizedBlockNumber': bestFinalizedBlockNumber,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(delay);
    size = size + _i1.U64Codec.codec.sizeHint(bestFinalizedBlockNumber);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      delay,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      bestFinalizedBlockNumber,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NoteStalled &&
          other.delay == delay &&
          other.bestFinalizedBlockNumber == bestFinalizedBlockNumber;

  @override
  int get hashCode => Object.hash(
        delay,
        bestFinalizedBlockNumber,
      );
}
