import 'package:celenganku_app_clone/on_going/on_going.dart';
import 'package:flutter/material.dart';

class OnGoingScreen extends StatelessWidget {
  const OnGoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: WishItemCard(),
        );
      },
    );
  }
}
