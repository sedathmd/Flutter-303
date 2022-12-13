import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'comment_model.dart';
import 'post_model.dart';

//abstract class verip alttakileri override ettigimizde yan sayfalarda direk buradan cagırırız
//daha safe ve test edilebilir olur
abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

//abstract oldugu icin implement ediyoruz
class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  //service learn'e
  //GET-FETCH
  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response =
          await _dio.get(_PostServicePath.posts.name); //enum ile veririz

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  //service post learn'e
  //POST-Create
  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response =
          await _dio.post(_PostServicePath.posts.name, data: postModel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  //Update
  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response =
          await _dio.put('${_PostServicePath.posts.name}/$id', data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  //DELETE
  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete('${_PostServicePath.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  //Get Spesific
  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _dio.get(_PostServicePath.comments.name,
          queryParameters: {_PostQueryPath.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _PostServicePath { posts, comments }

enum _PostQueryPath { postId }

class _ShowDebug {
  //t type verip yukarıdakilerde this veriyoruz
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      //kdebugmode icin foundation package'ını import etmeliyiz
      print(error.message);
      print(type);
    }
  }
}
