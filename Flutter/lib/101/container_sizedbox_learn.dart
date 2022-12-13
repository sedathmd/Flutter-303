import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(), //appbar ekledik, daha sonra body kısmından devam ediyoruz
      body: Column(
        //sizedboxa tıklayip ampulden column eklenebilir
        children: [
          SizedBox(
            width: 200,
            height: 150,
            child: Text('a' * 200), //child ekliyoruz
          ),

          //const SizedBox.shrink(), //2. kullanım boş sizedbox

          SizedBox.square(
            //3. kullanım kare yapıp içine chield atama
            dimension: 40, //boyut
            child: Text('b' * 50),
          ),

          Container(
            //container da responsive yapabiliriz

            constraints: const BoxConstraints(
                maxWidth: 200,
                minWidth: 100,
                maxHeight: 120,
                minHeight:
                    5), //buradan max ve min değerleri verip child'ı responsive yapabiliriz
            child: Text(
              'a' * 50,
              maxLines: 2,
            ),
            padding: const EdgeInsets.all(10), //iç boşluk
            margin: const EdgeInsets.all(10), //dış boşluk
            decoration: ProjectUtility.boxDecoration,
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(
          10), //kenarları yuvarlak yapma circularda heryeri / only yaparsak belli bir yeri
      //color: Colors.red,  //gradient varken bunu kullanmaya gerek yok
      gradient: const LinearGradient(colors: [
        Colors.red,
        Colors.black
      ]), //ilki baslangıc ikinci sondaki renk (geçiş)
      boxShadow: const [
        BoxShadow(
            //bunları gelen istek üzerine 3rd parti yollarla düzenleyebiliriz.
            color: Colors.green,
            offset: Offset(0.1, 1),
            blurRadius: 12)
      ],
      //shape: BoxShape.circle
      border: Border.all(width: 5, color: Colors.white12));
}

//ikinci yöntem
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(
                10), //kenarları yuvarlak yapma circularda heryeri / only yaparsak belli bir yeri
            //color: Colors.red,  //gradient varken bunu kullanmaya gerek yok
            gradient: const LinearGradient(colors: [
              Colors.red,
              Colors.black
            ]), //ilki baslangıc ikinci sondaki renk (geçiş)
            boxShadow: const [
              BoxShadow(
                  //bunları gelen istek üzerine 3rd parti yollarla düzenleyebiliriz.
                  color: Colors.green,
                  offset: Offset(0.1, 1),
                  blurRadius: 12)
            ],
            //shape: BoxShape.circle
            border: Border.all(width: 5, color: Colors.white12));
}
