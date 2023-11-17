// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class Page {
  const Page({
    required this.remaining,
    required this.remainingSize,
    required this.firstIndex,
    required this.first,
    required this.last,
    required this.heap,
  });

  factory Page.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Size
  final int remaining;

  /// Size
  final int remainingSize;

  /// Size
  final int firstIndex;

  /// Size
  final int first;

  /// Size
  final int last;

  /// BoundedVec<u8, IntoU32<HeapSize, Size>>
  final List<int> heap;

  static const $PageCodec codec = $PageCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'remaining': remaining,
        'remainingSize': remainingSize,
        'firstIndex': firstIndex,
        'first': first,
        'last': last,
        'heap': heap,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Page &&
          other.remaining == remaining &&
          other.remainingSize == remainingSize &&
          other.firstIndex == firstIndex &&
          other.first == first &&
          other.last == last &&
          _i3.listsEqual(
            other.heap,
            heap,
          );

  @override
  int get hashCode => Object.hash(
        remaining,
        remainingSize,
        firstIndex,
        first,
        last,
        heap,
      );
}

class $PageCodec with _i1.Codec<Page> {
  const $PageCodec();

  @override
  void encodeTo(
    Page obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.remaining,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.remainingSize,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.firstIndex,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.first,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.last,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.heap,
      output,
    );
  }

  @override
  Page decode(_i1.Input input) {
    return Page(
      remaining: _i1.U32Codec.codec.decode(input),
      remainingSize: _i1.U32Codec.codec.decode(input),
      firstIndex: _i1.U32Codec.codec.decode(input),
      first: _i1.U32Codec.codec.decode(input),
      last: _i1.U32Codec.codec.decode(input),
      heap: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Page obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.remaining);
    size = size + _i1.U32Codec.codec.sizeHint(obj.remainingSize);
    size = size + _i1.U32Codec.codec.sizeHint(obj.firstIndex);
    size = size + _i1.U32Codec.codec.sizeHint(obj.first);
    size = size + _i1.U32Codec.codec.sizeHint(obj.last);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.heap);
    return size;
  }
}
