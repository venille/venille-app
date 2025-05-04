import 'package:flutter/material.dart';

class DrawerItem {
  final String icon;
  final String title;
  final String routeTo;
  final IconData? iconData;
  final VoidCallback? onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.routeTo,
    this.iconData,
    this.onTap,
  });
}
