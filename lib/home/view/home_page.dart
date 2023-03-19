import 'package:celenganku_app_clone/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp(
          home: const HomeScreen(),
          theme: ThemeData(),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: state.themeMode,
        );
      },
    );
  }
}
