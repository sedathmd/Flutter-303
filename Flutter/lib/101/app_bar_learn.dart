import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //buradaki özellikleri tek tek yazmak yerine main.dartin icerisinde theme'yı copywith ile özelleştirerek verebilir.
      //Böylece projedeki bütün sayfaların app barlarının ortak özelliklerini tek seferde verebiliriz.
      appBar: AppBar(
        title: Text(_title),
        //centerTitle: true,
        //backgroundColor: Colors.transparent, //appbari transaran yapma
        //elevation appbari transparan yaptıktan sonra sayfa ile aynı katmanda gibi gösterir
        //elevation: 0,
        //appbar üzerindeki saat wifi gibi şeylerin rengini belirleme
        //systemOverlayStyle: SystemUiOverlayStyle.light,
        //appbar icerisindeki action iconlarını özelleştirme
        //actionsIconTheme: const IconThemeData(color: Colors.red, size: 24),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.mark_email_unread_sharp))
        ],
      ),
    );
  }
}
