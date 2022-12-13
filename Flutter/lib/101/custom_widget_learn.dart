import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String tittle = 'Deneme';
  final String tittle2 = 'Deneme2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //custom companent yaparken dışardan konumu daima bunu cagiran alan belirlemelidir.CustomFoodButtonu padding ile sararız.
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //sayfanın başından başlatır
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            //mediaquery ile sayfanın eni kadar buton yapıyoruz.
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                //child: CustomFoodButton(tittle: tittle)),  böyleyken assagida onPressed tanımlandıgımız icin onPressed veririz
                child: CustomFoodButton(
                  tittle: tittle,
                  onPressed: () {},
                )),
          )),
          const SizedBox(height: 100),
          //CustomFoodButton(tittle: tittle2)
          CustomFoodButton(
            tittle: tittle2,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  //with ile dahil ediyoruz. Buraya dahil ediyoruz ki yukarda kullanıp bütün sayfaya eklememiş oluyoruz.Sadece butonlara
  CustomFoodButton({
    Key? key,
    required this.tittle,
    required this.onPressed,
  }) : super(key: key);

  final String tittle;
  final void Function() onPressed; //onPressed
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: normal2xPadding,
          child: Text(tittle,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: whiteColor)),
        ));
  }
}

//burayı statelesswidget de dahil ediyoruz.
class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}
