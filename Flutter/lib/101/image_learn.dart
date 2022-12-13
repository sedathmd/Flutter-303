import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
            height: 100,
            width: 200,
            child:
                //Image.asset(ImageItems().appleWithBook, fit: BoxFit.contain)),
                //yukarıdaki kullanım yerine alttakini kullanırız
                PngImage(name: ImageItems().appleBookWithoutPath)),

        //ya da bunların hic birini kullanmadan internetten bir görselin adresini kopyalayarak
        Image.network(
            'https://w7.pngwing.com/pngs/525/504/png-transparent-francis-howell-school-district-cartoon-books-and-apple-blue-text-heart.png',
            errorBuilder: (context, error, stackTrace) =>
                PngImage(name: ImageItems().appleBookWithoutPath))
        //burada error builder olası bi hatada ne yapmamız gerektigini gösterir/ yanlıs link vb
      ]),
    );
  }
}

class ImageItems {
  final String appleWithBook = "assets/cuttable-school.png";
  final String appleBook = "assets/png/ic_apple_with_scholl.png";
  final String appleBookWithoutPath = "ic_apple_with_scholl";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/png/$name.png', fit: BoxFit.contain);
    //burada ImageItems classında verdigimiz pathsiz image'i daha efektif şekilde kullandık ve yukarıda sizedbox içerisine attık.
  }
}
