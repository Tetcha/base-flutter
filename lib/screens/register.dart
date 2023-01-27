import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/form/TextField.dart';
import 'package:schedule_app_fe/core/injection/index.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final AuthApi _authApi = Get.find();
  final TextEditingController _nameController =
      TextEditingController(text: 'admin');
  final TextEditingController _emailController =
      TextEditingController(text: 'admin@gmail.com');
  final TextEditingController _usernameController =
      TextEditingController(text: 'admin');
  final TextEditingController _passwordController =
      TextEditingController(text: '12345678');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: '12345678');

  void _onSubmit(BuildContext context, VoidCallback onSuccess) async {
    var response = await _authApi.register(
        username: _usernameController.text,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text);

    var token = json.decode(response.toString())?["token"] as String;

    if (token != '') onSuccess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Register an account',
                              style: TextStyle(
                                  fontSize: 25,
                                  wordSpacing: 3,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            TextFieldC(
                              controller: _nameController,
                              label: 'Name',
                              name: 'name',
                            ),
                            const SizedBox(height: 10),
                            TextFieldC(
                              controller: _emailController,
                              label: "Email",
                              name: 'email',
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
                              isPassword: true,
                              label: 'Password',
                              name: 'password',
                            ),
                            const SizedBox(height: 10),
                            TextFieldC(
                              controller: _confirmPasswordController,
                              isPassword: true,
                              label: 'Confirm Password',
                              name: 'confirmPassword',
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .unselectedWidgetColor),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Sign in'),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () => _onSubmit(
                                      context,
                                      () => Navigator.pop(context),
                                    ),
                                child: const Text('Register')),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
