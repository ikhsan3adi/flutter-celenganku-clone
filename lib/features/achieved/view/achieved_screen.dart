import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedScreen extends StatelessWidget {
  const AchievedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievedBloc, AchievedState>(
      builder: (context, state) {
        if (state.wishList.isEmpty) return const Center(child: Text("Tidak Ada Data"));

        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.wishList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AchievedWishItemCard(wish: state.wishList[index]),
            );
          },
        );
      },
    );
  }
}
