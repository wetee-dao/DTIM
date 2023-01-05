import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:asyou_app/models/user.dart';

part 'account.g.dart';

@Entity()
class Account {
  @Id()
  int id = 0;

  // 用户昵称
  String? name;

  // 团队授权网址
  late String domain;

  // 区块链地址
  late String address;

  // 用户账户信息明文
  late String chainData;

  @Backlink("account")
  final orgs = ToMany<AccountOrg>();

  @Backlink("account")
  final friends = ToMany<User>();

  // 创建时间
  @Property(type: PropertyType.date)
  DateTime? createdAt;

  // 更新时间
  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  @Transient() // Ignore this property, not stored in the database.
  int? computedProperty;

  signRaw() {}
}

@Entity()
class AccountOrg {
  @Id()
  int id = 0;

  // 组织hash
  String orgHash = "";

  // 组织名
  String? orgName;

  // 组织主颜色
  String? orgColor;

  // 组织头像
  String? orgAvater;

  // 组织图片
  String? orgImg;

  // 组织授权网址
  String? domain;

  // 组织状态 1=>激活 2=>暂停 3=>删除
  int status = 1;

  // 账户ID
  late String withAddr;

  final account = ToOne<Account>();

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
