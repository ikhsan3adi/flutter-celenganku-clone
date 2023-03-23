import 'package:celenganku_app_clone/features/add_wish/add_wish.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWishScreen extends StatelessWidget {
  const AddWishScreen({super.key, required formKey}) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImagePicker(),
              BlocBuilder<AddWishBloc, AddWishState>(
                builder: (context, state) {
                  return MyTextFormField(
                    controller: TextEditingController.fromValue(TextEditingValue(text: state.newWish.name)),
                    labelText: 'Nama Tabungan',
                    prefixIcon: Icons.notes,
                    onChanged: (value) {
                      context.read<AddWishBloc>().add(WishNameChanged(wishName: value ?? ''));
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        context.read<AddWishBloc>().add(const WishNameValidation(isNameValid: false));

                        return 'Nama tabungan harus diisi';
                      }
                      context.read<AddWishBloc>().add(const WishNameValidation(isNameValid: true));
                      return null;
                    },
                    isValid: state.isNameValid,
                  );
                },
              ),
              BlocBuilder<AddWishBloc, AddWishState>(
                builder: (context, state) {
                  return MyTextFormField(
                    controller: TextEditingController.fromValue(TextEditingValue(text: state.newWish.savingTarget.toString())),
                    labelText: 'Target Tabungan',
                    prefixIcon: Icons.money,
                    prefixText: 'Rp.',
                    isCurrency: true,
                    onChanged: (value) {
                      context.read<AddWishBloc>().add(WishSavingTargetChanged(value: value ?? '0'));
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        context.read<AddWishBloc>().add(const WishTargetValidation(isSavingTargetValid: false));

                        return 'Target tidak boleh kosong';
                      }
                      context.read<AddWishBloc>().add(const WishTargetValidation(isSavingTargetValid: true));
                      return null;
                    },
                    isValid: state.isSavingTargetValid,
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Rencana Pengisian",
                style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomRadioOutlinedButton(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                      labelText: 'Harian',
                      value: SavingPlan.daily,
                    ),
                    CustomRadioOutlinedButton(
                      borderRadius: null,
                      labelText: 'Mingguan',
                      value: SavingPlan.weekly,
                    ),
                    CustomRadioOutlinedButton(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                      labelText: 'Bulanan',
                      value: SavingPlan.monthly,
                    ),
                  ],
                ),
              ),
              BlocBuilder<AddWishBloc, AddWishState>(
                builder: (context, state) {
                  return MyTextFormField(
                    controller: TextEditingController.fromValue(TextEditingValue(text: state.newWish.savingNominal.toString())),
                    labelText: 'Nominal Pengisian',
                    prefixIcon: Icons.money,
                    prefixText: 'Rp.',
                    isCurrency: true,
                    onChanged: (value) {
                      context.read<AddWishBloc>().add(WishSavingNominalChanged(value: value ?? '0'));
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == '' || int.parse((value).replaceAll('.', '')) <= 0) {
                        context.read<AddWishBloc>().add(const WishNominalValidation(isSavingNominalValid: false));

                        return 'Target per ${Wish.savingPlanTimeName(state.newWish.savingPlan).toLowerCase()} tidak boleh kosong';
                      } else if (int.parse((value).replaceAll('.', '')) >= state.newWish.savingTarget) {
                        context.read<AddWishBloc>().add(const WishNominalValidation(isSavingNominalValid: false));

                        return 'Target per ${Wish.savingPlanTimeName(state.newWish.savingPlan).toLowerCase()} harus kurang dari target tabungan';
                      }
                      context.read<AddWishBloc>().add(const WishNominalValidation(isSavingNominalValid: true));
                      return null;
                    },
                    isValid: state.isSavingNominalValid,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
