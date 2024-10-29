// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import 'ip.dart' as _i2;

class P2PAddr {
  const P2PAddr({
    required this.ip,
    required this.port,
    required this.id,
  });

  factory P2PAddr.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Ip
  final _i2.Ip ip;

  /// u16
  final int port;

  /// AccountId
  final _i3.AccountId32 id;

  static const $P2PAddrCodec codec = $P2PAddrCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'ip': ip.toJson(),
        'port': port,
        'id': id.toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is P2PAddr &&
          other.ip == ip &&
          other.port == port &&
          _i5.listsEqual(
            other.id,
            id,
          );

  @override
  int get hashCode => Object.hash(
        ip,
        port,
        id,
      );
}

class $P2PAddrCodec with _i1.Codec<P2PAddr> {
  const $P2PAddrCodec();

  @override
  void encodeTo(
    P2PAddr obj,
    _i1.Output output,
  ) {
    _i2.Ip.codec.encodeTo(
      obj.ip,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.port,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.id,
      output,
    );
  }

  @override
  P2PAddr decode(_i1.Input input) {
    return P2PAddr(
      ip: _i2.Ip.codec.decode(input),
      port: _i1.U16Codec.codec.decode(input),
      id: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  @override
  int sizeHint(P2PAddr obj) {
    int size = 0;
    size = size + _i2.Ip.codec.sizeHint(obj.ip);
    size = size + _i1.U16Codec.codec.sizeHint(obj.port);
    size = size + const _i3.AccountId32Codec().sizeHint(obj.id);
    return size;
  }
}
