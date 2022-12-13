import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});

  final _tittle = 'Create your first note';
  final _description = 'Add a note';
  final _createNote = 'Create a note';
  final _importNote = 'Import Note';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.dark),
      //tanımladıgımız padding ile columnu sarıyoruz
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(children: [
          PngImage(name: ImageItems().appleBookWithoutPath),
          // Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black, fontWeight: FontWeight.w600 ))
          //yukarıdaki şekilde yazıp ctrl nokta ile extract widget deriz
          _TittleWidget(tittle: _tittle),
          //burda padding ile sardık cünkü baslık ile metin arasına baslik koymak icin
          Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTittleWidget(tittle: _description * 10)),
          // _SubTittleWidget(TextAlign: TextAling.right) gibi de yazıp defaultun disina cikabiliriz

          const Spacer(), //boşluk bırakmaya yarıyor daha sonra ögrenilecek

          _createButton(context),

          TextButton(onPressed: () {}, child: Text(_importNote)),

          const SizedBox(height: 20)
        ]),
      ),
    );
  }

  //--------------------------------------------------------------------------------------------------------------------------------
  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            height: ButtonHeight.buttonNormalHeight,
            child: Center(
                child: Text(_createNote,
                    style: Theme.of(context).textTheme.headline5))));
  }
}

class _SubTittleWidget extends StatelessWidget {
  //final String tittle yaptigimiz icin alttakine ctrl nokta yapip add final field for parametres deriz
  const _SubTittleWidget(
      {Key? key, this.textAlign = TextAlign.center, required this.tittle})
      : super(key: key);
  //burada final ile verir yukarıda this.textAlign = TextAling.center
  //dedigimiz icin en üstte texti olustururken belirtmezsek varsayılan center olur.
  //belirtirsek belirttigimiz bicimde olur.
  final TextAlign textAlign;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Text(tittle,
        //textAlign : TextAlign.center yerine böyle yazarız
        textAlign: textAlign,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w300));
  }
}

//------------------------------------------------------------------
class _TittleWidget extends StatelessWidget {
  const _TittleWidget({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Text(tittle,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600));
  }
}

//padding tanımlıyoruz
class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 14);
}

//image_learn'dan aldık
class ImageItems {
  final String appleBookWithoutPath = "deneme-apple";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/png/$name.png', fit: BoxFit.contain);
  }
}

class ButtonHeight {
  static const double buttonNormalHeight = 50;
}
