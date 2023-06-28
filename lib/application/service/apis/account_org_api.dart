import 'package:dtim/domain/models/account.dart';
import 'package:dtim/domain/models/org.dart';
import 'package:hive/hive.dart';

class AccountOrgApi {
  late final Box<AccountOrg> storeBox;

  AccountOrgApi._create(Box<AccountOrg> store) {
    storeBox = store;
  }

  static Future<AccountOrgApi> create() async {
    var storeBox = await Hive.openBox<AccountOrg>('AccountOrg');
    return AccountOrgApi._create(storeBox);
  }

  Box<AccountOrg> store() {
    return storeBox;
  }

  Future<List<AccountOrg?>> listAll() async {
    return storeBox.values.toList();
  }

  Future<List<AccountOrg>> listByAccount(String userId) async {
    final values = storeBox.values.toList();
    return values.where((a) => a.account.address == userId).map((v) => v).toList();
  }

  saveOrgTheme(String id, String theme) async {
    var org = storeBox.get(id);
    org!.theme = theme;
    await storeBox.put(id, org);
  }

  deleteOrg(String userId, String orgHash) async {
    await storeBox.delete(userId + orgHash);
  }

  Future<List<AccountOrg>> accountSyncOrgs(
    String address,
    List<String> fs,
    List<Org> orgs,
  ) async {
    // final accountStoreBox = Box<Account>(DB!);
    // final aquery = accountStoreBox.query(Account_.address.equals(userId)).build();
    // final account = aquery.findUnique();
    // aquery.close();
    final accountStoreBox = await Hive.openBox<Account>('Account');
    final account = accountStoreBox.get(address);

    // 查询当前的团队
    final storeOrgs = await listByAccount(address);

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
        await storeBox.delete(address + storeOrgs[j].orgHash);
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
          at.orgDesc = org.desc;
          at.orgAvater = org.metaData!.avater;
          at.orgImg = org.metaData!.img;
          at.orgColor = org.metaData!.color;
          at.domain = org.metaData!.domain;
          at.chainUrl = org.chainUrl;
          at.status = 1;
          at.withAddr = address;
          at.account = account!;
          at.daoId = org.daoId;
          await storeBox.put(address + org.hash, at);
        }
      } else {
        // 更新
        if (org != null) {
          storeOrgs[storeIndex].orgName = org.name;
          storeOrgs[storeIndex].orgDesc = org.desc;
          storeOrgs[storeIndex].orgAvater = org.metaData!.avater;
          storeOrgs[storeIndex].orgImg = org.metaData!.img;
          storeOrgs[storeIndex].orgColor = org.metaData!.color;
          storeOrgs[storeIndex].domain = org.metaData!.domain;
          storeOrgs[storeIndex].chainUrl = org.chainUrl;
          storeOrgs[storeIndex].status = 1;
          storeOrgs[storeIndex].withAddr = address;
          storeOrgs[storeIndex].account = account!;
          storeOrgs[storeIndex].daoId = org.daoId;
          await storeBox.put(address + org.hash, storeOrgs[storeIndex]);
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
