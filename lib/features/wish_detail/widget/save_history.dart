import 'package:celenganku_app_clone/features/wish_detail/wish_detail.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveHistory extends StatelessWidget {
  const SaveHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishBloc, WishState>(
      buildWhen: (previous, current) => current.wish.listSaving.isNotEmpty,
      builder: (context, state) {
        if (state.wish.listSaving.isEmpty) return const SizedBox();

        return Card(
          margin: const EdgeInsets.only(bottom: 128),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 28, left: 28),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              itemCount: state.wish.listSaving.length,
              itemBuilder: (context, index) {
                Saving saving = state.wish.listSaving[index];

                return SavingListItem(saving: saving);
              },
            ),
          ),
        );
      },
    );
  }
}
