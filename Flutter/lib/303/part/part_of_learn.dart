import 'package:flutter/material.dart';
//part of yaptıgımız widget'i part ediyoruz
part './part_appbar.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

//kısa olsa extract method uzunsa extract widget daha uzunsa part of
class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartOfAppBar(),
    );
  }
}
