import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.ic_apple_with_scholl.toWidget(height: 100),
    );
  }
}

enum ImagePaths {
  //bu sekilde ignorlamamız gerekiyor.
  // ignore: constant_identifier_names
  ic_apple_with_scholl
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  //eger icon tanımlıyorsak boyutunu default olarak burada da tanımlayabilir
  // ya da yukarıda cagırırken her birine özel olarak verebiliriz
  Widget toWidget({double height = 24}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
