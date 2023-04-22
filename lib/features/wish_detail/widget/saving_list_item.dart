import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';

class SavingListItem extends StatelessWidget {
  const SavingListItem({super.key, required this.saving});

  final Saving saving;

  @override
  Widget build(BuildContext context) {
    bool isNegative = saving.savingNominal <= 0;
    return Column(
      children: [
        const SizedBox(height: 10),
        ListTile(
          contentPadding: const EdgeInsets.only(bottom: 8),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${saving.createdAt.toFormattedDateString()} • ${saving.createdAt.toFormattedTimeString()}", // date
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(saving.message), // message
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "${isNegative ? '' : '+'} ${saving.savingNominal.toCurrency()}", // saving nominal
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
