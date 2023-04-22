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
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: BlocBuilder<WishBloc, WishState>(
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
      ),
      body: BlocListener<WishBloc, WishState>(
        bloc: context.read<WishBloc>(),
        listener: (context, state) async {
          if (state.wish.completedAt != null) {
            await Future.delayed(const Duration(milliseconds: 500)).then((_) => showDialog(
                  context: context,
                  builder: (context) => _wishCompleteDialog(context),
                ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
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
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const MyExpandableFab(),
    );
  }

  Widget _wishCompleteDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          const Text("Hore !,", style: TextStyle(fontSize: 32)),
          const Text("Celenganmu Sudah Penuh", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const Padding(
            padding: EdgeInsets.all(48),
            child: Icon(
              Icons.check_circle,
              size: 64,
            ),
          ),
        ],
      ),
    );
  }
}
