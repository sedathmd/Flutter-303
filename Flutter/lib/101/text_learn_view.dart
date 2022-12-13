import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  //ekrana çizmesi için mutlaka statelesswidget extends etmemiz lazım
  const TextLearnView(
      {super.key}); //classın üstüne tiklayip 2. sırada yapılıyor
  final String name = 'Sedat';
  @override //classın üstüne tiklayip 1. sırada yapılıyor
  Widget build(BuildContext context) {
    return Scaffold(
        //Flutter sayfası yapıyorsak scaffold ile sarmalamamız lazım. Bunun body kısmına kodlar yazılır
        //center ile ortalayip child vererek sarmalıyoruz/ Textin özelliklerini ctrl space ile acariz
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center, //ALT ALTA GELSİN DİYE
      children: [
        Text(
          'Welcome',
          //('Buy the best one' * 10), //10 kere yazdir
          maxLines: 2, //max 2 satir
          overflow: TextOverflow.ellipsis, //2 satırı aşarsa 3 nokta koy
          textAlign: TextAlign.left, //sola yasla
          style: ProjectStyle.welcomeStyle,
        ),
        Text(
          //üstteki ile bu ayni textStyle'a sahip
          'Hoşgeldiniz',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: ProjectStyle.welcomeStyle,
        ),
        Text(
          //2. yöntem ve en doğru yöntem
          'Welcome $name ${name.length}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors
                  .green), //hazir sablonlar.  https://material.io/design/typography/the-type-system.html#type-scale
          //soru işaretinden sonrasi hazir sablonun degistirmek istedigimiz özelliklerini belirtmek icin
        ),
      ],
    )));
  }
}

class ProjectStyle {
  static TextStyle welcomeStyle = const TextStyle(
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.red,
      wordSpacing: 2,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600); //style özellikleri)

}
