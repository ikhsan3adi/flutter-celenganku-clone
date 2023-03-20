import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';

class OnGoingPage extends StatelessWidget {
  const OnGoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: const OnGoingScreen(),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, AddWishPage.route());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(16),
        ),
        icon: const Icon(Icons.add),
        label: const Text("Tambah Celengan", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
