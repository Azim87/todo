import 'package:flutter/material.dart';

extension FormKeyExtension on GlobalKey<FormState> {
  bool validateAndSave(VoidCallback? onSuccess) {
    final form = currentState;
    if (form != null && form.validate()) {
      form.save();
      onSuccess?.call();
      return true;
    }
    return false;
  }
}
