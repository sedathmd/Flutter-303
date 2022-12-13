import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obsureText = '#'; //yıldız yerine gelecek karakter
  bool _isSecure = true;

  //secure durumunu her cagırdıgımızda degistir
  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword, //klavye bicimi
        obscureText: _isSecure, //şifreyi yıldızlı gösterme
        obscuringCharacter:
            _obsureText, //yıldızı farklı bir karakterle degistirme
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: 'password',
            //suffix sağa prefix sola ekler
            suffix:
                _onVisibilityIcon())); //visibility ise gözü kapat degilse ac
  }

  //extract method yaptık
  IconButton _onVisibilityIcon() {
    return IconButton(
        onPressed: () {
          _changeLoading();
        },
        //icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off)
        //üstteki satır yerine animated da yapabiliriz
        //burada önemli degil ama animated yapısı bu sekilde
        icon: AnimatedCrossFade(
            firstChild: const Icon(Icons.visibility_outlined),
            secondChild: const Icon(Icons.visibility_off_outlined),
            crossFadeState: _isSecure
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(seconds: 2)));
  }
}
