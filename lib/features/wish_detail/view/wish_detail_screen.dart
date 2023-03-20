import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter/material.dart';

class WishDetailScreen extends StatelessWidget {
  const WishDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            WishDetaillCard(),
            SizedBox(height: 15),
            SaveHistory(),
          ],
        ),
      ),
    );
  }
}
