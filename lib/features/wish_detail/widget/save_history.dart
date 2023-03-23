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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              itemCount: state.wish.listSaving.length,
              itemBuilder: (context, index) {
                Saving saving = state.wish.listSaving[index];

                return _SavingListItem(saving: saving);
              },
            ),
          ),
        );
      },
    );
  }
}

class _SavingListItem extends StatelessWidget {
  const _SavingListItem({required this.saving});

  final Saving saving;

  @override
  Widget build(BuildContext context) {
    bool isNegative = saving.savingNominal <= 0;
    return Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                saving.createdAt.toString(), // date
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(saving.message), // message
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "${isNegative ? '' : '+'} ${saving.savingNominal.toString()}", // saving nominal
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isNegative ? Colors.red : Colors.green,
              ),
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
