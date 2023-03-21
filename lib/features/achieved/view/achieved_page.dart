import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedPage extends StatelessWidget {
  const AchievedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AchievedBloc(wishRepository: context.read<WishRepository>()),
      child: const AchievedScreen(),
    );
  }
}
