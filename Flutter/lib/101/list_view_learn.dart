import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            //texti tek satıra sıgdırmak icin
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          const Divider(), //bosluk bırakıyor
          SizedBox(
            height: 300,
            child: ListView(
                //listeyi yatay eksende yapma
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    color: Colors.green,
                    width: 100,
                  ),
                  Container(color: Colors.white, width: 100),
                  Container(color: Colors.green, width: 100),
                  Container(color: Colors.white, width: 100),
                  Container(color: Colors.green, width: 100),
                ]),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),

          //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ikinci list

          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(color: Colors.green, width: 100),
              Container(color: Colors.white, width: 100),
              Container(color: Colors.green, width: 100),
              Container(color: Colors.white, width: 100),
              Container(color: Colors.green, width: 100),
            ]),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          const _ListDemo() //alttaki stfl widgeti cagiririz
        ],
      ),
    );
  }
}

// altta 2. liste girip cıktıgımızı görüyoruz. Girince hello cıkınca exit yazıyor
//ihtiyaca göre sekillendirilir
class _ListDemo extends StatefulWidget {
  const _ListDemo({Key? key}) : super(key: key);

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print('hello');
  }

  @override
  void dispose() {
    super.dispose();
    print('exit');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
