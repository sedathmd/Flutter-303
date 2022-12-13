import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({super.key, required this.id});
//bir id ile gelmesini saglıyoruz
  final String? id;
  @override
  State<NavigateHomeDetailView> createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
  String? _id;
  @override
  void initState() {
    super.initState();

    //navigate home'dan gelen arguments'i oku eger string'se veya varsa _id esitle
    //degilse navigate routes'da verdigimiz widget id ye esitle
    Future.microtask(() {
      final _modelId = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        _id = _modelId is String ? _modelId : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}
