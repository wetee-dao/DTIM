// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Ip {
  const Ip({
    this.ipv4,
    this.ipv6,
    this.domain,
  });

  factory Ip.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Option<u32>
  final int? ipv4;

  /// Option<u128>
  final BigInt? ipv6;

  /// Option<Vec<u8>>
  final List<int>? domain;

  static const $IpCodec codec = $IpCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'ipv4': ipv4,
        'ipv6': ipv6,
        'domain': domain,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Ip &&
          other.ipv4 == ipv4 &&
          other.ipv6 == ipv6 &&
          other.domain == domain;

  @override
  int get hashCode => Object.hash(
        ipv4,
        ipv6,
        domain,
      );
}

class $IpCodec with _i1.Codec<Ip> {
  const $IpCodec();

  @override
  void encodeTo(
    Ip obj,
    _i1.Output output,
  ) {
    const _i1.OptionCodec<int>(_i1.U32Codec.codec).encodeTo(
      obj.ipv4,
      output,
    );
    const _i1.OptionCodec<BigInt>(_i1.U128Codec.codec).encodeTo(
      obj.ipv6,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      obj.domain,
      output,
    );
  }

  @override
  Ip decode(_i1.Input input) {
    return Ip(
      ipv4: const _i1.OptionCodec<int>(_i1.U32Codec.codec).decode(input),
      ipv6: const _i1.OptionCodec<BigInt>(_i1.U128Codec.codec).decode(input),
      domain: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
    );
  }

  @override
  int sizeHint(Ip obj) {
    int size = 0;
    size = size +
        const _i1.OptionCodec<int>(_i1.U32Codec.codec).sizeHint(obj.ipv4);
    size = size +
        const _i1.OptionCodec<BigInt>(_i1.U128Codec.codec).sizeHint(obj.ipv6);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(obj.domain);
    return size;
  }
}
