import 'package:dio/dio.dart';

//303 reqres view model icin
class ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}
