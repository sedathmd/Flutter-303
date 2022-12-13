import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({super.key, required this.message});
  //yalnız bir kere calisacagi icin burada yazılır
  //dısaridan message gelicek gelen mesaj tek harfli ise tek cift ise cift yazdıracak  // odd tek even cift
  //main.dart'da sayfayı cagirirken parantez icersinde message=('.....')
  final String message;

  @override
  State<StatefullLifeCycleLearn> createState() =>
      _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  //bos _message olsuturuyoruz
  String _message = '';
  late final bool _isOdd;

  //1. lifecyle : bu bittikten sonra build metodu cagirilir.
  @override
  void initState() {
    super.initState();
    //burdan sonra yazdıklarımızı içerisine yapar
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName(); //method olarak cikariyoruz alttaki ortaya cikiyor. initstate 1 kez calistigi icin
  }

  void _computeName() {
    if (_isOdd) {
      _message += " Cift";
    } else {
      _message += " Tek";
    }
  }

  //2. lifecycle
  @override
  void didChangeDependencies() {
    //initstate'e benzer ama daha sonra çalısır. Cok fazla kullanılmaz!!!!
    super.didChangeDependencies();
  }

  //3. lifecycle
  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    //main.dart'tan gönderilen widget degistiginde calısır
    super.didUpdateWidget(oldWidget);
  }

  //4. lifecycle
  @override
  void dispose() {
    //sayfadan cikmadan önce yıkıcı method gibi calısır.
    super.dispose();
    _message = '';
    //message'ı null'a cektik
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      /*title: widget.message.length.isOdd? const Text('Tek'): const Text('Cift')*/ //bu appbarin icersine yazılabilirdi
      body: widget.message.length.isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
