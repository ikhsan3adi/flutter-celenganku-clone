import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnGoingBloc(wishRepository: context.read<WishRepository>())..add(FetchWishEvent()),
        ),
        BlocProvider(
          create: (context) => AchievedBloc(wishRepository: context.read<WishRepository>())..add(FetchAchievedWishEvent()),
        )
      ],
      child: const HomeScreen(),
    );
  }
}
