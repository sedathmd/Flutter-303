import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //expanded kaç parcaya bölersek ekranda % / o kadar yer kaplamasını sağlar
        //4 parca oldugu icin %25
        // Expanded(child: FlutterLogo()),
        // Expanded(child: FlutterLogo()),
        // Expanded(child: FlutterLogo()),
        // Expanded(child: FlutterLogo())

        //birincinin containerini row ile sarmalıyoruz
        Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.pink)),
                Expanded(child: Container(color: Colors.purple))
              ],
            )),
        const Spacer(flex: 2), //expanded gibi boşluk bırakıyor
        Expanded(
            flex: 2,
            child: Row(
              //main axis aligment rowda kullanılırsa yatayıdegistirir columnda kullanılırsa dikeyi (MAIN) Crossaxisaligment de tam tersi
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //spacearround'ın diger secenekleri de var
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text('Text1'), Text('Text2'), Text('Text3')],
            )),
        const Expanded(flex: 2, child: FlutterLogo())
        //flex: 4 %40 ını verir
      ]),
    );
  }
}
