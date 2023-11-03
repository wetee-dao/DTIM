// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

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

  Map<String, dynamic> toJson();
}

class $Call {
  const $Call();

  ClusterRegister clusterRegister({
    required List<int> name,
    required List<int> image,
    required List<List<int>> ip,
    required List<int> port,
  }) {
    return ClusterRegister(
      name: name,
      image: image,
      ip: ip,
      port: port,
    );
  }

  ClusterMortgage clusterMortgage({
    required int cpu,
    required int mem,
    required int disk,
    required BigInt deposit,
  }) {
    return ClusterMortgage(
      cpu: cpu,
      mem: mem,
      disk: disk,
      deposit: deposit,
    );
  }

  ClusterUnmortgage clusterUnmortgage({required BigInt index}) {
    return ClusterUnmortgage(index: index);
  }

  ClusterProofUpload clusterProofUpload() {
    return ClusterProofUpload();
  }

  ClusterWithdrawal clusterWithdrawal() {
    return ClusterWithdrawal();
  }

  ClusterStop clusterStop() {
    return ClusterStop();
  }

  ClusterReport clusterReport() {
    return ClusterReport();
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return ClusterRegister._decode(input);
      case 2:
        return ClusterMortgage._decode(input);
      case 3:
        return ClusterUnmortgage._decode(input);
      case 4:
        return const ClusterProofUpload();
      case 5:
        return const ClusterWithdrawal();
      case 6:
        return const ClusterStop();
      case 7:
        return const ClusterReport();
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
      case ClusterRegister:
        (value as ClusterRegister).encodeTo(output);
        break;
      case ClusterMortgage:
        (value as ClusterMortgage).encodeTo(output);
        break;
      case ClusterUnmortgage:
        (value as ClusterUnmortgage).encodeTo(output);
        break;
      case ClusterProofUpload:
        (value as ClusterProofUpload).encodeTo(output);
        break;
      case ClusterWithdrawal:
        (value as ClusterWithdrawal).encodeTo(output);
        break;
      case ClusterStop:
        (value as ClusterStop).encodeTo(output);
        break;
      case ClusterReport:
        (value as ClusterReport).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case ClusterRegister:
        return (value as ClusterRegister)._sizeHint();
      case ClusterMortgage:
        return (value as ClusterMortgage)._sizeHint();
      case ClusterUnmortgage:
        return (value as ClusterUnmortgage)._sizeHint();
      case ClusterProofUpload:
        return 1;
      case ClusterWithdrawal:
        return 1;
      case ClusterStop:
        return 1;
      case ClusterReport:
        return 1;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::cluster_register`].
class ClusterRegister extends Call {
  const ClusterRegister({
    required this.name,
    required this.image,
    required this.ip,
    required this.port,
  });

  factory ClusterRegister._decode(_i1.Input input) {
    return ClusterRegister(
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      ip: const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<Vec<u8>>
  final List<List<int>> ip;

  /// Vec<u32>
  final List<int> port;

  @override
  Map<String, Map<String, List<dynamic>>> toJson() => {
        'cluster_register': {
          'name': name,
          'image': image,
          'ip': ip.map((value) => value).toList(),
          'port': port,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(image);
    size = size +
        const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(ip);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(port);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      image,
      output,
    );
    const _i1.SequenceCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      ip,
      output,
    );
    _i1.U32SequenceCodec.codec.encodeTo(
      port,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterRegister &&
          _i3.listsEqual(
            other.name,
            name,
          ) &&
          _i3.listsEqual(
            other.image,
            image,
          ) &&
          _i3.listsEqual(
            other.ip,
            ip,
          ) &&
          _i3.listsEqual(
            other.port,
            port,
          );

  @override
  int get hashCode => Object.hash(
        name,
        image,
        ip,
        port,
      );
}

/// See [`Pallet::cluster_mortgage`].
class ClusterMortgage extends Call {
  const ClusterMortgage({
    required this.cpu,
    required this.mem,
    required this.disk,
    required this.deposit,
  });

  factory ClusterMortgage._decode(_i1.Input input) {
    return ClusterMortgage(
      cpu: _i1.U16Codec.codec.decode(input),
      mem: _i1.U16Codec.codec.decode(input),
      disk: _i1.U16Codec.codec.decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// u16
  final int cpu;

  /// u16
  final int mem;

  /// u16
  final int disk;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'cluster_mortgage': {
          'cpu': cpu,
          'mem': mem,
          'disk': disk,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(cpu);
    size = size + _i1.U16Codec.codec.sizeHint(mem);
    size = size + _i1.U16Codec.codec.sizeHint(disk);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(deposit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      cpu,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      mem,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      disk,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      deposit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterMortgage &&
          other.cpu == cpu &&
          other.mem == mem &&
          other.disk == disk &&
          other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        cpu,
        mem,
        disk,
        deposit,
      );
}

/// See [`Pallet::cluster_unmortgage`].
class ClusterUnmortgage extends Call {
  const ClusterUnmortgage({required this.index});

  factory ClusterUnmortgage._decode(_i1.Input input) {
    return ClusterUnmortgage(index: _i1.U64Codec.codec.decode(input));
  }

  /// BlockNumberFor<T>
  final BigInt index;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'cluster_unmortgage': {'index': index}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(index);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      index,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterUnmortgage && other.index == index;

  @override
  int get hashCode => index.hashCode;
}

/// See [`Pallet::cluster_proof_upload`].
class ClusterProofUpload extends Call {
  const ClusterProofUpload();

  @override
  Map<String, dynamic> toJson() => {'cluster_proof_upload': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is ClusterProofUpload;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::cluster_withdrawal`].
class ClusterWithdrawal extends Call {
  const ClusterWithdrawal();

  @override
  Map<String, dynamic> toJson() => {'cluster_withdrawal': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is ClusterWithdrawal;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::cluster_stop`].
class ClusterStop extends Call {
  const ClusterStop();

  @override
  Map<String, dynamic> toJson() => {'cluster_stop': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is ClusterStop;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::cluster_report`].
class ClusterReport extends Call {
  const ClusterReport();

  @override
  Map<String, dynamic> toJson() => {'cluster_report': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is ClusterReport;

  @override
  int get hashCode => runtimeType.hashCode;
}
