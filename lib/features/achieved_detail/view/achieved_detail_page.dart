import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedDetailPage extends StatelessWidget {
  const AchievedDetailPage({super.key, required this.wish});

  static Route<void> route({required Wish wish}) {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/achieved_detail'),
      builder: (context) => AchievedDetailPage(wish: wish),
    );
  }

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    WishRepository wishRepository = context.read<WishRepository>();

    return BlocProvider(
      create: (context) => AchievedDetailCubit(wish: wish, wishRepository: wishRepository),
      child: const AchievedDetailScreen(),
    );
  }
}
