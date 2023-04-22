import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedPage extends StatelessWidget {
  const AchievedPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AchievedBloc>().add(FetchAchievedWishEvent());
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: const AchievedScreen(),
    );
  }
}
