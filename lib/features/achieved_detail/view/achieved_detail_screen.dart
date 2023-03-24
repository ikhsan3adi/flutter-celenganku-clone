import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedDetailScreen extends StatelessWidget {
  const AchievedDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AchievedDetailCubit, AchievedDetailState>(
          builder: (context, state) {
            return Text(
              state.wish.name,
              style: const TextStyle(fontWeight: FontWeight.normal),
            );
          },
        ),
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
              onPressed: () {
                Future(() => context.read<AchievedDetailCubit>().deleteAchievedWish())
                    .then((value) => context.read<AchievedBloc>().add(FetchAchievedWishEvent()));

                Navigator.pop(context);
              },
              child: const Text("Hapus", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
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
}
