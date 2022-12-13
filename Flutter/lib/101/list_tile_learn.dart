import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final imgUrl = 'https://picsum.photos/200/300';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        //columnu paddingle sarmalıyoruz
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          //ListTile'ı card ile sarıp daha hoş bir görüntüye sahip olabiliriz.
          //wrap with widget iyip widget yerine Card yazıyoruz.
          //Daha sonra Listtile'a bir kez daha padding veriyoruz ve bosluk bırakmıs oluyoruz.
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  onTap: () {}, //tıklama özelliği ekledik
                  dense: true,
                  //dense kendi paddinglerini silip companentleri olabildigince sıkıstırmaya yarıyor
                  title: const RandomImage(),
                  //burada direk Image.network yerine core'a actıgımız RandomImage'i cagırdık
                  //core = her yerde kullanılan projeye özgü olmayan. başka projelerde de kullanabildigimiz
                  //product = projeye özgü olan
                  subtitle: const Text('Subtitle Subtitle'),
                  //leading sol--baş
                  //container ile sarıp aligment sayesinde dikeyde konumlandırabiliriz
                  leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 30, //listtile'ın hepsini kaplamasın diye
                      child: const Icon(Icons.money)),
                  //trailing sağ--kuyruk
                  trailing: const Icon(Icons.chevron_right)),
            ),
          ),
        ]),
      ),
    );
  }
}
