// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_consensus_grandpa/app/public.dart' as _i3;
import '../tuples_1.dart' as _i2;

class StoredPendingChange {
  const StoredPendingChange({
    required this.scheduledAt,
    required this.delay,
    required this.nextAuthorities,
    this.forced,
  });

  factory StoredPendingChange.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// N
  final BigInt scheduledAt;

  /// N
  final BigInt delay;

  /// BoundedAuthorityList<Limit>
  final List<_i2.Tuple2<_i3.Public, BigInt>> nextAuthorities;

  /// Option<N>
  final BigInt? forced;

  static const $StoredPendingChangeCodec codec = $StoredPendingChangeCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'scheduledAt': scheduledAt,
        'delay': delay,
        'nextAuthorities': nextAuthorities
            .map((value) => [
                  value.value0.toList(),
                  value.value1,
                ])
            .toList(),
        'forced': forced,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is StoredPendingChange &&
          other.scheduledAt == scheduledAt &&
          other.delay == delay &&
          _i5.listsEqual(
            other.nextAuthorities,
            nextAuthorities,
          ) &&
          other.forced == forced;

  @override
  int get hashCode => Object.hash(
        scheduledAt,
        delay,
        nextAuthorities,
        forced,
      );
}

class $StoredPendingChangeCodec with _i1.Codec<StoredPendingChange> {
  const $StoredPendingChangeCodec();

  @override
  void encodeTo(
    StoredPendingChange obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.scheduledAt,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.delay,
      output,
    );
    const _i1.SequenceCodec<_i2.Tuple2<_i3.Public, BigInt>>(
        _i2.Tuple2Codec<_i3.Public, BigInt>(
      _i3.PublicCodec(),
      _i1.U64Codec.codec,
    )).encodeTo(
      obj.nextAuthorities,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).encodeTo(
      obj.forced,
      output,
    );
  }

  @override
  StoredPendingChange decode(_i1.Input input) {
    return StoredPendingChange(
      scheduledAt: _i1.U64Codec.codec.decode(input),
      delay: _i1.U64Codec.codec.decode(input),
      nextAuthorities: const _i1.SequenceCodec<_i2.Tuple2<_i3.Public, BigInt>>(
          _i2.Tuple2Codec<_i3.Public, BigInt>(
        _i3.PublicCodec(),
        _i1.U64Codec.codec,
      )).decode(input),
      forced: const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).decode(input),
    );
  }

  @override
  int sizeHint(StoredPendingChange obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.scheduledAt);
    size = size + _i1.U64Codec.codec.sizeHint(obj.delay);
    size = size +
        const _i1.SequenceCodec<_i2.Tuple2<_i3.Public, BigInt>>(
            _i2.Tuple2Codec<_i3.Public, BigInt>(
          _i3.PublicCodec(),
          _i1.U64Codec.codec,
        )).sizeHint(obj.nextAuthorities);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.U64Codec.codec).sizeHint(obj.forced);
    return size;
  }
}
