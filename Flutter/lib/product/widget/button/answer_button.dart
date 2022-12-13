import 'dart:math';
import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, this.onNumber});

  //required yapmazsak (int number)? yapmamız lazım
  //bool tipi geri dönüs
  final bool Function(int number)? onNumber;
  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _backgroundColor),
      onPressed: () {
        //10a kadar ramdom sayı üretiyor
        final result = Random().nextInt(10);
        //bos gelmezse true ver.
        //Callbacklearnden random gelen sayının 3e bölümünden kalan 1 se geri döner
        final response = widget.onNumber?.call(result) ?? false;
        setState(() {
          _backgroundColor = response ? Colors.green : Colors.red;
        });
      },
      child: const Text('Press'),
    );
  }
}
