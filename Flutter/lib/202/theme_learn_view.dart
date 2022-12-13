import 'package:flutter/material.dart';

import '../demos/password_text_field.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          const PasswordTextField(), //burası password_text_field.dart icin
          //checkbox ve text'i light_theme'da özelleştiriyoruz
          CheckboxListTile(
            value: true,
            onChanged: (val) {},
            title: const Text('select'),
          ),
          Text('Hosgeldiniz', style: Theme.of(context).textTheme.subtitle1)
        ]));
  }
}
