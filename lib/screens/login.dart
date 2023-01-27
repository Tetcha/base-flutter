import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app_fe/core/form/ErrorMessage.dart';
import 'package:schedule_app_fe/core/form/TextField.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/screens/register.dart';
import 'package:schedule_app_fe/util/route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserProvider _userProvider = Get.find();

  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  void _onSubmit() async {
    // just auto set for demo
    _userProvider.setIsLogin = true;
  }

  void _onGoogleSignIn() {
    _userProvider.login();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: const FlutterLogo(
              size: 80,
            ),
          ),
          ElevatedButton(
              onPressed: _onGoogleSignIn,
              child: const Text("Login with Googlee")),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 3,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: _usernameController,
                      label: 'Username',
                      name: 'username',
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: _passwordController,
                      label: 'Password',
                      isPassword: true,
                      name: 'password',
                    ),
                    const SizedBox(height: 10),
                    const ErrorMessage(),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          PageNavigator.rightToLeft(context, RegisterScreen());
                        },
                        child: const Text('Register an account'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                        onPressed: _onSubmit, child: const Text('Login')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
