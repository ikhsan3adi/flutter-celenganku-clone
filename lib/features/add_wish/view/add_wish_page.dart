import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWishPage extends StatelessWidget {
  const AddWishPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/add_wish'),
      builder: (context) => const AddWishPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    WishRepository wishRepository = context.read<WishRepository>();

    Wish newWish = Wish(
      id: '0',
      name: '',
      savingTarget: 0,
      savingPlan: SavingPlan.daily,
      savingNominal: 0,
      listSaving: const [],
      createdAt: DateTime.now(),
    );

    return BlocProvider(
      create: (context) => AddWishBloc(wishRepository: wishRepository, newWish: newWish),
      child: const _AddWishView(),
    );
  }
}

class _AddWishView extends StatelessWidget {
  const _AddWishView();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
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
                if (formKey.currentState!.validate()) {
                  context.read<AddWishBloc>().add(const SaveWishEvent());

                  Navigator.pop(context);
                }
              },
              child: const Text("Simpan", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: AddWishScreen(formKey: formKey),
    );
  }
}
