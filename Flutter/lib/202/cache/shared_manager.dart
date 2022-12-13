import 'package:flutter_application_1/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

//3.kişiler keye ulaşamasın diye Key olusturuyoruz
enum SharedKeys { counter, users }

class SharedManager {
  //sharedPreferences'i sürekli cagırmamak icin
  SharedPreferences? preferences;
  SharedManager();
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  //preferencesi alamazsak diye custom exception
  void _checkPrefences() {
    if (preferences == null) throw SharedNotInitializeException();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPrefences();
    await preferences?.setString(key.name, value);
  }

  //liste icin olanı
  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPrefences();
    await preferences?.setStringList(key.name, value);
  }

  //burada bekleme olmadı icin future degil
  String? getString(SharedKeys key) {
    _checkPrefences();
    return preferences?.getString(key.name);
  }

  //liste icin olanı
  List<String>? getStrings(SharedKeys key) {
    _checkPrefences();
    return preferences?.getStringList(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPrefences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
