import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedDetailScreen extends StatelessWidget {
  const AchievedDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: BlocBuilder<AchievedDetailCubit, AchievedDetailState>(
          builder: (context, state) {
            return Text(
              state.wish.name,
              style: const TextStyle(fontWeight: FontWeight.normal),
            );
          },
        ),
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
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (_) => _showDeleteWishDialog(context),
              ),
              child: const Text("Hapus", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              AchievedDetailCard(),
              SizedBox(height: 15),
              AchievedSaveHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showDeleteWishDialog(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.colorScheme.surface,
      contentPadding: EdgeInsets.zero,
      title: const Text('Hapus tabungan?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            context.read<AchievedDetailCubit>().deleteAchievedWish();

            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('Hapus'),
        )
      ],
    );
  }
}
