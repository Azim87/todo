import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/utils/ext.dart';
import 'package:todo/ui/pages/authorization/signup/signup_cubit.dart';

import '../../../../configs/di/di_container.dart';
import '../../../../configs/router/r.dart';
import '../../../components/email_form_field.dart';
import '../../../components/password_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<SignUpCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Sign Up Page')),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmailFormField(
                        validator: (v) => v == null ? 'Email не может быть пустым!' : null,
                        onSaved: (email) => _cubit.onEmailSave(email!),
                      ),
                      const SizedBox(height: 16),
                      PasswordFormField(
                        validator: (v) => v == null ? 'Пароль не может быть пустым!' : null,
                        onSaved: (password) => _cubit.onPasswordSave(password!),
                      ),
                      const SizedBox(height: 16),
                      TextButton(onPressed: () => context.push(R.root), child: const Text('Login')),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        bloc: _cubit,
                        builder: (context, state) {
                          if (state.loading) {
                            return const CircularProgressIndicator();
                          }
                          return FilledButton.tonal(
                            onPressed: () => _formKey.validateAndSave(() => _cubit.onLogin()),
                            child: const Text('Sign Up'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
