import 'package:celenganku_app_clone/features/add_wish/add_wish.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioOutlinedButton extends StatelessWidget {
  const CustomRadioOutlinedButton({
    super.key,
    required this.borderRadius,
    required this.labelText,
    required this.value,
  });

  final String labelText;
  final BorderRadius? borderRadius;

  final SavingPlan value;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<AddWishBloc, AddWishState>(
      builder: (context, state) {
        bool isSelected = state.newWish.savingPlan == value;

        return OutlinedButton(
          onPressed: () {
            context.read<AddWishBloc>().add(WishSavingPlanChanged(savingPlan: value));
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: isSelected ? theme.colorScheme.primary : null,
            foregroundColor: isSelected ? theme.colorScheme.onPrimary : null,
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
      },
    );
  }
}
