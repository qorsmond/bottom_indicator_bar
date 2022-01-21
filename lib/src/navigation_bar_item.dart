import 'package:flutter/material.dart';

class BottomIndicatorNavigationBarItem {
  final dynamic icon;
  final dynamic label;
  final Color? backgroundColor;

  BottomIndicatorNavigationBarItem({
    required this.icon,
    this.label,
    this.backgroundColor = Colors.transparent,
  });
}
