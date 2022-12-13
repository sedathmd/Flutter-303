//Bir ekranda 3 buton olacak ve bunlar renk degisimini saglayacak.
//secili olan butonlar selected icon olacak

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  //color life cycle'dan gelir. Bura ile ilgisi yok. ColorLifeCycle'ı çalıstırmak icin.
  final Color? initialColor; //bunu verip required yapariz
  //nullable yaptik cünkü lifecyle'da hata vermemesi icin.bu alt sınıfa yani buraya null yollayabilir

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  //yukarıdaki degeri initstate aninda vermeliyiz
  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
    //null gelirse transparant yapiyor
    //bunu görmek icin setstate yapmamıza gerek yok cünkü zaten buildden önce calısıyor
  }

  //üst widget altı yani burayi besliyor ama burası üst widgeti yani lifecyle'ı beslemedigi icin didupdate kullanırız
  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    //eski rengi gelene esit degilse esitle
    if (oldWidget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  //buradan yukarısı lifecyle icin
  //--------------------------------------------------------------
  Color? _backgroundColor;
  //yanına soru işareti gelmesi nullable olabilir anlamındadır
  void changeBackgroundColor(Color color) {
    //ekranın tekrar tetiklenmesi icin setstate yapıyoruz
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap,
          //ontapi alta cıkardık
          items: const [
            BottomNavigationBarItem(
                icon: _ColorContainer(color: Colors.red), label: 'Red'),
            BottomNavigationBarItem(
                icon: _ColorContainer(color: Colors.green), label: 'Green'),
            BottomNavigationBarItem(
                icon: _ColorContainer(color: Colors.blue), label: 'Blue')
          ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }
//yukarıda index numaraları ile direk versek okunması zorlastıgı icin böyle yapip yukarda esitledik

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      //burada direk renk vermek yerine yukarıda final Color color; eşitledik ve required yapip buildde methodu cagırırken icerisinde verdik
      width: 20,
      height: 10,
    );
  }
}
