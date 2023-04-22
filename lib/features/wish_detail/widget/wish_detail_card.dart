import 'dart:io';

import 'package:celenganku_app_clone/features/wish_detail/wish_detail.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishDetailCard extends StatelessWidget {
  const WishDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: BlocBuilder<WishBloc, WishState>(
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
                    const Divider(height: 24),
                    _WishSavingInfo(wish: state.wish),
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
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rp. ${wish.savingTarget.toCurrency()}", style: const TextStyle(fontSize: 28)),
              const SizedBox(height: 5),
              Text(
                "Rp. ${wish.savingNominal.toCurrency()} Per${Wish.savingPlanTimeName(wish.savingPlan).toLowerCase()}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 1.2,
              child: CircularProgressIndicator.adaptive(
                value: wish.getSavingPercentage() / 100,
                backgroundColor: theme.primaryColorLight,
              ),
            ),
            Text("${wish.getSavingPercentage().toStringAsFixed(0)}%", style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
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
            const Text("Dibuat", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(wish.createdAt.toFormattedDateString(useShortMonthName: true), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tercapai", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "${wish.getEstimatedRemainingTime()} ${Wish.savingPlanTimeName(wish.savingPlan)} Lagi",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class _WishSavingInfo extends StatelessWidget {
  const _WishSavingInfo({required this.wish});

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              const Text("Terkumpul", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                "Rp. ${wish.getTotalSaving().toCurrency()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50, width: 15, child: VerticalDivider()),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              const Text("Kurang", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                "Rp. ${(wish.savingTarget - wish.getTotalSaving()).toCurrency()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
