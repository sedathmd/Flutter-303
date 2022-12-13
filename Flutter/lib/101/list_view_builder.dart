import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //list view learndeki gibi yaparsak program hatalar verebilir. Engellemek icin listview.builder kullanılır
      body: ListView.separated(
        //seperated yerine builder yazdıgımızda itemBuilder sonrası vardı. Seperatede cevirince aradaki ve en alttaki itemcount geldi
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.white);
        },
        itemBuilder: (context, index) {
          print(index); //check için
          //eğer ilk calıstıgında 15ini birden görüyosa columnu sizedbox ile sarmalayı height atiyoruz ve image'i expanded ile sarmalıyoruz
          return SizedBox(
            height: 200,
            child: Column(children: [
              Expanded(child: Image.network('https://picsum.photos/200')),
              Text('$index')
            ]),
          );
        },
        itemCount: 15, //indexi sınırlar. 14 den sonra daha fazla gitmez.
      ),
    );
  }
}
