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
  late List<AccountOrg> nodes;

  // 区块链地址
  @HiveField(7)
  late String ss58Address;

  Account({required this.address, required this.chainData, required this.ss58Address, required this.nodes});
}

@HiveType(typeId: 2)
class AccountOrg {
  // 节点hash
  @HiveField(2)
  String nodeHash = "";

  // 节点名
  @HiveField(3)
  String? nodeName;

  // 节点名
  @HiveField(14)
  String? nodeDesc;

  // 节点主颜色
  @HiveField(4)
  String? nodeColor;

  // 节点头像
  @HiveField(5)
  String? nodeAvater;

  // 节点图片
  @HiveField(6)
  String? nodeImg;

  // 节点授权网址
  @HiveField(7)
  String? domain;

  // 节点Id
  @HiveField(9)
  String nodeId = "";

  // 区块链连接点
  @HiveField(13)
  String? theme;

  // 节点状态 1=>激活 2=>暂停 3=>删除
  @HiveField(10)
  int status = 1;

  // 账户ID
  @HiveField(11)
  late String withAddr;

  @HiveField(12)
  late Account account;

  AccountOrg(this.nodeHash);
}

@JsonSerializable()
class ChainAccountData {
  late String encoded;
  late String address;
  late ChainDataEncoding encoding;
  late Map<String, String> meta;

  ChainAccountData(this.address, this.encoded, this.encoding, this.meta);

  factory ChainAccountData.fromJson(Map<String, dynamic> json) => _$ChainAccountDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChainAccountDataToJson(this);
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
