import 'package:flutter/material.dart';

class PasswordFormField extends FormField<String> {
  PasswordFormField({
    super.key,
    super.initialValue,
    super.onSaved,
    super.validator,
    ValueChanged<String>? onChanged,
    bool autoValidate = false,
    super.enabled,
  }) : super(
          autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          builder: (FormFieldState<String> state) => TextField(
            onChanged: (value) {
              state.didChange(value);

              if (onChanged != null) {
                onChanged.call(value);
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              errorText: state.hasError ? state.errorText : null,
            ),
            obscureText: false,
          ),
        );
}
