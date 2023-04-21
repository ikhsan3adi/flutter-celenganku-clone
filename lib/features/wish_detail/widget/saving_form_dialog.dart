import 'package:celenganku_app_clone/features/features.dart';
import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingFormDialog extends StatelessWidget {
  const SavingFormDialog({
    super.key,
    required this.title,
    required this.onSubmit,
    required this.formKey,
    required this.validator,
  });

  final String title;
  final VoidCallback onSubmit;
  final GlobalKey<FormState> formKey;
  final String? Function(String)? validator;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    context.read<WishBloc>().add(SavingNominalChanged(value: '0'));
    context.read<WishBloc>().add(const SavingMessageChanged(message: ''));
    context.read<WishBloc>().add(const SavingNominalValidation(isSavingNominalValid: true));

    return AlertDialog(
      backgroundColor: theme.colorScheme.surface,
      contentPadding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal)),
      content: SizedBox(
        width: 500,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<WishBloc, WishState>(
                builder: (context, state) {
                  return _MyTextFormField(
                    autofocus: true,
                    labelText: 'Nominal',
                    prefixText: 'Rp.',
                    isCurrency: true,
                    onChanged: (value) {
                      context.read<WishBloc>().add(SavingNominalChanged(value: value ?? '0'));
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == '' || int.parse((value).replaceAll('.', '')) <= 0) {
                        context.read<WishBloc>().add(const SavingNominalValidation(isSavingNominalValid: false));

                        return 'Nominal tidak boleh kosong';
                      }
                      if (validator?.call(value) != null) {
                        context.read<WishBloc>().add(const SavingNominalValidation(isSavingNominalValid: false));
                        return validator?.call(value);
                      }

                      context.read<WishBloc>().add(const SavingNominalValidation(isSavingNominalValid: true));
                      return null;
                    },
                    isValid: state.isSavingNominalValid,
                  );
                },
              ),
              _MyTextFormField(
                labelText: 'Keterangan (Opsional)',
                onChanged: (value) {
                  context.read<WishBloc>().add(SavingMessageChanged(message: value ?? ''));
                },
                isValid: true,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              onSubmit.call();

              Navigator.pop(context);
            }
          },
          child: const Text('Simpan'),
        )
      ],
    );
  }
}

class _MyTextFormField extends StatelessWidget {
  const _MyTextFormField({
    this.autofocus = false,
    required this.labelText,
    required this.onChanged,
    this.validator,
    this.prefixText,
    this.isCurrency = false,
    required this.isValid,
  });

  final bool autofocus;

  final String labelText;
  final String? Function(String?)? validator;
  final Function(String?) onChanged;
  final String? prefixText;

  final bool isCurrency;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        autofocus: autofocus,
        decoration: InputDecoration(
          prefixText: prefixText,
          border: const OutlineInputBorder(),
          label: Text(labelText),
          suffixIcon: !isValid ? Icon(Icons.error, color: theme.colorScheme.error) : null,
          counterText: ' ',
          errorMaxLines: 3,
        ),
        onChanged: onChanged,
        keyboardType: isCurrency ? const TextInputType.numberWithOptions(decimal: false) : null,
        validator: validator,
        inputFormatters: isCurrency
            ? [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter(),
              ]
            : null,
      ),
    );
  }
}
