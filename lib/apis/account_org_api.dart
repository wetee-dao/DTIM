import 'package:hive/hive.dart';

import '../store/db.dart';
import '../models/models.dart';

class AccountOrgApi {
  late final CollectionBox<AccountOrg> storeBox;

  AccountOrgApi._create(CollectionBox<AccountOrg> store) {
    storeBox = store;
  }

  static Future<AccountOrgApi> create() async {
    var storeBox = await DB!.openBox<AccountOrg>('AccountOrg');
    return AccountOrgApi._create(storeBox);
  }

  CollectionBox<AccountOrg> store() {
    return storeBox;
  }

  Future<List<AccountOrg?>> listAll() async {
    final keys = await storeBox.getAllKeys();
    return await storeBox.getAll(keys);
  }

  Future<List<AccountOrg>> listByAccount(String userId) async {
    final keys = await storeBox.getAllKeys();
    final values =  await storeBox.getAll(keys);
    return values.where((a) => a!.account.address == userId).map((v) => v!).toList();
  }

  Future<List<AccountOrg>> accountSyncOrgs(
    String userId,
    List<String> fs,
    List<Org> orgs,
  ) async {
    // final accountStoreBox = Box<Account>(DB!);
    // final aquery = accountStoreBox.query(Account_.address.equals(userId)).build();
    // final account = aquery.findUnique();
    // aquery.close();
    final accountStoreBox = await DB!.openBox<Account>('Account');
    final account = await accountStoreBox.get(userId);

    // 查询当前的团队
    final storeOrgs = await listByAccount(userId);

    // 删除不需要的数据
    for (var j = 0; j < storeOrgs.length; j++) {
      var storeIndex = -1;
      for (var i = 0; i < fs.length; i++) {
        if (storeOrgs[j].orgHash == fs[i]) {
          storeIndex = i;
        }
      }
      // 删除
      if (storeIndex == -1) {
        storeOrgs[storeIndex].status = 3;
        storeBox.put(userId + storeOrgs[j].orgHash,storeOrgs[storeIndex]);
      }
    }

    // 添加新的数据 更新新的数据
    for (var i = 0; i < fs.length; i++) {
      var storeIndex = -1;
      for (var j = 0; j < storeOrgs.length; j++) {
        if (storeOrgs[j].orgHash == fs[i]) {
          storeIndex = j;
        }
      }
      final org = getOrgFromList(orgs, fs[i]);
      
      if (storeIndex == -1) {
        // 新增
        if (org != null) {
          final at = AccountOrg(org.hash);
          at.orgName = org.name;
          at.orgAvater = org.metaData!.avater;
          at.orgImg = org.metaData!.img;
          at.orgColor = org.metaData!.color;
          at.domain = org.metaData!.domain;
          at.chainUrl = org.chainUrl;
          at.status = 1;
          at.withAddr = userId;
          at.account = account!;
          at.daoId = org.daoId;
          storeBox.put(userId + org.hash,at);
        }
      } else {
        // 更新
        if (org != null) {
          storeOrgs[storeIndex].orgName = org.name;
          storeOrgs[storeIndex].orgAvater = org.metaData!.avater;
          storeOrgs[storeIndex].orgImg = org.metaData!.img;
          storeOrgs[storeIndex].orgColor = org.metaData!.color;
          storeOrgs[storeIndex].domain = org.metaData!.domain;
          storeOrgs[storeIndex].chainUrl = org.chainUrl;
          storeOrgs[storeIndex].status = 1;
          storeOrgs[storeIndex].withAddr = userId;
          storeOrgs[storeIndex].account = account!;
          storeOrgs[storeIndex].daoId = org.daoId;
          storeBox.put(userId + org.hash, storeOrgs[storeIndex]);
        }
      }
    }
    return storeOrgs;
  }
}

Org? getOrgFromList(List<Org> orgs, String hash) {
  for (var i = 0; i < orgs.length; i++) {
    if (orgs[i].hash == hash) {
      return orgs[i];
    }
  }
  return null;
}
