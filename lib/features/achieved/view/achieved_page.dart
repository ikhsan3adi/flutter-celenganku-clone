import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';

class AchievedPage extends StatelessWidget {
  const AchievedPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: const AchievedScreen(),
    );
  }
}
