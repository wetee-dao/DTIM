import 'package:objectbox/objectbox.dart';

@Entity()
class Org {
  @Id()
  int id = 0;

  // 团队存证hash
  String hash = "";

  // 团队名
  String? name;

  // 团队介绍
  String? desc;

  // 团队授权网址
  String? domain;

  // 团队图标
  String? avater;

  // 团队大图
  String? img;

  // 团队颜色
  String? color;

  // 区块链类型
  String? chainType;

  // 区块链元数据
  String? chainMeta;

  // 区块链地址
  String? chainUrl;

  // 官网地址
  String? homeUrl;

  Org(
    this.hash, {
    this.name,
    this.desc,
    this.domain,
    this.avater,
    this.chainType,
    this.chainMeta,
    this.chainUrl,
    this.homeUrl,
    this.img,
    this.color,
  });
}
