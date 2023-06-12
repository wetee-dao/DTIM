import 'package:json_annotation/json_annotation.dart';

import './bridge_struct.dart';

part 'bridge_struct_json.g.dart';

@JsonSerializable()
class AssetAccountDataJ extends AssetAccountData {
  AssetAccountDataJ({required int free, required int reserved, required int frozen})
      : super(free: free, reserved: reserved, frozen: frozen);

  factory AssetAccountDataJ.fromJson(Map<String, dynamic> json) => _$AssetAccountDataJFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AssetAccountDataJToJson(this);
}

@JsonSerializable()
class DaoInfoJ extends DaoInfo {
  DaoInfoJ(
      {required int id,
      required String creator,
      required int startBlock,
      required String daoAccountId,
      required String name,
      required String purpose,
      required String metaData,
      required int chainUnit})
      : super(
            id: id,
            creator: creator,
            startBlock: startBlock,
            daoAccountId: daoAccountId,
            name: name,
            purpose: purpose,
            metaData: metaData,
            chainUnit: chainUnit);

  factory DaoInfoJ.fromJson(Map<String, dynamic> json) => _$DaoInfoJFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DaoInfoJToJson(this);
}
