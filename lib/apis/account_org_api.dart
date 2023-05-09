import '../store/db.dart';
import '../models/models.dart';
import '../objectbox.g.dart';

class AccountOrgApi {
  late final Box<AccountOrg> storeBox;

  AccountOrgApi._create(Store store) {
    storeBox = Box<AccountOrg>(store);
  }

  static AccountOrgApi create() {
    return AccountOrgApi._create(DB!);
  }

  Box<AccountOrg> store() {
    return storeBox;
  }

  List<AccountOrg> listAll() {
    return storeBox.getAll();
  }

  List<AccountOrg> listByAccount(String userId) {
    final query = storeBox.query(AccountOrg_.withAddr.equals(userId)).build();
    final storeOrgs = query.find();
    query.close();

    return storeOrgs;
  }

  List<AccountOrg> accountSyncOrgs(
    String userId,
    List<String> fs,
    List<Org> orgs,
  ) {
    final accountStoreBox = Box<Account>(DB!);
    final aquery = accountStoreBox.query(Account_.address.equals(userId)).build();
    final account = aquery.findUnique();
    aquery.close();

    // 查询当前的团队
    final query = storeBox.query(AccountOrg_.withAddr.equals(userId)).build();
    final storeOrgs = query.find();
    query.close();

    // 删除不需要的数据
    for (var j = 0; j < storeOrgs.length; j++) {
      var storeIndex = -1;
      for (var i = 0; i < fs.length; i++) {
        if (storeOrgs[j].orgHash == fs[i]) {
          storeIndex = i;
        }
      }
      if (storeIndex == -1) {
        storeOrgs[storeIndex].status = 3;
        storeBox.put(storeOrgs[storeIndex]);
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
          at.account.target = account;
          at.daoId = org.daoId;
          storeBox.put(at);
        }
      } else {
        if (org != null) {
          storeOrgs[storeIndex].orgName = org.name;
          storeOrgs[storeIndex].orgAvater = org.metaData!.avater;
          storeOrgs[storeIndex].orgImg = org.metaData!.img;
          storeOrgs[storeIndex].orgColor = org.metaData!.color;
          storeOrgs[storeIndex].domain = org.metaData!.domain;
          storeOrgs[storeIndex].chainUrl = org.chainUrl;
          storeOrgs[storeIndex].status = 1;
          storeOrgs[storeIndex].withAddr = userId;
          storeOrgs[storeIndex].account.target = account;
          storeOrgs[storeIndex].daoId = org.daoId;
          storeBox.put(storeOrgs[storeIndex]);
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
