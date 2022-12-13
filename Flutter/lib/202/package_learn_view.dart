import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/Package/launch_mixin.dart';
import 'package:flutter_application_1/202/Package/loading_bar.dart';

class PackageLearn extends StatefulWidget {
  const PackageLearn({super.key});

  @override
  State<PackageLearn> createState() => _PackageLearnState();
}

class _PackageLearnState extends State<PackageLearn>
    with TickerProviderStateMixin, LaunchMixin {
  //package icerisinde alt tarafta vsync oldugu zaman with ile bunu vermemiz gerekir!!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
            backgroundColor:
                Theme.of(context).buttonTheme.colorScheme?.onPrimary,
            onPressed: () {
              launchURL('https://pub.dev/packages');
              //launch_mixinden geliyor
            }),
        body:
            //loading_bar'dan geliyor
            const LoadingBar(size: 50));
  }
}
