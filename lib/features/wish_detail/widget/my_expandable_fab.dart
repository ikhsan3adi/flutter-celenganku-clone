import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class MyExpandableFab extends StatelessWidget {
  const MyExpandableFab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ExpandableFab(
      distance: 60,
      type: ExpandableFabType.up,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withOpacity(0.5),
      ),
      expandedFabSize: ExpandableFabSize.regular,
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      children: [
        _FloatingActionButtons(
          onTap: () {},
          labelText: 'Hapus Tabungan',
          icon: Icons.delete_outline,
        ),
        _FloatingActionButtons(
          onTap: () {},
          labelText: 'Ambil Tabungan',
          icon: Icons.remove,
        ),
        _FloatingActionButtons(
          onTap: () {},
          labelText: 'Menabung',
          icon: Icons.add,
        ),
      ],
      closeButtonStyle: ExpandableFabCloseButtonStyle(
        foregroundColor: theme.colorScheme.onPrimary,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: const Icon(Icons.close),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class _FloatingActionButtons extends StatelessWidget {
  const _FloatingActionButtons({required this.onTap, required this.labelText, required this.icon});

  final VoidCallback onTap;
  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: theme.colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(labelText),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: theme.colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon),
              ),
            )
          ],
        ),
      ),
    );
  }
}
