// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Do not have permission to create.
  /// 没有创建的权限
  haveNoCreatePermission('HaveNoCreatePermission', 0),

  /// DAO already exists
  /// 组织已存在
  daoExists('DaoExists', 1),

  /// DAO does not exist.
  /// 组织不存在
  daoNotExists('DaoNotExists', 2),

  /// guild create error
  /// 公会创建失败
  guildCreateError('GuildCreateError', 3),

  /// guild does not exist.
  /// 公会不存在
  guildNotExists('GuildNotExists', 4),

  /// DAO unsupported call
  /// 无效的调用
  inVailCall('InVailCall', 5),

  /// Wrong origin.
  /// 错误的组织
  badOrigin('BadOrigin', 6),

  /// Not the id of this dao.
  /// 组织 id 不正确
  daoIdNotMatch('DaoIdNotMatch', 7),

  /// The description of the DAO is too long.
  /// 名字太长
  nameTooLong('NameTooLong', 8),

  /// The description of the DAO is too long.
  /// 组织介绍太长
  descTooLong('DescTooLong', 9),

  /// The description of the DAO is too long.
  /// 组织目标太长
  purposeTooLong('PurposeTooLong', 10),

  /// The description of the DAO is too long.
  /// 组织目标太长
  metaDataTooLong('MetaDataTooLong', 11),

  /// Numerical calculation overflow error.
  /// 溢出错误
  overflow('Overflow', 12),

  /// member number is too long
  /// 成员数量太大
  tooManyMembers('TooManyMembers', 13),

  /// Wrong dao gov origin.
  /// 错误的dao组织账户
  badDaoGovOrigin('BadDaoGovOrigin', 14),

  /// Wrong dao gov origin.
  /// 错误的dao组织账户
  badGovOrigin('BadGovOrigin', 15),

  /// Wrong dao gov 403.
  /// 错误的dao组织账户
  badDaoGov403('BadDaoGov403', 16);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.haveNoCreatePermission;
      case 1:
        return Error.daoExists;
      case 2:
        return Error.daoNotExists;
      case 3:
        return Error.guildCreateError;
      case 4:
        return Error.guildNotExists;
      case 5:
        return Error.inVailCall;
      case 6:
        return Error.badOrigin;
      case 7:
        return Error.daoIdNotMatch;
      case 8:
        return Error.nameTooLong;
      case 9:
        return Error.descTooLong;
      case 10:
        return Error.purposeTooLong;
      case 11:
        return Error.metaDataTooLong;
      case 12:
        return Error.overflow;
      case 13:
        return Error.tooManyMembers;
      case 14:
        return Error.badDaoGovOrigin;
      case 15:
        return Error.badGovOrigin;
      case 16:
        return Error.badDaoGov403;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
