import 'dart:io';

import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';

class AchievedWishItemCard extends StatelessWidget {
  const AchievedWishItemCard({super.key, required this.wish});

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final imagePath = wish.imagePath;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(wish.name, style: const TextStyle(fontSize: 24)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: imagePath != null ? null : theme.colorScheme.primary,
                          image: imagePath != null
                              ? DecorationImage(
                                  image: FileImage(File(imagePath)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: imagePath != null
                            ? null
                            : Center(
                                child: Icon(
                                  Icons.landscape_outlined,
                                  size: 100,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Text("Rp. ${wish.savingTarget.toCurrency()}", style: const TextStyle(fontSize: 24)),
                  const Divider(),
                  Center(
                    child: Text(
                      "Tercapai Dalam Waktu ${_getDifference(wish.completedAt!.difference(wish.createdAt))} ${Wish.savingPlanTimeName(wish.savingPlan).toLowerCase()}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: theme.colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getDifference(Duration duration) {
    switch (wish.savingPlan) {
      case SavingPlan.daily:
        return duration.inDays;
      case SavingPlan.weekly:
        return duration.inWeek;
      case SavingPlan.monthly:
        return duration.inMonth;
    }
  }
}
