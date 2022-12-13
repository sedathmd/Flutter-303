import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/widget/button/answer_button.dart';
import 'package:flutter_application_1/product/widget/callback_dropdown.dart';
import '../product/widget/button/loading_button.dart';

//15--- 15/25
class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            //product widget altında olusturdugumuz CallbackDropdown'ı cagırırız
            CallbackDropdown(
              onUserSelected: (CallbackUser user) {
                print(user.name);
                print(user.id);
              },
            ),
            //product widget altında button klasöründeki answerButtonu cagırıyoruz
            //gelen sayının 3 e bölümünden kalan 1 ise true döndürür
            AnswerButton(
              onNumber: (number) {
                return number % 3 == 1;
              },
            ),
            LoadingButton(
                title: 'Save',
                onPressed: () async {
                  //future oldugu icin burada da future veriyoruz
                  await Future.delayed(const Duration(seconds: 1));
                })
          ],
        ));
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  static List<CallbackUser> dummyUsers() {
    return [CallbackUser('Sedat1', 1), CallbackUser('Sedat2', 2)];
  }

//id üzerine tıklayıp generate equality dersek böyle cıkar yoksa elle yazarız
//bunu yapmanın amacı yukarıdakiler aynı referansla cıktıgı icin aynı olarak algılıyo
//bu yaptıgımız sayesinde aynı sayılması icin name ve id'sinin de
//aynı olması gerektigini belirtiriz
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
