import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/utils/ext.dart';

import 'email_form_field.dart';
import 'password_form_field.dart';
import 'phone_form_field.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({
    super.key,
    required this.onEmailSave,
    required this.onPhoneSave,
    required this.onPasswordSave,
    required this.isPhone,
    required this.onAuthTypeChange,
    this.onNavigate,
    this.isLogin,
  });

  final Function(String) onEmailSave;
  final Function(String) onPhoneSave;
  final Function(String) onPasswordSave;
  final VoidCallback? onNavigate;
  final VoidCallback onAuthTypeChange;
  final bool isPhone;
  final bool? isLogin;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
          SvgPicture.asset(
            'assets/images/archa1.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcATop),
            height: 120,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          if (isPhone) ...{
            PhoneFormField(
              validator: (v) => v == null ? 'Поле не может быть пустым!' : null,
              onSaved: (phone) => onPhoneSave(phone!),
            ),
          } else ...{
            EmailFormField(
              validator: (v) => v == null ? 'Поле не может быть пустым!' : null,
              onSaved: (email) => onEmailSave(email!),
            ),
          },
          PasswordFormField(
            validator: (v) => v == null ? 'Поле не может быть пустым!' : null,
            onSaved: (password) => onPasswordSave(password!),
            // onSaved: (password) => _cubit.onPasswordSave(password!),
          ),
          TextButton(
            onPressed: onAuthTypeChange,
            child: Text((isLogin ?? false)
                ? (isPhone ? 'Войти через емейл' : 'Войти через номер телефона')
                : (isPhone ? 'Регистрация по номеру' : 'Регистрация по емейл')),
          ),
          if (isLogin ?? false)
            TextButton(
              onPressed: onNavigate,
              child: const Text('Нет аккаунта? Регистрация'),
            ),
        ].withGap(height: 20),
      );
}
