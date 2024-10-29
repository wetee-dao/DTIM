// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

abstract class Service {
  const Service();

  factory Service.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $ServiceCodec codec = $ServiceCodec();

  static const $Service values = $Service();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, int> toJson();
}

class $Service {
  const $Service();

  Tcp tcp(int value0) {
    return Tcp(value0);
  }

  Udp udp(int value0) {
    return Udp(value0);
  }

  Https https(int value0) {
    return Https(value0);
  }

  ProjectTcp projectTcp(int value0) {
    return ProjectTcp(value0);
  }

  ProjectUdp projectUdp(int value0) {
    return ProjectUdp(value0);
  }
}

class $ServiceCodec with _i1.Codec<Service> {
  const $ServiceCodec();

  @override
  Service decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Tcp._decode(input);
      case 1:
        return Udp._decode(input);
      case 2:
        return Https._decode(input);
      case 3:
        return ProjectTcp._decode(input);
      case 4:
        return ProjectUdp._decode(input);
      default:
        throw Exception('Service: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Service value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Tcp:
        (value as Tcp).encodeTo(output);
        break;
      case Udp:
        (value as Udp).encodeTo(output);
        break;
      case Https:
        (value as Https).encodeTo(output);
        break;
      case ProjectTcp:
        (value as ProjectTcp).encodeTo(output);
        break;
      case ProjectUdp:
        (value as ProjectUdp).encodeTo(output);
        break;
      default:
        throw Exception(
            'Service: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Service value) {
    switch (value.runtimeType) {
      case Tcp:
        return (value as Tcp)._sizeHint();
      case Udp:
        return (value as Udp)._sizeHint();
      case Https:
        return (value as Https)._sizeHint();
      case ProjectTcp:
        return (value as ProjectTcp)._sizeHint();
      case ProjectUdp:
        return (value as ProjectUdp)._sizeHint();
      default:
        throw Exception(
            'Service: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Tcp extends Service {
  const Tcp(this.value0);

  factory Tcp._decode(_i1.Input input) {
    return Tcp(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'Tcp': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Tcp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Udp extends Service {
  const Udp(this.value0);

  factory Udp._decode(_i1.Input input) {
    return Udp(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'Udp': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Udp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Https extends Service {
  const Https(this.value0);

  factory Https._decode(_i1.Input input) {
    return Https(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'Https': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Https && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class ProjectTcp extends Service {
  const ProjectTcp(this.value0);

  factory ProjectTcp._decode(_i1.Input input) {
    return ProjectTcp(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'ProjectTcp': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProjectTcp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class ProjectUdp extends Service {
  const ProjectUdp(this.value0);

  factory ProjectUdp._decode(_i1.Input input) {
    return ProjectUdp(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'ProjectUdp': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ProjectUdp && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
