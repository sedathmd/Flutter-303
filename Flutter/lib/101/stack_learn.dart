import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Container(color: Colors.red, height: 100),
        Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(color: Colors.blue, height: 100)),
        Positioned(
            //left: 0,
            //right: 0,
            //top: 25,
            width: 25, //right ve left vermeyince width vermemiz gerekiyor
            bottom: 0,
            height: 100,
            child: Container(color: Colors.green)),
        //fill komple doldurur
        Positioned.fill(top: 100, child: Container(color: Colors.white))
        //bunu en üstte verirsek en arkada kalır. Klasik stack mantıgı
        //yukarıdaki 2 container oldugu icin bunun heighti sadece 150.
        // Onlar olmasa sayfayı komple kaplar
      ]),
    );
  }
}
