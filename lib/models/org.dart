import 'package:objectbox/objectbox.dart';

@Entity()
class Org {
  @Id()
  int id = 0;

  // 团队存证hash
  String hash = "";

  // 团队的区块链
  int daoId = 0;

  // 团队名
  String? name;

  // 团队介绍
  String? desc;

  // 区块链连接点
  String? chainUrl;

  // 团队元数据
  OrgMetaData? metaData;

  // 应用列表
  List<OrgApp> apps = [];

  Org(
    this.hash, {
    required this.daoId,
    this.name,
    this.desc,
    this.metaData,
    this.chainUrl,
    this.apps = const [],
  });
}

@Entity()
class OrgMetaData {
  @Id()
  int id = 0;

  // 团队授权网址
  String? domain;

  // 团队图标
  String? avater;

  // 团队大图
  String? img;

  // 团队颜色
  String? color;

  // 官网地址
  String? homeUrl;

  OrgMetaData({
    this.domain,
    this.avater,
    this.homeUrl,
    this.img,
    this.color,
  });
}

@Entity()
class OrgApp {
  @Id()
  int appId = 0;

  // 应用hash
  String hash = "";

  // 应用类型
  // 0 => web3
  // 1 => web2
  // 2 => tee
  int type = 0;

  // 应用地址
  String? url;

  // 应用名
  String? name;

  // 应用
  String? desc;
}
