import 'package:flutter/material.dart';

//8--1.26/1.43
//navigation_learn --- pop
class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn(
      {super.key, this.isOkey = false}); //göndermezse default'u false
  final bool isOkey;
  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton.icon(
              //bu butona basılınca diger sayfadaki placeholder kırmızıysa yeşil yeşilse kırmızı yapar
              onPressed: () {
                //basılınca boolean bir deger gönderiyor
                Navigator.of(context).pop(!widget.isOkey);
                //basta true gönderecegimiz icin widget.isokey'in tersini yollarız
              },
              //okeyse ve degilse alttakileri yapıyor
              icon: Icon(Icons.check,
                  color: widget.isOkey ? Colors.red : Colors.green),
              label: widget.isOkey ? const Text('red') : const Text('onayla'))),
    );
  }
}
