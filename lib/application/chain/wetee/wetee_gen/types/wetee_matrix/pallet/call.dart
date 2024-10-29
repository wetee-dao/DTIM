// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../status.dart' as _i3;

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

  CreateNode createNode({
    required List<int> name,
    required List<int> desc,
    required List<int> purpose,
    required List<int> metaData,
    required List<int> imApi,
    required List<int> bg,
    required List<int> logo,
    required List<int> img,
    required List<int> homeUrl,
  }) {
    return CreateNode(
      name: name,
      desc: desc,
      purpose: purpose,
      metaData: metaData,
      imApi: imApi,
      bg: bg,
      logo: logo,
      img: img,
      homeUrl: homeUrl,
    );
  }

  UpdateNode updateNode({
    required BigInt nodeId,
    List<int>? name,
    List<int>? desc,
    List<int>? purpose,
    List<int>? metaData,
    List<int>? imApi,
    List<int>? bg,
    List<int>? logo,
    List<int>? img,
    List<int>? homeUrl,
    _i3.Status? status,
  }) {
    return UpdateNode(
      nodeId: nodeId,
      name: name,
      desc: desc,
      purpose: purpose,
      metaData: metaData,
      imApi: imApi,
      bg: bg,
      logo: logo,
      img: img,
      homeUrl: homeUrl,
      status: status,
    );
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return CreateNode._decode(input);
      case 2:
        return UpdateNode._decode(input);
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
      case CreateNode:
        (value as CreateNode).encodeTo(output);
        break;
      case UpdateNode:
        (value as UpdateNode).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case CreateNode:
        return (value as CreateNode)._sizeHint();
      case UpdateNode:
        return (value as UpdateNode)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// Create a N o de
/// 从一个通证池,创建一个节点
class CreateNode extends Call {
  const CreateNode({
    required this.name,
    required this.desc,
    required this.purpose,
    required this.metaData,
    required this.imApi,
    required this.bg,
    required this.logo,
    required this.img,
    required this.homeUrl,
  });

  factory CreateNode._decode(_i1.Input input) {
    return CreateNode(
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      purpose: _i1.U8SequenceCodec.codec.decode(input),
      metaData: _i1.U8SequenceCodec.codec.decode(input),
      imApi: _i1.U8SequenceCodec.codec.decode(input),
      bg: _i1.U8SequenceCodec.codec.decode(input),
      logo: _i1.U8SequenceCodec.codec.decode(input),
      img: _i1.U8SequenceCodec.codec.decode(input),
      homeUrl: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> purpose;

  /// Vec<u8>
  final List<int> metaData;

  /// Vec<u8>
  final List<int> imApi;

  /// Vec<u8>
  final List<int> bg;

  /// Vec<u8>
  final List<int> logo;

  /// Vec<u8>
  final List<int> img;

  /// Vec<u8>
  final List<int> homeUrl;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'create_node': {
          'name': name,
          'desc': desc,
          'purpose': purpose,
          'metaData': metaData,
          'imApi': imApi,
          'bg': bg,
          'logo': logo,
          'img': img,
          'homeUrl': homeUrl,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(purpose);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(metaData);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(imApi);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(bg);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(logo);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(img);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(homeUrl);
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
      desc,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      purpose,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      metaData,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      imApi,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      bg,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      logo,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      img,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      homeUrl,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateNode &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.desc,
            desc,
          ) &&
          _i4.listsEqual(
            other.purpose,
            purpose,
          ) &&
          _i4.listsEqual(
            other.metaData,
            metaData,
          ) &&
          _i4.listsEqual(
            other.imApi,
            imApi,
          ) &&
          _i4.listsEqual(
            other.bg,
            bg,
          ) &&
          _i4.listsEqual(
            other.logo,
            logo,
          ) &&
          _i4.listsEqual(
            other.img,
            img,
          ) &&
          _i4.listsEqual(
            other.homeUrl,
            homeUrl,
          );

  @override
  int get hashCode => Object.hash(
        name,
        desc,
        purpose,
        metaData,
        imApi,
        bg,
        logo,
        img,
        homeUrl,
      );
}

/// update node info
/// 更新节点信息
class UpdateNode extends Call {
  const UpdateNode({
    required this.nodeId,
    this.name,
    this.desc,
    this.purpose,
    this.metaData,
    this.imApi,
    this.bg,
    this.logo,
    this.img,
    this.homeUrl,
    this.status,
  });

  factory UpdateNode._decode(_i1.Input input) {
    return UpdateNode(
      nodeId: _i1.U128Codec.codec.decode(input),
      name: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      desc: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      purpose: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      metaData: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      imApi: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      bg: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      logo: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      img: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      homeUrl: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      status: const _i1.OptionCodec<_i3.Status>(_i3.Status.codec).decode(input),
    );
  }

  /// u128
  final BigInt nodeId;

  /// Option<Vec<u8>>
  final List<int>? name;

  /// Option<Vec<u8>>
  final List<int>? desc;

  /// Option<Vec<u8>>
  final List<int>? purpose;

  /// Option<Vec<u8>>
  final List<int>? metaData;

  /// Option<Vec<u8>>
  final List<int>? imApi;

  /// Option<Vec<u8>>
  final List<int>? bg;

  /// Option<Vec<u8>>
  final List<int>? logo;

  /// Option<Vec<u8>>
  final List<int>? img;

  /// Option<Vec<u8>>
  final List<int>? homeUrl;

  /// Option<Status>
  final _i3.Status? status;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update_node': {
          'nodeId': nodeId,
          'name': name,
          'desc': desc,
          'purpose': purpose,
          'metaData': metaData,
          'imApi': imApi,
          'bg': bg,
          'logo': logo,
          'img': img,
          'homeUrl': homeUrl,
          'status': status?.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(nodeId);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(name);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(desc);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(purpose);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(metaData);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(imApi);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(bg);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(logo);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(img);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(homeUrl);
    size = size +
        const _i1.OptionCodec<_i3.Status>(_i3.Status.codec).sizeHint(status);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      nodeId,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      name,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      desc,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      purpose,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      metaData,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      imApi,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      bg,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      logo,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      img,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      homeUrl,
      output,
    );
    const _i1.OptionCodec<_i3.Status>(_i3.Status.codec).encodeTo(
      status,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateNode &&
          other.nodeId == nodeId &&
          other.name == name &&
          other.desc == desc &&
          other.purpose == purpose &&
          other.metaData == metaData &&
          other.imApi == imApi &&
          other.bg == bg &&
          other.logo == logo &&
          other.img == img &&
          other.homeUrl == homeUrl &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        nodeId,
        name,
        desc,
        purpose,
        metaData,
        imApi,
        bg,
        logo,
        img,
        homeUrl,
        status,
      );
}
