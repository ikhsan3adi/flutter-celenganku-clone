import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyExpandableFab extends StatelessWidget {
  const MyExpandableFab({super.key});

  @override
  Widget build(BuildContext context) {
    Wish wish = context.read<WishBloc>().state.wish;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return ExpandableFab(
      distance: 60,
      type: ExpandableFabType.up,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withOpacity(0.5),
      ),
      expandedFabSize: ExpandableFabSize.regular,
      children: [
        _FloatingActionButtons(
          onTap: () => showDialog(
            context: context,
            builder: (_) => _showDeleteWishDialog(context),
          ),
          labelText: 'Hapus Tabungan',
          icon: Icons.delete_outline,
        ),
        _FloatingActionButtons(
          onTap: () {
            if (context.read<WishBloc>().state.wish.getTotalSaving() <= 0) {
              Fluttertoast.showToast(msg: 'Belum ada tabungan yang terkumpul');
              return;
            }
            showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<WishBloc>(),
                child: SavingFormDialog(
                  title: 'Ambil Tabungan',
                  onSubmit: () => context.read<WishBloc>().add(const TakeSavingEvent()),
                  formKey: formKey,
                  validator: (value) {
                    if (int.parse((value).replaceAll('.', '')) > context.read<WishBloc>().state.wish.getTotalSaving()) {
                      return 'Nominal tidak boleh melebihi total tabungan terkumpul';
                    }
                    return null;
                  },
                ),
              ),
            );
          },
          labelText: 'Ambil Tabungan',
          icon: Icons.remove,
        ),
        _FloatingActionButtons(
          onTap: () => showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<WishBloc>(),
              child: SavingFormDialog(
                title: 'Menabung',
                onSubmit: () => context.read<WishBloc>().add(const AddSavingEvent()),
                formKey: formKey,
                validator: (value) {
                  if (int.parse((value).replaceAll('.', '')) > wish.savingTarget - context.read<WishBloc>().state.wish.getTotalSaving()) {
                    return 'Nominal yang ditabung melebihi kekurangan';
                  }
                  return null;
                },
              ),
            ),
          ),
          labelText: 'Menabung',
          icon: Icons.add,
        ),
      ],
      closeButtonStyle: ExpandableFabCloseButtonStyle(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: const Icon(Icons.close),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _showDeleteWishDialog(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Hapus tabungan?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            context.read<WishBloc>().add(DeleteWishEvent());

            Fluttertoast.showToast(msg: 'Berhasil dihapus');
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('Hapus'),
        )
      ],
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
        onTap: onTap,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Text(labelText, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(10),
              ),
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
