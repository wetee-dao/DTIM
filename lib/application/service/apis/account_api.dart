import 'package:asyou_app/domain/models/account.dart';
import 'package:hive/hive.dart';


class AccountApi {
  late final Box<Account> storeBox;

  AccountApi._create(Box<Account> store) {
    storeBox = store;
  }

  static Future<AccountApi> create() async {
    var storeBox = await Hive.openBox<Account>('Account');
    return AccountApi._create(storeBox);
  }

  Box<Account> store() {
    return storeBox;
  }

  addUser(Account u) async {
    await storeBox.put(u.address,u);
    return u;
  }

  remove(String id) async {
    return await storeBox.delete(id);
  }

  Future<List<Account>> getUsers() async {
    return storeBox.values.toList();
  }

  syncUsers(List<Account> users) async {
    var oldUsers = await getUsers();

    // 添加新的数据 更新新的数据
    for (var i = 0; i < users.length; i++) {
      var storeIndex = -1;
      for (var j = 0; j < oldUsers.length; j++) {
        if (users[i].address == oldUsers[j].address) {
          storeIndex = j;
        }
      }
      
      if (storeIndex == -1) {
        // 添加
        // await addUser(users[i]);
        await storeBox.put(users[i].address,users[i]);
      } else {
        // 更新
        oldUsers[storeIndex].name = users[i].name;
        await oldUsers[storeIndex].save();
      }
    }

    // 删除不需要的数据
    for (var j = 0; j < oldUsers.length; j++) {
      var storeIndex = -1;
      for (var i = 0; i < users.length; i++) {
        if (oldUsers[j].address == oldUsers[i].address) {
          storeIndex = i;
        }
      }
      // 删除
      if (storeIndex == -1) {
        await remove(oldUsers[storeIndex].address);
      }
    }
  }
}
