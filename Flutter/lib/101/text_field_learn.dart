import 'package:flutter/material.dart';

import '../product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
              maxLength: 40, //en fazla 40 karakter
              //prefixIcon başına icon ekler
              //border verip OutlineInputBorder verince etrafını çerçeve içine alıyor
              //label text çerçevenin üzerine yazar. hintText default olarak içine yazar ---> hintText: 'Mail'
              keyboardType: TextInputType.emailAddress,
              //buraya ne girersek onu girmemiz icin klavye acılır. phone girersek rakamlar gibi
              autofocus: true, //proje açılınca direk burada başlar
              focusNode: focusNodeTextFieldOne,
              //1.focus yukarıda tanımladık. TAB TAB mantıgı sıradakine geçer
              textInputAction: TextInputAction.next,
              //focusu bir sonrakine yönlendirir.
              decoration: _InputDecarotor().emailInput //alta çıkarırız
              //fillColor: Colors.white, //arka planını beyaz yapar. Ancak filled'i true yapmamız lazım.
              //filled: true

              ),
          TextField(
              focusNode: focusNodeTextFieldTwo, //2. focus
              minLines: 2,
              maxLines: 4) //textarea tarzı bir şey olusturmus oluyoruz
        ],
      ),
    );
  }
}

//main.dart üzerinden de inputdecorationtheme verebiliriz.
class _InputDecarotor {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );
}
