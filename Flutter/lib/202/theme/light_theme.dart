import 'package:flutter/material.dart';

class LightTheme {
  //ThemeData theme = ThemeData.light().copyWith(x);  //normalde böyle yazıp x yerinde belirlerdik ama
  //fontfamily vb. seylere böyle erisemeyiz. O yüzden alttaki gibi yaparız

  final _lightColor = _LightColor();
  late ThemeData theme; //colordan sonra alması icin late veririz.
  // Debug aşamasında final vermeyiz En son final verirsek daha iyi olur

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.purple),
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 35, color: _lightColor._textColor)),
        colorScheme: const ColorScheme.light(),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
                onPrimary: Colors.brown, onSecondary: _lightColor.blueMania)),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.green),
            side: const BorderSide(color: Colors.purple)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 88, 10, 231);
  final Color blueMania = const Color.fromARGB(95, 188, 248, 1);
}
