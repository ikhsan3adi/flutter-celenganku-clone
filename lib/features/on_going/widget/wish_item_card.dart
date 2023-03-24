import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';

class WishItemCard extends StatelessWidget {
  const WishItemCard({super.key, required this.wish});

  final Wish wish;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("Rp. ${wish.savingTarget.toCurrency()}", style: const TextStyle(fontSize: 24)),
                              Text(
                                "Rp. ${wish.savingNominal.toCurrency()}  Per${Wish.savingPlanTimeName(wish.savingPlan).toLowerCase()}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50, width: 15, child: VerticalDivider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: CircularProgressIndicator.adaptive(
                                  value: wish.getSavingPercentage() / 100,
                                  backgroundColor: theme.primaryColorLight,
                                ),
                              ),
                              Text(
                                "${wish.getSavingPercentage().toStringAsFixed(0)}%",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Center(
                    child: Text(
                      "Estimasi : ${wish.getEstimatedRemainingTime()} ${Wish.savingPlanTimeName(wish.savingPlan)} Lagi",
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
                onTap: () {
                  Navigator.push(context, WishDetailPage.route(wish: wish, context: context));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
