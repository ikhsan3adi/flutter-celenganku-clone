import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:dynamic_color/dynamic_color.dart';
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
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme lightColorScheme = lightDynamic?.harmonized() ??
                ColorScheme.fromSwatch(
                  primarySwatch: Colors.blue,
                ).harmonized();

            ColorScheme darkColorScheme = darkDynamic?.harmonized() ??
                ColorScheme.fromSwatch(
                  primarySwatch: Colors.blue,
                  brightness: Brightness.dark,
                ).harmonized();

            return MaterialApp(
              title: 'Flutter Celenganku clone',
              home: const HomePage(),
              theme: ThemeData(
                colorScheme: lightColorScheme,
                useMaterial3: true,
                visualDensity: VisualDensity.standard,
              ).copyWith(
                dividerTheme: DividerThemeData(color: lightColorScheme.onSurface.withAlpha(45)),
                iconTheme: IconThemeData(color: lightColorScheme.secondary),
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
                visualDensity: VisualDensity.standard,
              ).copyWith(
                dividerTheme: DividerThemeData(color: darkColorScheme.onSurface.withAlpha(45)),
                iconTheme: IconThemeData(color: darkColorScheme.secondary),
              ),
              themeMode: state.themeMode,
            );
          },
        );
      },
    );
  }
}
