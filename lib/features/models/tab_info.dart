import 'package:flutter/material.dart';

class TabInfo {
  final String iconPath;
  final String backgroundImage;
  final String label;
  final Widget content;

  TabInfo({
    required this.iconPath,
    required this.backgroundImage,
    required this.label,
    required this.content,
  });
}
