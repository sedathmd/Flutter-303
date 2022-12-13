import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/Service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  //postmodeldeki itemlar icin bir liste olustururuz
  List<PostModel>? _items;
  //ikinci secenek icin base url
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  //textfieldları kullanmak icin controller yapıyoruz
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
//initstate' de cagırırız
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    //olusturulduysa appbara basarili yazıcak
    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name ?? ''),
        ),
        body: Column(
          children: [
            TextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'title')),
            TextField(
                controller: _bodyController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'body')),
            TextField(
                controller: _userIdController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'userId')),
            TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty) {
                          final model = PostModel(
                              title: _titleController.text,
                              body: _bodyController.text,
                              userId: int.tryParse(_userIdController.text));
                          _addItemToService(model);
                        }
                      },
                child: const Text('Send'))
          ],
        ));
  }
}
