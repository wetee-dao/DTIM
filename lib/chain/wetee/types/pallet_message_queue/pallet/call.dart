// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_weights/weight_v2/weight.dart' as _i4;
import '../../wetee_runtime/worker/message_origin.dart' as _i3;

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

  ReapPage reapPage({
    required _i3.MessageOrigin messageOrigin,
    required int pageIndex,
  }) {
    return ReapPage(
      messageOrigin: messageOrigin,
      pageIndex: pageIndex,
    );
  }

  ExecuteOverweight executeOverweight({
    required _i3.MessageOrigin messageOrigin,
    required int page,
    required int index,
    required _i4.Weight weightLimit,
  }) {
    return ExecuteOverweight(
      messageOrigin: messageOrigin,
      page: page,
      index: index,
      weightLimit: weightLimit,
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
        return ReapPage._decode(input);
      case 1:
        return ExecuteOverweight._decode(input);
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
      case ReapPage:
        (value as ReapPage).encodeTo(output);
        break;
      case ExecuteOverweight:
        (value as ExecuteOverweight).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case ReapPage:
        return (value as ReapPage)._sizeHint();
      case ExecuteOverweight:
        return (value as ExecuteOverweight)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::reap_page`].
class ReapPage extends Call {
  const ReapPage({
    required this.messageOrigin,
    required this.pageIndex,
  });

  factory ReapPage._decode(_i1.Input input) {
    return ReapPage(
      messageOrigin: _i3.MessageOrigin.codec.decode(input),
      pageIndex: _i1.U32Codec.codec.decode(input),
    );
  }

  /// MessageOriginOf<T>
  final _i3.MessageOrigin messageOrigin;

  /// PageIndex
  final int pageIndex;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'reap_page': {
          'messageOrigin': messageOrigin.toJson(),
          'pageIndex': pageIndex,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MessageOrigin.codec.sizeHint(messageOrigin);
    size = size + _i1.U32Codec.codec.sizeHint(pageIndex);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.MessageOrigin.codec.encodeTo(
      messageOrigin,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      pageIndex,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ReapPage &&
          other.messageOrigin == messageOrigin &&
          other.pageIndex == pageIndex;

  @override
  int get hashCode => Object.hash(
        messageOrigin,
        pageIndex,
      );
}

/// See [`Pallet::execute_overweight`].
class ExecuteOverweight extends Call {
  const ExecuteOverweight({
    required this.messageOrigin,
    required this.page,
    required this.index,
    required this.weightLimit,
  });

  factory ExecuteOverweight._decode(_i1.Input input) {
    return ExecuteOverweight(
      messageOrigin: _i3.MessageOrigin.codec.decode(input),
      page: _i1.U32Codec.codec.decode(input),
      index: _i1.U32Codec.codec.decode(input),
      weightLimit: _i4.Weight.codec.decode(input),
    );
  }

  /// MessageOriginOf<T>
  final _i3.MessageOrigin messageOrigin;

  /// PageIndex
  final int page;

  /// T::Size
  final int index;

  /// Weight
  final _i4.Weight weightLimit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'execute_overweight': {
          'messageOrigin': messageOrigin.toJson(),
          'page': page,
          'index': index,
          'weightLimit': weightLimit.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.MessageOrigin.codec.sizeHint(messageOrigin);
    size = size + _i1.U32Codec.codec.sizeHint(page);
    size = size + _i1.U32Codec.codec.sizeHint(index);
    size = size + _i4.Weight.codec.sizeHint(weightLimit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i3.MessageOrigin.codec.encodeTo(
      messageOrigin,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      page,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      index,
      output,
    );
    _i4.Weight.codec.encodeTo(
      weightLimit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ExecuteOverweight &&
          other.messageOrigin == messageOrigin &&
          other.page == page &&
          other.index == index &&
          other.weightLimit == weightLimit;

  @override
  int get hashCode => Object.hash(
        messageOrigin,
        page,
        index,
        weightLimit,
      );
}
