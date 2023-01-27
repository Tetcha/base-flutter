import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app_fe/core/providers/user.provider.dart';
import 'package:schedule_app_fe/screens/profile.dart';
import 'package:schedule_app_fe/widgets/bottomNavigation/index.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.children});

  final Widget children;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  void _onChangeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Schedule App'),
      ),
      body: widget.children,
      bottomNavigationBar: userController.isLogin.value
          ? CBottomNavigationBar(
              currentIndex: _currentIndex, onChangeTab: _onChangeTab)
          : const SizedBox(),
    );
  }
}
