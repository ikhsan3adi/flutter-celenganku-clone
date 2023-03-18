import 'package:flutter/material.dart';

class AddWishScreen extends StatelessWidget {
  const AddWishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 100,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const _MyTextFormField(
              labelText: 'Nama Tabungan',
              prefixIcon: Icons.notes,
            ),
            const _MyTextFormField(
              labelText: 'Target Tabungan',
              prefixIcon: Icons.money,
            ),
            Text(
              "Rencana Pengisian",
              style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.primary),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _CustomRadioOutlinedButton(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    labelText: 'Harian',
                  ),
                  _CustomRadioOutlinedButton(
                    borderRadius: null,
                    labelText: 'Mingguan',
                  ),
                  _CustomRadioOutlinedButton(
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                    labelText: 'Bulanan',
                  ),
                ],
              ),
            ),
            const _MyTextFormField(
              labelText: 'Nominal Pengisian',
              prefixIcon: Icons.money,
            ),
          ],
        ),
      ),
    );
  }
}

class _MyTextFormField extends StatelessWidget {
  const _MyTextFormField({required this.labelText, required this.prefixIcon});

  final IconData prefixIcon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon),
          label: Text(labelText),
        ),
      ),
    );
  }
}

class _CustomRadioOutlinedButton extends StatelessWidget {
  const _CustomRadioOutlinedButton({required this.borderRadius, required this.labelText});

  final String labelText;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        // backgroundColor: theme.colorScheme.background,
        // foregroundColor: theme.colorScheme.onBackground,
        side: BorderSide(color: theme.colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(labelText),
      ),
    );
  }
}
