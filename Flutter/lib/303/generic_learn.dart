//TEST KISMI TEST KLASORUNDEKI user_manager_test

//normal class'dan bu hale cevirdik cünkü sadece
//admin classından erisilmesini istiyoruz
class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  int calculateMoney(List<GenericUser> users) {
    //adminUserın rolü 1 se topla degilse toplama
    int initialValue = admin.role == 1 ? admin.money : 0;
    //1. yöntem
    final sumMoney = users.map((e) => e.money).fold<int>(
        initialValue, (previousValue, element) => previousValue + element);
    //2. yöntem
    final _sum = users.fold<int>(initialValue,
        (previousValue, element) => previousValue + element.money);
    return sumMoney;
  }
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

//userManagent class'ını sadece AdminUser
//kullanıcılarının kullanmasına izin vermek icin
class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
