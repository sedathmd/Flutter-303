import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        //burada direk bodynin içerisini padding ile sarmalarsak içeridekilerin hepsine padding verebiliriz.
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
                //all dersek her tarafından olur. Symetric diyip içeride vertical veya horizontal da secebiliriz.
                padding: const EdgeInsets.all(10),
                child: Container(color: Colors.white, height: 100)),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Container(color: Colors.white, height: 100)),
            //zero ile sıfır padding, only ile ise belirli taraflara parça parça padding verebiliriz
            Padding(
              //burada sağdan 100 yukarı ve aşşağıdan 20 vermeyi şu şekilde yapabiliriz
              padding: ProjectPadding.pagePaddingRightOnly +
                  ProjectPadding.pagePaddingHorizontal,
              child: const Text('Sedat'),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: 10);
  static const pagePaddingRightOnly = EdgeInsets.only(right: 100);
  //buraya yukarıdaki diger sağdan soldan horizontal vb gibi diger paddingleri de tanımlayip öyle yazmak en mantıklısı
}
