import 'package:celenganku_app_clone/achieved/achieved.dart';
import 'package:flutter/material.dart';

class AchievedScreen extends StatelessWidget {
  const AchievedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AchievedWishItemCard(),
        );
      },
    );
  }
}
