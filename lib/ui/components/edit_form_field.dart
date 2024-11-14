import 'package:flutter/material.dart';

class EditFormField extends FormField<String> {
  EditFormField({
    super.key,
    super.initialValue,
    required final FormFieldSetter<String>? onTitleSaved,
    required final FormFieldSetter<String>? onDescriptionSaved,
    required String? Function(String?) titleValidator,
    required String? Function(String?) descriptionValidator,
    required TextEditingController c1,
    required TextEditingController c2,
    bool autoValidate = false,
    ValueChanged<String>? onEmailChanged,
    ValueChanged<String>? onPasswordChanged,
    super.enabled,
  }) : super(
          autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          builder: (FormFieldState<String> state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: c1,
                  validator: titleValidator,
                  onChanged: (value) {
                    state.didChange(value);
                    if (onEmailChanged != null) onEmailChanged.call(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: const OutlineInputBorder(),
                    errorText: state.hasError ? state.errorText : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: onTitleSaved,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: c2,
                  validator: descriptionValidator,
                  maxLines: 10,
                  onChanged: (value) {
                    state.didChange(value);
                    if (onPasswordChanged != null) onPasswordChanged.call(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Description',
                    alignLabelWithHint: true,
                    border: const OutlineInputBorder(),
                    errorText: state.hasError ? state.errorText : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: onDescriptionSaved,
                ),
              ],
            ),
          ),
        );
}
