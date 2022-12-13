// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//işlem yapılmayan sadece görüntüleme sağlayan sayfalarda kullanılır.
class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  //textler 101 seviyesinde hep burada yazmalı
  final String text2 = 'a';
  final String text3 = 'b';
  final String text4 = 'c';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //complexligi azaltmak icin burada özellikleri verip ismine sag tiklayip ctrl+ . ile exctract widget diyip disariya alabiliriz.
        //1. önemli nokta complexlik arttiginda böyle parçalamalıyız
        TittleTextWidget(text: text2),
        _emptyBox(), //böyle basit seyleri statless widget yerine extract method yapabiliriz.
        TittleTextWidget(text: text3),
        _emptyBox(),
        TittleTextWidget(text: text4),

        const _CustomContainer()
      ]),
    );
  }

  SizedBox _emptyBox() => SizedBox(height: 10);
}

//isimlendirmenin basinda alt cizgi varsa private oldugu anlamına gelir
//3. önemli nokta sayfalarımızda private olarak bunu entegre etmeliyiz
class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

class TittleTextWidget extends StatelessWidget {
  const TittleTextWidget({Key? key, required this.text}) : super(key: key);
  //2. önemli nokta dışarıdan parametre alabilir halde olmalıdır
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
