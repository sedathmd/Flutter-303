import 'package:flutter/material.dart';

import '../product/counter_hello_button.dart';

//stateless olusturup extends ... nın üzerine tıklanıp convert to statefull yapılır
class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});
  //degişmez bir widget'tır ve dısarıdan al ver islemlerini yapar
  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  //asıl islemlerimizi yaptıgımız yer
  //altı yaptıktan sonra burada methodları tanımlıyoruz

  int _countValue = 0;
  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {
      //set state yaptik. Çünkü içerisindeki her tetiklendiginde build methodu tekrar calısır
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      //floatinActionButtonu row ile sarıp yanına bir tane daha koyduk
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min, //aynı oranda sıkıştırması için
        children: [
          _incrementButton(), //tanımladıktan sonra extract methodla aşşagıya alıyoruz
          _deincrementButton()
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            _countValue.toString(),
            style: Theme.of(context).textTheme.headline2,
          )),

          //---------------------------------------------------------
          //2.örnek butona tıklandıkca arttırıyor
          const Placeholder(),
          //diger kodların tekrar tekrar calısmaması ve performans icin product icerisinde yazılır ve burada cagırılır
          const CounterHelloButton()
          //-------------------------------------------------------------
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true); //yukarıdaki methodu cagırdık ve true verdik
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        //soluna 10 padding atark bosluk bıraktık
        onPressed: () {
          _updateCounter(false); //yukarıdaki methodu cagırdık ve false verdik
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
