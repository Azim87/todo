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

extension ListOfWidgetExt on List<Widget> {
  List<Widget> withGap({double? height, double? width}) => [
        for (int i = 0; i < length; i++) ...[
          if (i >= 0)
            SizedBox(
              height: height,
              width: width,
            ),
          this[i]
        ]
      ];
}
