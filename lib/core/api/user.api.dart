import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:schedule_app_fe/core/api/config.dart' show ApiClient;

class UserApi {
  final ApiClient _apiClient = Get.find();

  Future<Response<dynamic>?> updateUser(
      {String? username, String? email, String? name}) async {
    try {
      final response = await _apiClient.http.put('/users',
          data: json
              .encode({'username': username, 'email': email, 'name': name}));

      return response;
    } catch (e) {
      return null;
    }
  }
}
