import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/card_learn.dart';
import 'package:flutter_application_1/101/container_sizedbox_learn.dart';
import 'package:flutter_application_1/101/icon_learn.dart';

import '../303/feed_view.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  //lttaki vsyn icin with ile bunu veriyoruz
  late final TabController _tabController;
  final double notchValue = 10;
  //butona tıkladıgında fonksiyon atamak icin
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
    //vsync yerine this yazıp with ile yukarıdakini veriyoruz
  }

  @override
  Widget build(BuildContext context) {
    //scaffoldu DeafulttabController icerisine yazariz
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        //bodysindeki özelligi appbara da verebiliriz
        appBar: AppBar(
            // bottom: const TabBar(tabs: [Tab(text: 'Page1'), Tab(text: 'Page1')])
            ),
        //bottomnavigation bara da verebiliriz
        bottomNavigationBar: BottomAppBar(
            shape:
                const CircularNotchedRectangle(), //floating action buttonun cevresini belirginlestirme Mainde de bottomAppbarTheme ile verebiliriz
            notchMargin: notchValue,
            //floating actiona margin verme. Mainde de bottomAppbarTheme ile verebiliriz
            child: _myTabView()),

        //ortaya floatingactionbutton
        floatingActionButton: FloatingActionButton(onPressed: () {
          _tabController.animateTo(_MyTabViews.home.index); //0.sayfa
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true, //bununla da yukarıdaki margini seffaf yapıyoruz

        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        indicatorColor: Colors.white,
        //secili sayfanın altındaki cizginin rengi
        labelColor: Colors.red,
        unselectedLabelColor: Colors.green,
        //secili ve secili olmayanların label colorını belirtebiliriz
        controller: _tabController, //controlleri buraya ve assagiya veriyoruz
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        //ekranı kaydırarak geçmeyi kapatır
        controller: _tabController,
        //bunu verince floatingactionbuttondan  burayı kontrol edebiliyoruz. daha sonra floatingaction'ın onpressedine veriyoruz
        children: [
          const FeedView(),
          IconLearnView(),
          const CardLearn(),
          const ContainerSizedBoxLearn()
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}

//genelde bir projede bir cesit tabbar oldugu icin mainde de tabBarTheme: TabBarTheme() şeklinde özellestirebiliriz