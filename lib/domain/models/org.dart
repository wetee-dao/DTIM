import 'package:hive/hive.dart';

import 'package:dtim/application/chain/wetee/wetee_gen/types/wetee_org/org_app.dart' as org_app;

part 'org.g.dart';

@HiveType(typeId: 3)
class Org {
  // 团队存证hash
  @HiveField(1)
  String hash = "";

  // 团队的区块链
  @HiveField(2)
  String daoId = "";

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
  });
}

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

  @HiveField(9)
  int? appId;

  // 应用
  @HiveField(7)
  Map<String, String>? meta;

  OrgApp({required this.hash, required this.type, this.url, this.name, this.desc, this.meta, this.icon, this.appId});
}

List<OrgApp> trans(List<org_app.OrgApp> orgs) {
  return orgs
      .map((o) => OrgApp(
            hash: o.id.toString(),
            appId: o.appId.toInt(),
            type: 0,
            name: o.name.toString(),
            icon: o.icon.toString(),
            desc: o.desc.toString(),
            url: o.url.toString(),
          ))
      .toList();
}
