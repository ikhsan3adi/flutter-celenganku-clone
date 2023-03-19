import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends HydratedCubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeInitial());

  void themeChanged(ThemeMode themeMode) => emit(AppThemeLoaded(themeMode: themeMode));

  @override
  AppThemeState? fromJson(Map<String, dynamic> json) => AppThemeLoaded(
        themeMode: ThemeMode.values[json['theme'] as int],
      );

  @override
  Map<String, dynamic>? toJson(AppThemeState state) => {'theme': state.themeMode?.index};
}
