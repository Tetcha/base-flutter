import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  List<Widget> widgetList = <Widget>[
    ProfileScreen(),
  ];

  void _onChangeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Schedule App'),
        ),
        body: widget.children,
        bottomNavigationBar: value.isLogin
            ? CBottomNavigationBar(
                currentIndex: _currentIndex, onChangeTab: _onChangeTab)
            : null,
      ),
    );
  }
}
