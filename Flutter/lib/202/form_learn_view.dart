import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  //global bir key olusturduk
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        //textformfield'ın textfield'dan farkı validator ile bos gecilememesini saglayabilmemiz
        body: Form(
          //keyi verdik
          key: _key,
          //autovalidateMode sayesinde boş uyarısı gelince eger iceri bi sey yazarsak
          //butona basmayı beklemeden anlık Bu alan bos gecilemez uyarısı gider
          //sildigimizde ise gene anlık olarak gelir
          autovalidateMode: AutovalidateMode.always,
          child: Column(children: [
            //assagıda tanımlı olan sınıfı veriyoruz
            //1. form cesidi
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            //2.form cesidi
            DropdownButtonFormField<String>(
                //value: 'v',    //bu sekilde ilk acıldıgındaki defaultu belirleyebiliriz
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(child: Text('a'), value: 'v'),
                  DropdownMenuItem(child: Text('b'), value: 'v2'),
                  DropdownMenuItem(child: Text('c'), value: 'v3'),
                ],
                onChanged: (value) {}),
            //--------------------------------------------------------------------------------------------------
            ElevatedButton(
                onPressed: () {
                  //elevated butona basınca bir sey olmasını saglamak icin columnu form ile sarıyoruz
                  //daha sonra key olusturuyoruz
                  //basınca textformfield'in validator'una dolu ise true boş ise false gönderiyor
                  if (_key.currentState?.validate() ?? false) {
                    print('Kaydedildi');
                  }
                },
                child: const Text('Save'))
          ]),
        ));
  }
}

//yukarıda validator: yanında yazmak yerine burada validator üzerine gelerek
//String? isNotEmpty(String? data) şeklinde bir class acıyoruz ve icerisinde yukarıda yazdıgımızı atıyoruz
//value? nin anlamı value null'sa false dönecek isNotEmpty calısmayacak
//isNotEmpty ise true dönecek
//true döndügünde null verilir false döndügünde bu alan bos gecilemez denir
class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bos gecilemez';
}
