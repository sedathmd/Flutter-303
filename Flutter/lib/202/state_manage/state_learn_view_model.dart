import 'package:flutter/material.dart';
import 'state_manage_learn_view.dart';

//animatedlearn'de kullandıgımız methodları buraya verip abstract bir class olustururuz
//normalde statemanagelearn de olan extends kısmını buraya extends ederiz
//ve private olan degiskenleri publice cekeriz
//Daha sonra burayı extends olarak statemanagelearn'e veririz
abstract class StateLearnViewModel extends State<StateManageLearnView> {
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}
