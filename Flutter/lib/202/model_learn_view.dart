import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  // DENEME appbara yazdırma
  //final user9 = PostModel8(body: 'body');
  //normalde yukarıdaki gibi ama butona basınca deger ataması yapmak icin final yerine normal variable yaparız
  PostModel8 user9 = PostModel8(body: 'body');
  //-----------------------------------------------------
  //model_learn dekileri burada tanımlıyoruz
  @override
  void initState() {
    super.initState();

    final user1 = PostModel1();
    user1.userId = 5028;

    final user2 = PostModel2(5028, 28, 'title', 'body');
    //ya da yukardaki gibi de yapabiliriz
    user2.userId = 5028;

    final user3 = PostModel3(5028, 28, 'title', 'body');
    //model_learnde postmodel3 ü final olarak atadıgımız icin yukarıdakiler gibi sonradan veremeyiz

    final user4 =
        PostModel4(userId: 5028, id: 28, title: 'title', body: 'body');
    //yukarıdakine benzer ama sadece isimlendirilmiş.Az alan varsa kullanılması en mantıklı olan

    final user5 =
        PostModel5(userId: 5028, id: 28, title: 'title', body: 'body');
    //user5. yapınca icersindekiler göremiyoruz cünkü private
    //erismek icin model_learn icerisinde int get userId => _userId; seklinde yazıp erisebiliriz.

    final user6 =
        PostModel6(userId: 5028, id: 28, title: 'title', body: 'body');
    //yukardaki ile benzer ama sadece constructor anında verildigi icin sonradan erisilemez
  }

  final user7 = PostModel7();
  //default degerleri vardır o yüzden vermemize gerek yok. Private oldugu icin erisemiyoruz

  final user8 = PostModel8();
  //nullable oldugu icin vermeye gerek yok. ama 4-5-6 daki gibi verebiliriz de. Service'den data cekeriz.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              user9 = user9.copyWith(title: 'title');
              //copywith ile degistirirz cünkü normal degistirsek bir variable'ı degistirince kullanıcının tüm verileri gider.
            });
          },
        ),
        appBar: AppBar(title: Text(user9.body ?? 'Not has any data')));
    //sayfanın üstünde kullanıcıyı tanımlarken bodysini verdigimiz icin burada '' icini bos bırakırız.
    //Tanımlamadıgımız bi seyi yazdırmak icin burada '' icinde tanımlayabiliriz
  }
}
