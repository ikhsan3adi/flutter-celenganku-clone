import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGoingPage extends StatelessWidget {
  const OnGoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OnGoingBloc>().add(FetchWishEvent());
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: const OnGoingScreen(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, AddWishPage.route()).then(
            (_) => context.read<OnGoingBloc>().add(FetchWishEvent()),
          );
        },
        label: const Text('Tambah Celengan', style: TextStyle(fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
