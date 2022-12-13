import 'package:url_launcher/url_launcher.dart';

//https://pub.dev/packages/url_launcher
mixin LaunchMixin {
  void launchURL(String url) async {
    //orjinalinde launchUrl olması gerekirken launch yapariz
    if (!await launch(url)) {}
    throw 'Could not launch $url';
  }
}
