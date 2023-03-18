import 'package:celenganku_app_clone/on_going/on_going.dart';
import 'package:flutter/material.dart';

class OnGoingPage extends StatelessWidget {
  const OnGoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: const OnGoingScreen(),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColorLight,
          foregroundColor: theme.primaryColorDark,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(20),
        ),
        icon: const Icon(Icons.add),
        label: const Text("Tambah Celengan", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
