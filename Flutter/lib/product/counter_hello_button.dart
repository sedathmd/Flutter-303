import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

//bu buton sadece projeye özgü bir sey oldugu icin product'ın altına yazılır
class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});
  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _countCustom = 0;
  final String _welcomeTittle = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++_countCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _updateCounter();
        },
        child: Text('$_welcomeTittle $_countCustom'));
  }
}
