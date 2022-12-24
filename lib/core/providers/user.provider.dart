import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/models/user.dart';

final defaultUser =
    User(email: '', id: '', name: '', password: '', username: '');

class UserProvider extends ChangeNotifier {
  final AuthApi _authApi;

  User currentUser = defaultUser;
  bool isLogin = false;

  UserProvider(this._authApi);

  set setIsLogin(bool isLogin) {
    this.isLogin = isLogin;
    notifyListeners();
  }

  void resetData() {
    currentUser = defaultUser;
    isLogin = false;
    notifyListeners();
  }

  Future<User> getCurrentUser() async {
    var res = await _authApi.getCurrentUser();
    var resUser = json.decode(res.toString());
    var newUser = User(
        email: resUser['email'],
        id: resUser['id'],
        name: resUser['name'],
        password: resUser['password'],
        username: resUser['username']);

    currentUser = newUser;
    isLogin = true;
    notifyListeners();
    return newUser;
  }
}
