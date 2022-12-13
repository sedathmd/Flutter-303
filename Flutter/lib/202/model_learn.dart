//nullable yapıp boş kalabilir diyebiliriz
class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

//constructor olusturup bu variable'lar uygulama olustugunda gelicek diyebiliriz
class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

//final yapıp bu variable'lar sadece constructor zamanında gelebilir diyebiliriz
class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

//yukarıdaki ile benzer ama sadece isimlendirilmiş parametre alır. localde islem yapıyorsak en mantıklısı bu
class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}

//variable'ları private yapıp kullanıcıdan alır ve başka yerde kullanmayız
class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  //private oldugu icin model_learn_view'den ancak böyle yaparsak erisebiliriz
  int get userId => _userId;
  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

//sonradan constructor anında gelicek demektir. Diger zamanlarda esitleme yaparsak hata alırız.
class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//required vermek yerine defaul bir deger veririz.
class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//service tabanlı calısıyosak en mantıklısı bu
class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  //builder icerisinde button ile deger atama/degistirmek icin alttakini ekleriz

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
