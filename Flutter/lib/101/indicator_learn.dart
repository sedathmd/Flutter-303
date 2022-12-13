import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: const [
          CenterCircularProgress()
        ]), //alttaki gibi yapıp center ile sarmaladıktan sonra wrap widget yaparız
        body: const Center(child: CircularProgressIndicator()));
    //bir diger seçenek de lineer progress indicator'dır
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        //color: Colors.white10,  //bütün projede ayni indicator kullanacagımız icin mainde tanımlarız
        strokeWidth: 6, //kalınlıgı
        //value: 0.8,       //yükleme ekranlarında ne kadarının doldugunu göstermeye yarayan
      ),
    );
  }
}
