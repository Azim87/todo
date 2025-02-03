import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/utils/ext.dart';
import 'package:todo/ui/components/auth_button.dart';
import 'package:todo/ui/components/auth_form_widget.dart';
import 'package:todo/ui/pages/authorization/signup/signup_cubit.dart';

import '../../../../config/di/di_container.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<SignUpCubit>();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(
              title: const Text('Sign Up Page'),
              backgroundColor: Colors.green,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AuthButton(
              action: 'Регистрация',
              onPressed: () => _formKey.validateAndSave(() => ()),
            ),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: AuthFormWidget(
                        onEmailSave: (email) => _cubit.onEmailSave(email),
                        onPhoneSave: (phone) => _cubit.onPhoneNumberSave(phone),
                        onPasswordSave: (password) => _cubit.onPasswordSave(password),
                        onNavigate: null,
                        onAuthTypeChange: _cubit.setAuthType,
                        isLogin: false,
                        isPhone: state.isPhone,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
