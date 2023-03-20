import 'package:flutter/material.dart';

class WishDetaillCard extends StatelessWidget {
  const WishDetaillCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Rp. 20.999.000", style: TextStyle(fontSize: 28)),
                          SizedBox(height: 5),
                          Text(
                            "Rp. 25.000 Perminggu",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                            value: 0.2,
                            backgroundColor: theme.primaryColorLight,
                          ),
                        ),
                        const Text("8%", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Dibuat", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("08 Jan 2023", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Tercapai", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("100 Minggu lagi", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: const [
                          Text("Terkumpul", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(
                            "Rp. 20.000",
                            style: TextStyle(
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
                        children: const [
                          Text("Kurang", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text(
                            "Rp. 20.000.000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
