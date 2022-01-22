import 'package:flutter/material.dart';

class BottomIndicatorNavigationBarItem {
  final dynamic icon;
  final dynamic activeIcon;
  final dynamic label;
  final Color? backgroundColor;

  BottomIndicatorNavigationBarItem({
    required this.icon,
    this.activeIcon,
    this.label,
    this.backgroundColor = Colors.transparent,
  });
}
