import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/models/user.dart';

final defaultUser =
    User(email: '', id: '', name: '', password: '', username: '');

class UserProvider extends GetxController {
  final AuthApi _authApi = Get.find();

  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  User currentUser = defaultUser;
  RxBool isLogin = false.obs;

  set setIsLogin(bool isLogin) {
    // this.isLogin.value = isLogin;
    update();
  }

  void resetData() {
    currentUser = defaultUser;
    isLogin.value = false;
    update();
  }

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
    // setIsLogin = true;
    update();
  }

  Future<User?> getCurrentUser() async {
    var res = await _authApi.getCurrentUser();

    if (res == null) return null;

    var resUser = json.decode(res.toString());
    var newUser = User(
        email: resUser['email'],
        id: resUser['id'],
        name: resUser['name'],
        password: resUser['password'],
        username: resUser['username']);

    currentUser = newUser;
    // isLogin.value = true;
    update();
    return newUser;
  }
}
