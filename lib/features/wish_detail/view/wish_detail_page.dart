import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishDetailPage extends StatelessWidget {
  const WishDetailPage({super.key, required this.wish});

  static Route<void> route({required Wish wish}) {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/wish_detail'),
      builder: (context) => WishDetailPage(wish: wish),
    );
  }

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    WishRepository wishRepository = context.read<WishRepository>();

    Saving saving = Saving(savingNominal: 0, createdAt: DateTime(2023), message: '');

    return BlocProvider(
      create: (context) => WishBloc(wish: wish, wishRepository: wishRepository, saving: saving),
      child: const WishDetailScreen(),
    );
  }
}
