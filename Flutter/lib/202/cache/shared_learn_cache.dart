import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';

import 'user_model.dart';

//https://pub.dev/packages/shared_preferences
class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

//cache dataları saklamaya yarar
//en altta isloading icin generic bir kullanım yaptıgımız icin bi alt satırı böyle yaptik
class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  //sharedManager'i tanımlıyoruz
  //tanımladıktan sonra calısmadı??
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
    //getDefaultValues();
  }

  Future<void> _initialize() async {
    changeLoading();
    //init'i cagirdik
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  //en son kaydettigimiz veriyi okuma
  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    // _onChangeValue(counter.toString());
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  //alttaki textfield'in onchanged'inden gelen value'yu alıyoruz
  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //textfield'e girdigimizi anlık gösteriyor
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        //kaydet'e bastıysak Indicator döner
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).scaffoldBackgroundColor),
                )
              : const SizedBox.shrink()
        ],
      ),
      //hem ekleme hem silme butonu koyduk
      floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [_saveValueButton(), _removeValueButton()]),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
      //--------------------------------------------------------------------
      //ikinci asama listeleri savelemek icin
    );
  }

  //kaydetme
  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
        onPressed: () async {
          changeLoading();
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.setInt('counter', _currentValue);
          await _manager.saveString(
              SharedKeys.counter, _currentValue.toString());
          changeLoading();
        },
        child: const Icon(Icons.save));
  }

  //silme
  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
        onPressed: () async {
          changeLoading();
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.remove('counter');
          await _manager.removeItem(SharedKeys.counter);
          changeLoading();
        },
        child: const Icon(Icons.remove));
  }
}

//------------------------------------------------------------
//liste savelemek icin

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('sh', '101', 'sh101.dev'),
      User('sh2', '102', 'sh102.dev'),
      User('sh3', '103', 'sh103.dev'),
    ];
  }
}

//-------------------------------------------------------
//Generic
//her sayfada kolayca cagirip kullanabilecegimiz generic isLoading
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
