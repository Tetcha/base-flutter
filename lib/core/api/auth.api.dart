import 'dart:convert';

import 'package:schedule_app_fe/core/api/config.dart' show ApiClient;

class AuthApi {
  final ApiClient _apiClient;
  AuthApi(ApiClient apiClient) : _apiClient = apiClient;

  Future<dynamic> login(String username, String password) async {
    try {
      final response = await _apiClient.http.post('/auth/login',
          data: json.encode({
            'username': username,
            'password': password,
          }));
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> register(
      {required String username,
      required String password,
      required String email,
      required String name,
      required String confirmPassword}) async {
    try {
      final response = await _apiClient.http.post('/auth/register',
          data: json.encode({
            'username': username,
            'password': password,
            'email': email,
            'name': name,
            'confirmPassword': confirmPassword
          }));
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getCurrentUser() async {
    try {
      final response = await _apiClient.http.get('/users/me');
      return response;
    } catch (e) {
      return null;
    }
  }
}
