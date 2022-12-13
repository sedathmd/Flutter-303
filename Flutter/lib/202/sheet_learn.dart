import 'package:flutter/material.dart';
import '../101/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});
  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

//artik mixin'i verdigimiz yerde cagirabiliriz
class _SheetLearnState extends State<SheetLearn> with ProjectSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return _CustomSheet(backgroundColor: _backgroundColor);
              });
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.lime;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
      //baska sayfalardan böyle kolaylıkla cagırabiliriz
      body: Center(
          child: TextButton(
              onPressed: () {
                showCustomSheet(context, const ListViewLearn());
              },
              child: const Text('Show'))),
    );
  }
}

//extract widget demek icin setstate'i yorum satırı yapıp öyle yapıyoruz
//daha sonra statefull widget'a cevirip öyle setstate'i acıyoruz
class _CustomSheet extends StatefulWidget {
  const _CustomSheet({Key? key, required Color backgroundColor})
      : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.deepOrangeAccent;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Column(
        //mainaxisi min yaptıgımız icin yukarıdaki isScrollControlled: true calısmıyor
        mainAxisSize: MainAxisSize.min,
        children: [
          //divider bottom sheet üzerindeki siyah cizgi
          Divider(
            color: Colors.black26,
            thickness: 3,
            //indent soldan endindent sağdan bosluk
            indent: MediaQuery.of(context).size.width * 0.4,
            endIndent: MediaQuery.of(context).size.width * 0.4,
          ),
          const Text('data'),
          Image.network('https://picsum.photos/200', height: 200),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop<bool>(true);
                //sadece kapatıp deger döndürmeyecekse alttaki de kullanılabilir
                //Navigator.pop(context);
                //builddeki showmodalbottomsheet'e true döndürür
                //üstteki satır butona tıkladıktan sonra bottomsheet'i kapatır
                setState(() {
                  _backgroundColor = Colors.purple;
                });
              },
              child: const Text('OK'))
        ],
      ),
    );
  }
}

//--------------------------------------------------------------------------------------
//bir method property almıyacak ve sadece func'lar üretecekse mixin yaparız
mixin ProjectSheetMixin {
//bu methodu kullanmak isteyen birisi bize buildcontexti vermeli
//customMainSheet'e child verebilecegimiz icin build icerisinde Widget child yaparız
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        context: context,

        //true olunca sheet tam ekran olarak acılır
        isScrollControlled: false,
        builder: (context) {
          //column ile sarmalarsak alabilecegi max degeri alır yoksa min
          //sizedbox ile sararsak ekranın yüzdesi kadar deger verebiliriz
          //height: MediaQuery.of(context).size.height*0.8,    şeklinde
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //safeArea ile sararak bir seyin altında kalmasını engellemek icin bosluk bırakır
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //divider bottom sheet üzerindeki siyah cizgi
          Divider(
            color: Colors.black26,
            thickness: 3,
            //indent soldan endindent sağdan bosluk
            indent: MediaQuery.of(context).size.width * 0.4,
            endIndent: MediaQuery.of(context).size.width * 0.4,
          ),
          //child'ı buraya verdik
          //hata vermemesi icin expanded yaptık
          Expanded(child: child)
        ],
      ),
    );
  }
}
