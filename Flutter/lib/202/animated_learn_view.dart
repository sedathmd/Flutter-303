import 'package:flutter/material.dart';

const double kZero = 0; //cok nadiren buraya yazılır fazla kullanıldıgı icin

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
    //vsync oldugu icin with ile yukarıda TickerProviderStateMixin  veriyoruz ve vsync: this yapıyoruz
    //en son duration veriyoruz
  }

  //butona basinca widget degistirme floating action buttonda appbar icersinde
  bool _isVisible = false;
  //butona basinca opacity degistirme Iconbuttonda body icerisinde
  bool _isOpacity = false;
  late AnimationController controller; //animatedIcon icin
  //controller varsa init state vardır diyi yukarıda veriyoruz

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _placeHolderWidget()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //placeholder widget icin
            _changeVisible();
            //animatedIcon icin
            controller.animateTo(_isVisible ? 1 : 0);
          },
        ),
        body: Column(
          children: [
            ListTile(
              //burda title'n içindeki texti animatedd opacity ile sarıp duration veriyoruz.
              title: AnimatedOpacity(
                  duration: _DurationItems.durationLow,
                  opacity: _isOpacity ? 1 : 0,
                  child: const Text('Change Opacity')),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.precision_manufacturing_outlined)),
            ),
            AnimatedDefaultTextStyle(
                child: const Text('data'),
                style: (_isVisible
                        ? context.textTheme().headline1
                        : context.textTheme().subtitle1) ??
                    const TextStyle(),
                //en sonda ?? const TextStyle() vermemizin sebebi temadan gelenlerin hep null gelmesinden dolayı
                duration: _DurationItems.durationLow),
            //animatedIcon initstate ve controller lazım
            AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
            //yanlara container genisletme
            AnimatedContainer(
              duration: _DurationItems.durationLow,
              height:
                  _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.height * 0.2,
              color: Colors.blue,
              margin: const EdgeInsets.all(5),
            ),
            //hata vermemesi icin expanded icerisinde
            Expanded(
                child: Stack(
              children: const [
                AnimatedPositioned(
                    //yukarıdan assagıya animasyonla 10
                    top: 10,
                    curve: Curves.elasticOut,
                    child: Text('data'),
                    duration: _DurationItems.durationLow)
              ],
            ))
          ],
        ));
  }

  //animated placeholder yapıp appbar'ın title'ına verdik
  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        duration: _DurationItems.durationLow,
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond);
  }
}

//textTheme'yı extension yapıyoruz.
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
