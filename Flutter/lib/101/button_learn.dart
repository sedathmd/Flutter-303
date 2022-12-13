import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //1.buton çesidi
        //bütün butonların onPressed'ini null yapinca tasarımı degisir ve basılamaz.
        const TextButton(onPressed: null, child: const Text('Save')),
        //2.buton çeşidi
        //texti özelleştirme ve butonu radius borderlı yapma
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: () {},
            child:
                Text('Delete', style: Theme.of(context).textTheme.subtitle1)),
        //3.buton çeşidi
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc_outlined)),
        const SizedBox(height: 10), //butonlar arasına boşluk bırakma
        //4.buton çeşidi
        //butona işlev atama onpressed içerisine yapilir
        FloatingActionButton(
            onPressed: () {
              // servise istek at
              // sayfanin rengini duzenle vb..
            },
            child: const Icon(Icons.add)),
        //5.buton çeşidi
        //butonu özellestirme
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red, padding: const EdgeInsets.all(10)),
            //shape: const CircleBorder()  //bu da style içerisinde yazılabilir.
            onPressed: () {},
            child: const SizedBox(width: 200, child: Text('data'))),
        //ikon ve texti aynı anda kullanma
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text('data')),
        //custom button
        InkWell(
          onTap: () {},
          child: const Text('data'),
        ),
        Container(
          //araya bi container attik
          height: 100,
          color: Colors.white,
        ),

        //butonların içinde padding bırakma
        ElevatedButton(
          onPressed: () {},
          child: const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, right: 40, left: 40),
              child: Text('Place Bid')),
        ),
      ]),
    );
  }
}


// Borders:
// CircleBorder(), RoundedRectangleBorder()