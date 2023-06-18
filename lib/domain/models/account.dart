import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 1)
class Account extends HiveObject {
  @HiveField(0)
  int id = 0;

  // 用户昵称
  @HiveField(1)
  String? name;

  // 用户昵称
  @HiveField(6)
  Uri? avatar;

  // 团队授权网址
  @HiveField(2)
  late String domain;

  // 区块链地址
  @HiveField(3)
  late String address;

  // 用户账户信息明文
  @HiveField(4)
  late String chainData;

  @HiveField(5)
  late List<AccountOrg> orgs;

  Account({required this.address, required this.chainData, required this.orgs});
}

@HiveType(typeId: 2)
class AccountOrg {
  // 组织hash
  @HiveField(2)
  String orgHash = "";

  // 组织名
  @HiveField(3)
  String? orgName;

  // 组织主颜色
  @HiveField(4)
  String? orgColor;

  // 组织头像
  @HiveField(5)
  String? orgAvater;

  // 组织图片
  @HiveField(6)
  String? orgImg;

  // 组织授权网址
  @HiveField(7)
  String? domain;

  // 组织区块链
  @HiveField(8)
  String? chainUrl;

  // 组织Id
  @HiveField(9)
  int daoId = 0;

  // 区块链连接点
  @HiveField(13)
  String? theme;

  // 组织状态 1=>激活 2=>暂停 3=>删除
  @HiveField(10)
  int status = 1;

  // 账户ID
  @HiveField(11)
  late String withAddr;

  @HiveField(12)
  late Account account;

  AccountOrg(this.orgHash);
}

@JsonSerializable()
class ChainData {
  late String encoded;
  late String address;
  late ChainDataEncoding encoding;
  late Map<String, String> meta;

  ChainData(this.address, this.encoded, this.encoding, this.meta);

  factory ChainData.fromJson(Map<String, dynamic> json) => _$ChainDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChainDataToJson(this);
}

@JsonSerializable()
class ChainDataEncoding {
  late List<String> content;
  late String type;
  late String version;

  ChainDataEncoding(this.content, this.type, this.version);

  factory ChainDataEncoding.fromJson(Map<String, dynamic> json) => _$ChainDataEncodingFromJson(json);
  Map<String, dynamic> toJson() => _$ChainDataEncodingToJson(this);
}
