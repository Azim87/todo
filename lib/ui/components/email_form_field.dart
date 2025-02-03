import 'package:flutter/material.dart';

class EmailFormField extends FormField<String> {
  EmailFormField({
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
              labelText: 'Емейл',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              errorText: state.hasError ? state.errorText : null,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        );
}
