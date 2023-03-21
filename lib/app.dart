import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.wishRepository});

  final WishRepository wishRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => wishRepository,
      child: BlocProvider(
        create: (_) => AppThemeCubit(),
        child: const MyAppView(),
      ),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp(
          home: const HomePage(),
          theme: ThemeData(),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: state.themeMode,
        );
      },
    );
  }
}
