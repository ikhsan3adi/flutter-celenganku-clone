import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWishPage extends StatelessWidget {
  const AddWishPage({super.key});

  static Route<void> route({required BuildContext context}) {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/add_wish'),
      builder: (_) => BlocProvider.value(
        value: context.read<OnGoingBloc>(),
        child: const AddWishPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WishRepository wishRepository = context.read<WishRepository>();

    return BlocProvider(
      create: (context) => AddWishBloc(wishRepository: wishRepository),
      child: const _AddWishView(),
    );
  }
}

class _AddWishView extends StatelessWidget {
  const _AddWishView();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.textTheme.bodyLarge!.color,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Simpan", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: const AddWishScreen(),
    );
  }
}
