import 'package:flutter/material.dart';
import 'navigate_detail_learn.dart';

//8--1.26/1.43
//sayfalar ve widgetlar arası veri transferi yaptıgımız yer
class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  //alttaki sınıfı dahil etmek icin with ile buraya veririz
  //hangi placeholderların secili oldugunu tutmak icin selectedItems adında bos bir array olustururuz
  List<int> selectedItems = [];
  //secilileri ekliyoruz.
  void addSelected(int index, bool isAdd) {
    setState(() {
      //eklenmiş degil ise ekle yoksa sil
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          //placeholderlara tıklayacagımız icin textbutton ile sarmalayıyoruz
          return TextButton(
              onPressed: () async {
                final response = await navigateToWidgetNormal<bool>(
                    context,
                    NavigateDetailLearn(
                      isOkey: selectedItems.contains(index),
                    ));
                if (response is bool) {
                  addSelected(index, response);
                }
              },
              child: Placeholder(
                  color: selectedItems.contains(index)
                      ? Colors.green
                      : Colors.red));
          //selecteditems'da varsa yesil yoksa kırmızı
        },
      ),

      //buradan yukarısı pop ile alakalı. Assagısı push ile
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_rounded),
        onPressed: () {
          navigateToWidget(context, const NavigateDetailLearn());
        },
      ),
    );
  }
}

mixin NavigatorManager {
  //sürekli entegre etmemek icin class yerine mixin yaparız. Constructrsız bir class haline getiririz
  void navigateToWidget(BuildContext context, Widget widget) {
    //contexti ve hangi widget'a gitmek istedigini
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      //fullscreenDialog: false,  //geri dönerken geri işareti degil de çarpı olur.
      //settings: const RouteSettings() //içerisine sayfanın adını veya argument vererek dinamik olarak yollayabiliyoruz.
    ));
  }

  //buradan aşşagısı pop icin yukarısı pop ile alakalı
  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    //contexti ve hangi widget'a gitmek istedigini
    //yan sayfadan bize bir data gelecegi icin alttakini return ederiz. yukarıda void yerine ise generic yani <T> VERİRİZ .PUSHDA DA VERİRİZ
    return Navigator.of(context).push<T>(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }
}
