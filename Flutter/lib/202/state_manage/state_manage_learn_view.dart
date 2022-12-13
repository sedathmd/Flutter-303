import 'package:flutter/material.dart';
import 'state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({Key? key}) : super(key: key);

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

//buradaki normal extends'i state_learn_view_modele extends ederiz
//state_learn_view_modeldeki abstract sınıfı burada extends ederiz
//böylece bu sayfada sadece build methodu kalır ve temiz bir kod elde ederiz
class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisible();
          changeOpacity();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.amber : Colors.grey,
      ),
    );
  }
}
