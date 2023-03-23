import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    required this.onChanged,
    required this.validator,
    this.prefixText,
    this.isCurrency = false,
    required this.isValid,
  });

  final IconData prefixIcon;
  final String labelText;
  final String? Function(String?) validator;
  final Function(String?) onChanged;
  final String? prefixText;

  final bool isCurrency;

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        decoration: InputDecoration(
          prefixText: prefixText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon),
          label: Text(labelText),
          suffixIcon: !isValid ? Icon(Icons.error, color: theme.colorScheme.error) : null,
          counterText: ' ',
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
