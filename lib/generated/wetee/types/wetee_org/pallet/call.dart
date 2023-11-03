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

  CreateDao createDao({
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
    return CreateDao(
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

  UpdateDao updateDao({
    required BigInt daoId,
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
    return UpdateDao(
      daoId: daoId,
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

  CreateRoadmapTask createRoadmapTask({
    required BigInt daoId,
    required int roadmapId,
    required List<int> name,
    required int priority,
    List<int>? tags,
  }) {
    return CreateRoadmapTask(
      daoId: daoId,
      roadmapId: roadmapId,
      name: name,
      priority: priority,
      tags: tags,
    );
  }

  UpdateRoadmapTask updateRoadmapTask({
    required BigInt daoId,
    required int roadmapId,
    required BigInt taskId,
    required int priority,
    required int status,
    List<int>? tags,
  }) {
    return UpdateRoadmapTask(
      daoId: daoId,
      roadmapId: roadmapId,
      taskId: taskId,
      priority: priority,
      status: status,
      tags: tags,
    );
  }

  CreateApp createApp({
    required List<int> name,
    required List<int> desc,
    required List<int> icon,
    required List<int> url,
  }) {
    return CreateApp(
      name: name,
      desc: desc,
      icon: icon,
      url: url,
    );
  }

  UpdateAppStatus updateAppStatus({
    required BigInt appId,
    required _i3.Status status,
  }) {
    return UpdateAppStatus(
      appId: appId,
      status: status,
    );
  }

  OrgIntegrateApp orgIntegrateApp({
    required BigInt daoId,
    required BigInt appId,
  }) {
    return OrgIntegrateApp(
      daoId: daoId,
      appId: appId,
    );
  }

  UpdateOrgAppStatus updateOrgAppStatus({
    required BigInt daoId,
    required BigInt appId,
    required _i3.Status status,
  }) {
    return UpdateOrgAppStatus(
      daoId: daoId,
      appId: appId,
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
        return CreateDao._decode(input);
      case 8:
        return UpdateDao._decode(input);
      case 2:
        return CreateRoadmapTask._decode(input);
      case 3:
        return UpdateRoadmapTask._decode(input);
      case 4:
        return CreateApp._decode(input);
      case 5:
        return UpdateAppStatus._decode(input);
      case 6:
        return OrgIntegrateApp._decode(input);
      case 7:
        return UpdateOrgAppStatus._decode(input);
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
      case CreateDao:
        (value as CreateDao).encodeTo(output);
        break;
      case UpdateDao:
        (value as UpdateDao).encodeTo(output);
        break;
      case CreateRoadmapTask:
        (value as CreateRoadmapTask).encodeTo(output);
        break;
      case UpdateRoadmapTask:
        (value as UpdateRoadmapTask).encodeTo(output);
        break;
      case CreateApp:
        (value as CreateApp).encodeTo(output);
        break;
      case UpdateAppStatus:
        (value as UpdateAppStatus).encodeTo(output);
        break;
      case OrgIntegrateApp:
        (value as OrgIntegrateApp).encodeTo(output);
        break;
      case UpdateOrgAppStatus:
        (value as UpdateOrgAppStatus).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case CreateDao:
        return (value as CreateDao)._sizeHint();
      case UpdateDao:
        return (value as UpdateDao)._sizeHint();
      case CreateRoadmapTask:
        return (value as CreateRoadmapTask)._sizeHint();
      case UpdateRoadmapTask:
        return (value as UpdateRoadmapTask)._sizeHint();
      case CreateApp:
        return (value as CreateApp)._sizeHint();
      case UpdateAppStatus:
        return (value as UpdateAppStatus)._sizeHint();
      case OrgIntegrateApp:
        return (value as OrgIntegrateApp)._sizeHint();
      case UpdateOrgAppStatus:
        return (value as UpdateOrgAppStatus)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::create_dao`].
class CreateDao extends Call {
  const CreateDao({
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

  factory CreateDao._decode(_i1.Input input) {
    return CreateDao(
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
        'create_dao': {
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
      other is CreateDao &&
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

/// See [`Pallet::update_dao`].
class UpdateDao extends Call {
  const UpdateDao({
    required this.daoId,
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

  factory UpdateDao._decode(_i1.Input input) {
    return UpdateDao(
      daoId: _i1.U64Codec.codec.decode(input),
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

  /// DaoAssetId
  final BigInt daoId;

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
        'update_dao': {
          'daoId': daoId,
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
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
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
      8,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
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
      other is UpdateDao &&
          other.daoId == daoId &&
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
        daoId,
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

/// See [`Pallet::create_roadmap_task`].
class CreateRoadmapTask extends Call {
  const CreateRoadmapTask({
    required this.daoId,
    required this.roadmapId,
    required this.name,
    required this.priority,
    this.tags,
  });

  factory CreateRoadmapTask._decode(_i1.Input input) {
    return CreateRoadmapTask(
      daoId: _i1.U64Codec.codec.decode(input),
      roadmapId: _i1.U32Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      priority: _i1.U8Codec.codec.decode(input),
      tags: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u32
  final int roadmapId;

  /// Vec<u8>
  final List<int> name;

  /// u8
  final int priority;

  /// Option<Vec<u8>>
  final List<int>? tags;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create_roadmap_task': {
          'daoId': daoId,
          'roadmapId': roadmapId,
          'name': name,
          'priority': priority,
          'tags': tags,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(roadmapId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8Codec.codec.sizeHint(priority);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(tags);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      roadmapId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      priority,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      tags,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateRoadmapTask &&
          other.daoId == daoId &&
          other.roadmapId == roadmapId &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          other.priority == priority &&
          other.tags == tags;

  @override
  int get hashCode => Object.hash(
        daoId,
        roadmapId,
        name,
        priority,
        tags,
      );
}

/// See [`Pallet::update_roadmap_task`].
class UpdateRoadmapTask extends Call {
  const UpdateRoadmapTask({
    required this.daoId,
    required this.roadmapId,
    required this.taskId,
    required this.priority,
    required this.status,
    this.tags,
  });

  factory UpdateRoadmapTask._decode(_i1.Input input) {
    return UpdateRoadmapTask(
      daoId: _i1.U64Codec.codec.decode(input),
      roadmapId: _i1.U32Codec.codec.decode(input),
      taskId: _i1.U64Codec.codec.decode(input),
      priority: _i1.U8Codec.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
      tags: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// u32
  final int roadmapId;

  /// TaskId
  final BigInt taskId;

  /// u8
  final int priority;

  /// u8
  final int status;

  /// Option<Vec<u8>>
  final List<int>? tags;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update_roadmap_task': {
          'daoId': daoId,
          'roadmapId': roadmapId,
          'taskId': taskId,
          'priority': priority,
          'status': status,
          'tags': tags,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U32Codec.codec.sizeHint(roadmapId);
    size = size + _i1.U64Codec.codec.sizeHint(taskId);
    size = size + _i1.U8Codec.codec.sizeHint(priority);
    size = size + _i1.U8Codec.codec.sizeHint(status);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(tags);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      roadmapId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      taskId,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      priority,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      status,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      tags,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdateRoadmapTask &&
          other.daoId == daoId &&
          other.roadmapId == roadmapId &&
          other.taskId == taskId &&
          other.priority == priority &&
          other.status == status &&
          other.tags == tags;

  @override
  int get hashCode => Object.hash(
        daoId,
        roadmapId,
        taskId,
        priority,
        status,
        tags,
      );
}

/// See [`Pallet::create_app`].
class CreateApp extends Call {
  const CreateApp({
    required this.name,
    required this.desc,
    required this.icon,
    required this.url,
  });

  factory CreateApp._decode(_i1.Input input) {
    return CreateApp(
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      icon: _i1.U8SequenceCodec.codec.decode(input),
      url: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> icon;

  /// Vec<u8>
  final List<int> url;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'create_app': {
          'name': name,
          'desc': desc,
          'icon': icon,
          'url': url,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(icon);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(url);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
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
      icon,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      url,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CreateApp &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.desc,
            desc,
          ) &&
          _i4.listsEqual(
            other.icon,
            icon,
          ) &&
          _i4.listsEqual(
            other.url,
            url,
          );

  @override
  int get hashCode => Object.hash(
        name,
        desc,
        icon,
        url,
      );
}

/// See [`Pallet::update_app_status`].
class UpdateAppStatus extends Call {
  const UpdateAppStatus({
    required this.appId,
    required this.status,
  });

  factory UpdateAppStatus._decode(_i1.Input input) {
    return UpdateAppStatus(
      appId: _i1.U64Codec.codec.decode(input),
      status: _i3.Status.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt appId;

  /// Status
  final _i3.Status status;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update_app_status': {
          'appId': appId,
          'status': status.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    size = size + _i3.Status.codec.sizeHint(status);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
      output,
    );
    _i3.Status.codec.encodeTo(
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
      other is UpdateAppStatus &&
          other.appId == appId &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        appId,
        status,
      );
}

/// See [`Pallet::org_integrate_app`].
class OrgIntegrateApp extends Call {
  const OrgIntegrateApp({
    required this.daoId,
    required this.appId,
  });

  factory OrgIntegrateApp._decode(_i1.Input input) {
    return OrgIntegrateApp(
      daoId: _i1.U64Codec.codec.decode(input),
      appId: _i1.U64Codec.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// DaoAssetId
  final BigInt appId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'org_integrate_app': {
          'daoId': daoId,
          'appId': appId,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is OrgIntegrateApp && other.daoId == daoId && other.appId == appId;

  @override
  int get hashCode => Object.hash(
        daoId,
        appId,
      );
}

/// See [`Pallet::update_org_app_status`].
class UpdateOrgAppStatus extends Call {
  const UpdateOrgAppStatus({
    required this.daoId,
    required this.appId,
    required this.status,
  });

  factory UpdateOrgAppStatus._decode(_i1.Input input) {
    return UpdateOrgAppStatus(
      daoId: _i1.U64Codec.codec.decode(input),
      appId: _i1.U64Codec.codec.decode(input),
      status: _i3.Status.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// DaoAssetId
  final BigInt appId;

  /// Status
  final _i3.Status status;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update_org_app_status': {
          'daoId': daoId,
          'appId': appId,
          'status': status.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    size = size + _i3.Status.codec.sizeHint(status);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
      output,
    );
    _i3.Status.codec.encodeTo(
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
      other is UpdateOrgAppStatus &&
          other.daoId == daoId &&
          other.appId == appId &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        daoId,
        appId,
        status,
      );
}
