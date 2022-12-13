import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: ColorItems.porsche, child: const Text('Deneme')),
    );
  }
}

class ColorItems {
  //1.yol
  static const Color porsche = Color(0xffEDBF61);
  //2.yol
  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);
}
