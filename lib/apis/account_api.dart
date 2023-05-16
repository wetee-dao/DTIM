import 'package:hive/hive.dart';

import '../models/account.dart';
import '../../store/db.dart';

class AccountApi {
  late final CollectionBox<Account> storeBox;

  AccountApi._create(CollectionBox<Account> store) {
    storeBox = store;
  }

  static Future<AccountApi> create() async {
    var storeBox = await DB!.openBox<Account>('Account');
    return AccountApi._create(storeBox);
  }

  CollectionBox<Account> store() {
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
    final keys = await storeBox.getAllKeys();
    final query = await storeBox.getAll(keys);
    return query.map((v)=>v!).toList();
  }
}
