import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onPressed,
    required this.action,
  });

  final VoidCallback onPressed;
  final String action;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: FilledButton.tonal(
            style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(12),
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: onPressed,
            child: Text(
              action,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}
