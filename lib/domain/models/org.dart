import 'package:hive/hive.dart';

part 'org.g.dart';

@HiveType(typeId: 3)
class Org {
  // 团队存证hash
  @HiveField(1)
  String hash = "";

  // 团队的区块链
  @HiveField(2)
  int daoId = 0;

  // 团队名
  @HiveField(3)
  String? name;

  // 团队介绍
  @HiveField(4)
  String? desc;

  // 团队目的
  @HiveField(8)
  String? purpose;

  /// im api
  @HiveField(10)
  String? imApi;
  /// org color
  @HiveField(11)
  String? bg;
  /// org logo
  @HiveField(12)
  String? logo;
  /// 组织大图
  @HiveField(13)
  String? img;
  /// 组织主页
  @HiveField(14)
  String? homeUrl;

  // 应用列表
  @HiveField(7)
  List<OrgApp> apps = [];

  Org(
    this.hash, {
    required this.daoId,
    this.name,
    this.desc,
    this.purpose,
    this.imApi,
    this.bg,
    this.logo,
    this.img,
    this.homeUrl,
    this.apps = const [],
  });
}

// @HiveType(typeId: 4)
// class OrgMetaData {
//   // @Id()
//   // int id = 0;

//   // 团队授权网址
//   @HiveField(1)
//   String? domain;

//   // 团队空间
//   @HiveField(6)
//   String? space;

//   // 团队图标
//   @HiveField(2)
//   String? avater;

//   // 团队大图
//   @HiveField(3)
//   String? img;

//   // 团队颜色
//   @HiveField(4)
//   String? color;

//   // 官网地址
//   @HiveField(5)
//   String? homeUrl;

//   OrgMetaData({
//     this.domain,
//     this.avater,
//     this.homeUrl,
//     this.img,
//     this.color,
//     this.space,
//   });
// }

@HiveType(typeId: 5)
class OrgApp {
  // 应用hash
  @HiveField(2)
  String hash = "";

  // 应用类型
  // 0 => web3
  // 1 => web2
  // 2 => tee
  @HiveField(3)
  int type = 0;

  // 应用地址
  @HiveField(4)
  String? url;

  // 应用名
  @HiveField(5)
  String? name;

  // 应用
  @HiveField(6)
  String? desc;

  // 应用图标
  @HiveField(8)
  String? icon;

  // 应用
  @HiveField(7)
  Map<String,String>? meta;

  OrgApp({
    required this.hash,
    required this.type,
    this.url,
    this.name,
    this.desc,
    this.meta,
    this.icon,
  });
}