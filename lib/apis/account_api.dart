import '../models/user.dart';
import '../models/account.dart';
import '../objectbox.g.dart';
import '../../store/db.dart';

class AccountApi {
  late final Box<Account> storeBox;

  AccountApi._create(Store store) {
    storeBox = Box<Account>(store);
  }

  static AccountApi create() {
    return AccountApi._create(DB!);
  }

  Box<Account> store() {
    return storeBox;
  }

  addUser(Account u) {
    final id = storeBox.put(u);
    u.id = id;
    return u;
  }

  remove(int id) {
    return storeBox.remove(id);
  }

  List<Account> getUsers() {
    final builder = storeBox.query();
    final query = builder.build();
    final us = query.find();
    query.close();
    return us;
  }

  List<User> userSyncFriend(Account user, List<User> fs) {
    Account? storeUser = storeBox.get(user.id);
    if (storeUser == null) {
      return [];
    }

    // 删除不需要的数据
    for (var j = 0; j < storeUser.friends.length; j++) {
      var storeIndex = -1;
      for (var i = 0; i < fs.length; i++) {
        if (storeUser.friends[j].address == fs[i].address) {
          storeIndex = i;
        }
      }
      if (storeIndex == -1) {
        storeUser.friends.removeAt(j);
      }
    }

    // 添加新的数据 更新新的数据
    for (var i = 0; i < fs.length; i++) {
      var storeIndex = -1;
      for (var j = 0; j < storeUser.friends.length; j++) {
        if (storeUser.friends[j].address == fs[i].address) {
          storeIndex = j;
        }
      }
      if (storeIndex == -1) {
        storeUser.friends.add(fs[i]);
      } else {
        storeUser.friends[storeIndex].domain = fs[i].domain;
        storeUser.friends[storeIndex].avatar = fs[i].avatar;
        storeUser.friends[storeIndex].name = fs[i].name;
      }
    }
    storeBox.put(storeUser);
    return storeUser.friends;
  }
}
