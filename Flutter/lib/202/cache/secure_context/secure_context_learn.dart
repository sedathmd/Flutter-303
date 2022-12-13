import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//https://pub.dev/packages/flutter_secure_storage
//bu paketi kullanmak icin android/.gradle/app/buildgradle icerisinde minSdkVersion'ı 18 yaptım
//Shared'a göre daha safe'dir. Verileri token olarak kripte ederek saklar
class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({super.key});

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

enum _SecureKeys { token }

class _SecureContextLearnState extends State<SecureContextLearn> {
  //veriyi yazdırma
  final _storage = const FlutterSecureStorage();
  final TextEditingController _controller = TextEditingController();
  String _title = '';
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  //veriyi getirme
  Future<void> getSecureItems() async {
    //readall diyince listeyi okuyor
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    if (_title.isNotEmpty) {
      print('Token mevcut. Bu appi daha önceden kullanmışşınız');
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: const Text('save')),
      body: TextField(
          controller: _controller,
          onChanged: saveItems,
          minLines: 3,
          maxLines: 4),
    );
  }
}
