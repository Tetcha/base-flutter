import 'package:flutter/material.dart';

class CBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChangeTab;

  const CBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onChangeTab,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Money',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: onChangeTab,
    );
  }
}
