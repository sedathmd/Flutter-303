import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//https://pub.dev/packages/flutter_spinkit
//package'ları böyle ayrı sayfalarda tanımlamalıyız
class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key, this.size}) : super(key: key);
  final double? size;
  final _defaultSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      color: Colors.red,
      size: size ?? _defaultSize,
    );
  }
}
