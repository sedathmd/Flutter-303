import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/sheet_learn.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> with ProjectSheetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
              context: context,
              //barrierDismissible: false,
              //barrierDismissible false yapınca dialog icerisinden yanlara tıklayarak cıkılamaz
              builder: (context) {
                //1. yöntem
                //return const _UpdateDialog();
                //2. yöntem
                //return UpdateDialog(context: context);
                //3.örnek
                return const _ImageZoomDialog();
              });
          inspect(response);
          //update'e bastıysak true basmadıysak null
        },
      ),
    );
  }
}

//1. yöntem yukarıda yazıp extract widget
class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: const Text('Version Update'), actions: [
      ElevatedButton(
          onPressed: () {
            //buraya verdigimiz islevi yapar
            Navigator.pop(context, true);
            //geriye true döndürüyor
          },
          child: const Text('update')),
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('close'))
    ]);
  }
}

//2. yöntem stateless widget'dana extends etmek yerine direk AlertDialog'dan edersek daha performanslı olur
class Keys {
  static const versionUpdate = 'Version update';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Update2'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
}

//3. örnek Image zoomlama
class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.zero,
        //padding'i sıfırladık
        //Image'ı InteractiveViewer ile sarmalarsak cift parmakla kaydırarark zoomlama özelligi kazandirabiliriz
        child: InteractiveViewer(
            child: Image.network(_url,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.6)));
  }
}
