// ignore_for_file: unused_element, sort_child_properties_last

import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //card'ın containerdan farkı sayfada önde durması ve daha estetik bir yapıya sahip olup göze batması
        Card(
            margin: ProjectMargin.cardMargin,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const SizedBox(
              width: 400,
              height: 100,
              child: Center(child: Text('Sedat')),
            )),
        Card(
            //color'ı theme'dan da verebiliriz
            color: Theme.of(context).colorScheme.error,
            child: const SizedBox(
              width: 100,
              height: 100,
            )),
        //_CustomCard yazıp extract widget diyoruz ve assagidaki gibi yapiyoruz.Exctract widget cikmaz ise el ile yazariz.
        _CustomCard(
            child: const SizedBox(
                width: 400, height: 100, child: Center(child: Text('Sedat')))),

        //main.dart da theme içerisine  cardTheme: CardTheme(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
        //şeklinde yazarsak roje icerisindeki bütün kartlara vermis oluruz.
      ]),
    );
  }
}

class ProjectMargin {
  static const cardMargin = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  _CustomCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: ProjectMargin.cardMargin,
        child: child,
        shape: roundedRectangleBorder);
  }
}

// Borders
//  StadiumBorder(),CircleBorder(),RoundedRectangeBorder()
