import 'package:flutter/material.dart';

class WishItemCard extends StatelessWidget {
  const WishItemCard({super.key});

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
                    children: const [
                      Text("MacBook Pro M2", style: TextStyle(fontSize: 24)),
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
                            children: const [
                              Text("Rp. 20.999.000", style: TextStyle(fontSize: 24)),
                              Text("Rp. 25.000 Perminggu", style: TextStyle(fontWeight: FontWeight.bold)),
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
                                  value: 0.2,
                                  backgroundColor: theme.primaryColorLight,
                                ),
                              ),
                              const Text("8%", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Center(
                    child: Text("Estimasi : 893 Minggu Lagi", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  Navigator.push(context, WishDetailPage.route());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
