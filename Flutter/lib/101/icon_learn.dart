import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSize = IconSizes();
  final IconColors iconColors = IconColors();
  //her buton özelliklerinde color ve size gibi özellikleri direk red/24 gibi vermek mantiksiz oldugu icin böyle yapariz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: iconSize.iconSmall,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              color: iconColors.froly,
              size: IconSizes.iconSmall2x,
            )),
      ]),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
  //static verir isek 2. butondaki gibi tanımlayabiliriz
  static const double iconSmall2x = 80;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
