// import 'package:flutter_test/flutter_test.dart';
// void main() {
//   setUp(() {});
//   test('Sample Test', () {});
// }

//Test ekranı icin sonu test klasörü icerisinde
//sonu test ile biten bir file acıyoruz ve yukarıdaki kodu yazıyoruz

import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

//debug'a basarak test edebiliriz
void main() {
  setUp(() {});
  test('User Calculate', () {
    final users = [
      GenericUser('Sedat1', '1', 50),
      GenericUser('Sedat2', '2', 60),
      GenericUser('Sedat3', '3', 70),
    ];

    //final result = UserManagement().calculateMoney(users);
    //normalde yukarıdaki gibi ama sadece adminUser'dan erisilmesi icin
    final result =
        UserManagement(AdminUser('Sedat', '1', 10, 1)).calculateMoney(users);
    //rolü 1 dışında bir sey gelirse toplamaz

    expect(result, 190);
    //beklenen sonuc 180
  });
}
