import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/screens/login.dart';

class AutoLogin extends StatefulWidget {
  final Widget children;

  const AutoLogin({super.key, required this.children});

  @override
  State<AutoLogin> createState() => _AutoLoginState();
}

class _AutoLoginState extends State<AutoLogin> {
  final UserProvider _userProvider = Get.find();

  @override
  initState() {
    super.initState();
    // uncomment for auto login on app start
    // _userProvider.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((() =>
        _userProvider.isLogin.value ? widget.children : const LoginScreen()));
  }
}
