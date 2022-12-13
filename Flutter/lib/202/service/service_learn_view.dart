import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/Service/comment_learn_view.dart';
import 'package:flutter_application_1/202/Service/post_model.dart';
import 'package:flutter_application_1/202/Service/post_service.dart';

//https://pub.dev/packages/dio
class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  //postmodeldeki itemlar icin bir liste olustururuz
  List<PostModel>? _items;
  //sayfa acılırken appbarda dolma efekti
  bool _isLoading = false;
  //ikinci secenek icin base url
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  // TEST EDIELBIR KOD BASLADI
  late final IPostService _postService; //postservice tanımlama
//initstate' de cagırırız
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  //Base url yapma Daha mantıklı!
  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items =
        await _postService.fetchPostItemsAdvance(); //post service'den cekeriz
    // await _networkManager.get('posts');   //burası final response'un karsısı
    // if (response.statusCode == HttpStatus.ok) {
    //   final _datas = response.data;
    //   if (_datas is List) {
    //     setState(() {
    //       _items = _datas.map((e) => PostModel.fromJson(e)).toList();
    //     });
    //   }
    // }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        _isLoading
            ? const CircularProgressIndicator.adaptive()
            : const SizedBox.shrink()
      ]),
      //service'den items boş gelirse placeholder atar dolu gelirse alttakileri yapar
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length,
              itemBuilder: (context, index) {
                //return _PostCard(items: _items);   extract yapınca böyle olur daha sonra düzenleriz
                return _PostCard(model: _items?[index]);
              }),
    );
  }
}

// class _PostCard extends StatelessWidget {
//   const _PostCard({
//     Key? key,
//     required List<PostModel>? items,
//   }) : _items = items, super(key: key);

//   final List<PostModel>? _items;

//   @override
//   Widget build(BuildContext context) {
//     return Card(  //yukarıda card'ı bu sekil yazdıktan sonra extract widget yapıyoruz ve bi üstteki ile bize geliyor.
//       //daha sonra düzenlemeler yapıyoruz.
//       margin: const EdgeInsets.only(bottom: 20),
//       child: ListTile(
//         title: Text(_items?[index].title ?? ''),
//         subtitle: Text(_items?[index].body ?? ''),
//       ),
//     );
//   }

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //commentlearnview icin !!!!
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsLearnView(postId: _model?.id)));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
