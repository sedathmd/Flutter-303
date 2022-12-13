import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/app_bar_learn.dart';
import 'package:flutter_application_1/101/icon_learn.dart';
import 'package:flutter_application_1/101/image_learn.dart';
import 'package:flutter_application_1/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
//pagecontrolleri globale taşıyoruz.yani buraya
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //basıldıgında sağdaki ve soldaki sayfalara götüren buttonlar
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //hangi sayfada oldugumuzu takip etme
          Padding(
            //biraz sağa getirmek için padding attık
            padding: const EdgeInsets.only(left: 30),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(), //butonlar ile arasını açma

          FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: _DurationUtility._durationLow, //altta tanımladık
                    curve: Curves.slowMiddle);
                //pagecontroller kendisi statefull bir widget oldugu icin setstate yapmaya gerek yok
              },
              child: const Icon(Icons.chevron_left)),

          FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: _DurationUtility._durationLow,
                    curve: Curves.slowMiddle);
              },
              child: const Icon(Icons.chevron_right)),
        ],
      ),
      appBar: AppBar(),
      //bu kez body'ye PageView veriyoruz
      //sayfalar arası gecisleri vb yapmamızı saglar. Slider mantıgı
      body: PageView(
          //controller sayesinde datayı alabiliriz
          controller: _pageController,
          //bir sonraki sayfanın %30unu önizlememizi saglar.Yukarı tasıdık (globale)
          //onpagechanged ise datanın degisikligini veriyor
          onPageChanged:
              _updatePageIndex, // (int index) {}, sağ tarafa bunun yerine sağdaki yazılır.Yukarda tanımladıgımız icin
          children: [
            const ImageLearn(),
            IconLearnView(),
            const StackLearn(),
            const AppBarLearnView()
          ]),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
  //yukarıda next ve previous page icerisinde sağdaki gibi tanımlanıyordu
}
