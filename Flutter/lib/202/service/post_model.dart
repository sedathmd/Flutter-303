//postman- postitems'dan sadece bir modeli alıp json to dart sitesinden convert edip buraya yapıştırıyoruz
//daha sonra gereksiz seyleri siliyoruz
class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  //alt tarafa kod yazılmayacagı icin bir seyi update edecegimiz zaman burada func'larla yaparız

  //burada postmandan gelen mapleri atama yapıyoruz
  //buraya kod yazılmaz
  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  //burada dataları doldurup service'e yolluyoruz
  //buraya kod yazılmaz
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
