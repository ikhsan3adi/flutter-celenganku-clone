import 'package:flutter/material.dart';

class HomeScreenTab {
  const HomeScreenTab({required this.tab, required this.screen, required this.onTap});

  final Tab tab;
  final Widget screen;
  final void Function(BuildContext context) onTap;
}
