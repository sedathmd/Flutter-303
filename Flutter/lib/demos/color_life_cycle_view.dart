import 'package:flutter/material.dart';
import 'package:flutter_application_1/demos/color_demo_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({super.key});

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbardaki iconbuttona basınca farkı bir renge dönücek
      appBar: AppBar(actions: [
        IconButton(onPressed: _changeBackground, icon: const Icon(Icons.clear))
      ]),
      body: Column(
        //color demos sayfanın alt yarısındadır
        //color demosu bi sayfa kullanıcagı icin o sayfa colordemos'a bir parametre yollasın
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemos(
            initialColor: _backgroundColor,
          ))
        ],
      ),
    );
  }

  void _changeBackground() {
    setState(() {
      _backgroundColor = Colors.deepPurple;
    });
  }
}
