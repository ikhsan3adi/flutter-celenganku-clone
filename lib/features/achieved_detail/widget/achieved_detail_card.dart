import 'dart:io';

import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievedDetailCard extends StatelessWidget {
  const AchievedDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: BlocBuilder<AchievedDetailCubit, AchievedDetailState>(
        builder: (context, state) {
          final imagePath = state.wish.imagePath;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: imagePath != null ? null : theme.colorScheme.surfaceVariant,
                    image: imagePath != null
                        ? DecorationImage(
                            image: FileImage(File(imagePath)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: imagePath != null
                      ? null
                      : Center(
                          child: Icon(
                            Icons.landscape_outlined,
                            size: 100,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
                child: Column(
                  children: [
                    _WishTargetInfo(wish: state.wish),
                    const Divider(height: 24),
                    _WishTimeInfo(wish: state.wish),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WishTargetInfo extends StatelessWidget {
  const _WishTargetInfo({required this.wish});

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Rp. ${wish.savingTarget.toCurrency()}", style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 5),
        Text(
          "Tercapai Dalam Waktu ${wish.durationToAchieve()} ${Wish.savingPlanTimeName(wish.savingPlan)}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}

class _WishTimeInfo extends StatelessWidget {
  const _WishTimeInfo({required this.wish});

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tanggal Dibuat", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(wish.createdAt.toFormattedDateString(useShortMonthName: true), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tercapai", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              wish.completedAt!.toFormattedDateString(useShortMonthName: true),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
