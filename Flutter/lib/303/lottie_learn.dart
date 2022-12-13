import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/constant/duration_items.dart';
import 'package:flutter_application_1/product/constant/lottie_items.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../product/navigate/navigate_routes.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  //alttaki vsync icin tickerproviderstatemixin verdik
  late AnimationController controller;
  bool isLight = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    navigateToHome(); //navigate'den geldi
  }

  //************************************************** */
  //bu ara taraf navigate ile alakalı
  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
    //pushReplacementNamed yerine pushNamed yapsaydık
    //gittigimiz sayfadan geri tusu ile geri gelebilirdik
  }

  //*************************************************** */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              //0.5 yarısı kadar animate
              isLight = !isLight;
              //get package'ı ile theme degistirdim
              Get.isDarkMode
                  ? Get.changeThemeMode(ThemeMode.light)
                  : Get.changeThemeMode(ThemeMode.dark);
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath,
                repeat: false, controller: controller),
          ),
          const LoadingLottie()
        ],
      ),
      //,
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loadingLottie =
      'https://assets10.lottiefiles.com/packages/lf20_p8bfn5to.json';
  @override
  Widget build(BuildContext context) {
    //aynı img gibi böyle de verebiliriz asset altına verip assetten de kullanabiliriz.
    //appbardaki gibi
    return Center(child: Lottie.network(_loadingLottie));
  }
}
