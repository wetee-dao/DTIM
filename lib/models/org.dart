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

  Org(
    this.hash, {
    required this.daoId,
    this.name,
    this.desc,
    this.metaData,
    this.chainUrl,
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
