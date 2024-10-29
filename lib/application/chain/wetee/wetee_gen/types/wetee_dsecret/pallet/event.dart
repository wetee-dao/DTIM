// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../sp_runtime/multi_signature.dart' as _i4;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

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

class $Event {
  const $Event();

  NodeRegister nodeRegister({required _i3.AccountId32 node}) {
    return NodeRegister(node: node);
  }

  CodeUpdated codeUpdated({
    required List<int> signature,
    required List<int> signer,
  }) {
    return CodeUpdated(
      signature: signature,
      signer: signer,
    );
  }

  ClusterProofUpload clusterProofUpload({
    required BigInt cid,
    required List<int> report,
    required List<_i3.AccountId32> pubs,
    required List<_i4.MultiSignature> sigs,
  }) {
    return ClusterProofUpload(
      cid: cid,
      report: report,
      pubs: pubs,
      sigs: sigs,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return NodeRegister._decode(input);
      case 1:
        return CodeUpdated._decode(input);
      case 2:
        return ClusterProofUpload._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case NodeRegister:
        (value as NodeRegister).encodeTo(output);
        break;
      case CodeUpdated:
        (value as CodeUpdated).encodeTo(output);
        break;
      case ClusterProofUpload:
        (value as ClusterProofUpload).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case NodeRegister:
        return (value as NodeRegister)._sizeHint();
      case CodeUpdated:
        return (value as CodeUpdated)._sizeHint();
      case ClusterProofUpload:
        return (value as ClusterProofUpload)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class NodeRegister extends Event {
  const NodeRegister({required this.node});

  factory NodeRegister._decode(_i1.Input input) {
    return NodeRegister(node: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i3.AccountId32 node;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'NodeRegister': {'node': node.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(node);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      node,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NodeRegister &&
          _i5.listsEqual(
            other.node,
            node,
          );

  @override
  int get hashCode => node.hashCode;
}

class CodeUpdated extends Event {
  const CodeUpdated({
    required this.signature,
    required this.signer,
  });

  factory CodeUpdated._decode(_i1.Input input) {
    return CodeUpdated(
      signature: _i1.U8SequenceCodec.codec.decode(input),
      signer: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> signature;

  /// Vec<u8>
  final List<int> signer;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'CodeUpdated': {
          'signature': signature,
          'signer': signer,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(signature);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(signer);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      signature,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      signer,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CodeUpdated &&
          _i5.listsEqual(
            other.signature,
            signature,
          ) &&
          _i5.listsEqual(
            other.signer,
            signer,
          );

  @override
  int get hashCode => Object.hash(
        signature,
        signer,
      );
}

class ClusterProofUpload extends Event {
  const ClusterProofUpload({
    required this.cid,
    required this.report,
    required this.pubs,
    required this.sigs,
  });

  factory ClusterProofUpload._decode(_i1.Input input) {
    return ClusterProofUpload(
      cid: _i1.U64Codec.codec.decode(input),
      report: _i1.U8SequenceCodec.codec.decode(input),
      pubs: const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
          .decode(input),
      sigs:
          const _i1.SequenceCodec<_i4.MultiSignature>(_i4.MultiSignature.codec)
              .decode(input),
    );
  }

  /// ClusterId
  final BigInt cid;

  /// Vec<u8>
  final List<int> report;

  /// Vec<T::AccountId>
  final List<_i3.AccountId32> pubs;

  /// Vec<T::OffchainSignature>
  final List<_i4.MultiSignature> sigs;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'ClusterProofUpload': {
          'cid': cid,
          'report': report,
          'pubs': pubs.map((value) => value.toList()).toList(),
          'sigs': sigs.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(cid);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(report);
    size = size +
        const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec())
            .sizeHint(pubs);
    size = size +
        const _i1.SequenceCodec<_i4.MultiSignature>(_i4.MultiSignature.codec)
            .sizeHint(sigs);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      cid,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      report,
      output,
    );
    const _i1.SequenceCodec<_i3.AccountId32>(_i3.AccountId32Codec()).encodeTo(
      pubs,
      output,
    );
    const _i1.SequenceCodec<_i4.MultiSignature>(_i4.MultiSignature.codec)
        .encodeTo(
      sigs,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ClusterProofUpload &&
          other.cid == cid &&
          _i5.listsEqual(
            other.report,
            report,
          ) &&
          _i5.listsEqual(
            other.pubs,
            pubs,
          ) &&
          _i5.listsEqual(
            other.sigs,
            sigs,
          );

  @override
  int get hashCode => Object.hash(
        cid,
        report,
        pubs,
        sigs,
      );
}
