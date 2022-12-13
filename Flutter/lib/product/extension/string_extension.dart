extension ColorStringExtension on String? {
  int get colorValue {
    var _newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.parse(_newColor);
  }
}
//303 view/ reqres_view.dart serviceden rengin basındaki # kaldırılıp 0xff 
//formatına cevrilir. Globalde kullanmak icin burda yazılır. 
//yoksa resource_model.dartta yapılabilir. 
//this burada color parametresini ifade eder