import 'package:flutter/material.dart';

class PhoneFormField extends FormField<String> {
  PhoneFormField({
    super.key,
    super.initialValue,
    super.onSaved,
    super.validator,
    bool autoValidate = false,
    ValueChanged<String>? onChanged,
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
              labelText: 'Номер телефона',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              errorText: state.hasError ? state.errorText : null,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        );
}
