import 'package:celenganku_app_clone/wish_detail/wish_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class WishDetailPage extends StatelessWidget {
  const WishDetailPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/wish_detail'),
      builder: (_) => const WishDetailPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("MacBook", style: TextStyle(fontWeight: FontWeight.normal)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.textTheme.bodyLarge!.color,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const WishDetailScreen(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const MyExpandableFab(),
    );
  }
}
