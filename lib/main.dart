import 'package:celenganku_app_clone/app.dart';
import 'package:celenganku_app_clone/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
