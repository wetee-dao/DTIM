// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i6;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../wetee_runtime/runtime_call.dart' as _i2;
import 'memmber_data.dart' as _i4;
import 'prop_status.dart' as _i5;
import 'tally.dart' as _i3;

class Prop {
  const Prop({
    required this.id,
    required this.proposal,
    required this.start,
    required this.periodIndex,
    required this.tally,
    required this.memberData,
    required this.status,
  });

  factory Prop.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// PropIndex
  final int id;

  /// Call
  final _i2.RuntimeCall proposal;

  /// BlockNumber
  final BigInt start;

  /// u32
  final int periodIndex;

  /// Tally<Balance>
  final _i3.Tally tally;

  /// MemmberData
  final _i4.MemmberData memberData;

  /// PropStatus
  final _i5.PropStatus status;

  static const $PropCodec codec = $PropCodec();

  _i6.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'proposal': proposal.toJson(),
        'start': start,
        'periodIndex': periodIndex,
        'tally': tally.toJson(),
        'memberData': memberData.toJson(),
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Prop &&
          other.id == id &&
          other.proposal == proposal &&
          other.start == start &&
          other.periodIndex == periodIndex &&
          other.tally == tally &&
          other.memberData == memberData &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        proposal,
        start,
        periodIndex,
        tally,
        memberData,
        status,
      );
}

class $PropCodec with _i1.Codec<Prop> {
  const $PropCodec();

  @override
  void encodeTo(
    Prop obj,
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
      obj.start,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.periodIndex,
      output,
    );
    _i3.Tally.codec.encodeTo(
      obj.tally,
      output,
    );
    _i4.MemmberData.codec.encodeTo(
      obj.memberData,
      output,
    );
    _i5.PropStatus.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  Prop decode(_i1.Input input) {
    return Prop(
      id: _i1.U32Codec.codec.decode(input),
      proposal: _i2.RuntimeCall.codec.decode(input),
      start: _i1.U64Codec.codec.decode(input),
      periodIndex: _i1.U32Codec.codec.decode(input),
      tally: _i3.Tally.codec.decode(input),
      memberData: _i4.MemmberData.codec.decode(input),
      status: _i5.PropStatus.codec.decode(input),
    );
  }

  @override
  int sizeHint(Prop obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.id);
    size = size + _i2.RuntimeCall.codec.sizeHint(obj.proposal);
    size = size + _i1.U64Codec.codec.sizeHint(obj.start);
    size = size + _i1.U32Codec.codec.sizeHint(obj.periodIndex);
    size = size + _i3.Tally.codec.sizeHint(obj.tally);
    size = size + _i4.MemmberData.codec.sizeHint(obj.memberData);
    size = size + _i5.PropStatus.codec.sizeHint(obj.status);
    return size;
  }
}
