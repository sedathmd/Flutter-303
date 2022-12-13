import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/container_sizedbox_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold uygulamanın iskeletidir. Appbar body ve bottomdan olusur
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold'),
      ),
      body: const Text('merhaba'),
      backgroundColor: Colors.purple,
      floatingActionButton: FloatingActionButton(
        //tıklanan buton ekliyoruz
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    height: 200,
                  )); //butona tıklandıgına belirtilen ölcüde container aciyor
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //butonun konumunu belirliyoruz
      drawer: const Drawer(), //3 cizgili yan bar aciyor
      bottomNavigationBar: Container(
        //üstteki 2si gibi yapip sonradan container ile sarıyoruz height atmak icin
        height:
            70, //decoration vs verip yan sınıftan method çekebiliriz ProjectContainerDecoration gibi
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          //alt bara item ekliyoruz
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'a')
        ]),
      ),
    );
  }
}
