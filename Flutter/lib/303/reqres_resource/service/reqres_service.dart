import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;

  Future<ResourceModel?> fetchResourceItem();
  //direk resources döndürseydik
  //Future <List<ResourceModel?>?> fetchResourceItem();
}

enum _ReqResPath { resource }

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    //direk resources döndürseydik
    //Future <List<ResourceModel?>> fetchResourceItem() async{
    final response = await dio.get('/${_ReqResPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
      //direk resources döndürseydik
      // if (jsonBody is List) {
      //   return jsonBody.map((json) => ResourceResourceModel.fromJson(jsonBody)).toList();
      // }
    }
    return null;
  }
}
