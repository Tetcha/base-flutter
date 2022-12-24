import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/form/ErrorMessage.dart';
import 'package:schedule_app_fe/core/form/TextField.dart';
import 'package:schedule_app_fe/core/injection/index.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/screens/register.dart';
import 'package:schedule_app_fe/util/route.dart';
import 'package:schedule_app_fe/util/sharePreferenceHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthApi _authApi = getIt<AuthApi>();
  final UserProvider _userProvider = getIt<UserProvider>();

  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  void _onSubmit() async {
    // just auto set for demo
    _userProvider.setIsLogin = true;

    // uncomment this to apply login api
    // var response = await _authApi.login(
    //     _usernameController.text, _passwordController.text);
    // if (response != null) {
    //   var token = json.decode(response.toString())?["token"] as String;

    //   // save auth token to preference
    //   final SharedPreferenceHelper preferenceHelper =
    //       getIt<SharedPreferenceHelper>();
    //   preferenceHelper.saveAuthToken(token);

    //   _userProvider.setIsLogin = true;
    //   _userProvider.getCurrentUser();
    // }
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
