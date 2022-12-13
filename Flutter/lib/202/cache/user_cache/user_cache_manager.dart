import 'dart:convert';
import 'package:flutter_application_1/202/cache/shared_manager.dart';
import '../user_model.dart';

class UserCacheManager {
  //bu classı kullanmak isteyenler sharedmanageri
  final SharedManager sharedManager;
  //constructor'ını olusturuyoruz
  UserCacheManager(this.sharedManager);

  //SAVE ISLEMI
  // kayıt yapmak icin usersi vermesi lazım
  Future<void> saveItems(List<User> items) async {
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  //GET ISLEMI
  List<User>? getItems() {
    // Compute
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User('', '', '');
      }).toList();
    }
    return null;
  }
}
