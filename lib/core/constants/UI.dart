import 'package:flutter/material.dart';
import 'package:schedule_app_fe/core/constants/routes.dart';

class NavbarSelection {
  final String label;
  final IconData icon;
  final String path;
  const NavbarSelection(
      {required this.label, required this.icon, required this.path});
}

const List<NavbarSelection> navbarSelections = [
  NavbarSelection(
      label: 'Schedule', icon: Icons.schedule, path: RoutePath.schedule),
  NavbarSelection(
      label: 'Money', icon: Icons.attach_money, path: RoutePath.money),
  NavbarSelection(
      label: 'Profile', icon: Icons.person, path: RoutePath.profile),
  NavbarSelection(
      label: 'Settings', icon: Icons.settings, path: RoutePath.setting),
];
