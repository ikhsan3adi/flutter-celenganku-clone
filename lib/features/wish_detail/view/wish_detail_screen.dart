import 'package:flutter/material.dart';
import 'package:celenganku_app_clone/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class WishDetailScreen extends StatelessWidget {
  const WishDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<WishBloc, WishState>(
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              WishDetailCard(),
              SizedBox(height: 15),
              SaveHistory(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const MyExpandableFab(),
    );
  }
}
