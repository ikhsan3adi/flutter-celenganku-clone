import 'package:celenganku_app_clone/features/achieved/bloc/achieved_bloc.dart';
import 'package:celenganku_app_clone/features/home/home.dart';
import 'package:celenganku_app_clone/features/on_going/bloc/on_going_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnGoingBloc()),
        BlocProvider(create: (context) => AchievedBloc()),
      ],
      child: const HomeScreen(),
    );
  }
}
