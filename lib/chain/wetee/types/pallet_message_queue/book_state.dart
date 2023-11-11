// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'neighbours.dart' as _i2;

class BookState {
  const BookState({
    required this.begin,
    required this.end,
    required this.count,
    this.readyNeighbours,
    required this.messageCount,
    required this.size,
  });

  factory BookState.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// PageIndex
  final int begin;

  /// PageIndex
  final int end;

  /// PageIndex
  final int count;

  /// Option<Neighbours<MessageOrigin>>
  final _i2.Neighbours? readyNeighbours;

  /// u64
  final BigInt messageCount;

  /// u64
  final BigInt size;

  static const $BookStateCodec codec = $BookStateCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'begin': begin,
        'end': end,
        'count': count,
        'readyNeighbours': readyNeighbours?.toJson(),
        'messageCount': messageCount,
        'size': size,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is BookState &&
          other.begin == begin &&
          other.end == end &&
          other.count == count &&
          other.readyNeighbours == readyNeighbours &&
          other.messageCount == messageCount &&
          other.size == size;

  @override
  int get hashCode => Object.hash(
        begin,
        end,
        count,
        readyNeighbours,
        messageCount,
        size,
      );
}

class $BookStateCodec with _i1.Codec<BookState> {
  const $BookStateCodec();

  @override
  void encodeTo(
    BookState obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.begin,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.end,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.count,
      output,
    );
    const _i1.OptionCodec<_i2.Neighbours>(_i2.Neighbours.codec).encodeTo(
      obj.readyNeighbours,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.messageCount,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.size,
      output,
    );
  }

  @override
  BookState decode(_i1.Input input) {
    return BookState(
      begin: _i1.U32Codec.codec.decode(input),
      end: _i1.U32Codec.codec.decode(input),
      count: _i1.U32Codec.codec.decode(input),
      readyNeighbours:
          const _i1.OptionCodec<_i2.Neighbours>(_i2.Neighbours.codec)
              .decode(input),
      messageCount: _i1.U64Codec.codec.decode(input),
      size: _i1.U64Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(BookState obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.begin);
    size = size + _i1.U32Codec.codec.sizeHint(obj.end);
    size = size + _i1.U32Codec.codec.sizeHint(obj.count);
    size = size +
        const _i1.OptionCodec<_i2.Neighbours>(_i2.Neighbours.codec)
            .sizeHint(obj.readyNeighbours);
    size = size + _i1.U64Codec.codec.sizeHint(obj.messageCount);
    size = size + _i1.U64Codec.codec.sizeHint(obj.size);
    return size;
  }
}
