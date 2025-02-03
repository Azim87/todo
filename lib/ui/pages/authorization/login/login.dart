import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/di/di_container.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/ui/components/auth_button.dart';
import 'package:todo/ui/components/auth_form_widget.dart';
import 'package:todo/ui/pages/authorization/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(backgroundColor: Colors.green),
            backgroundColor: Colors.green,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AuthButton(
              action: 'Войти',
              onPressed: () => context.go(R.main),
              // onPressed: () => _formKey.validateAndSave(() => _cubit.onLogin()),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: AuthFormWidget(
                    isLogin: true,
                    onEmailSave: (email) {},
                    onPhoneSave: (phone) {},
                    onPasswordSave: (password) {},
                    onNavigate: () => context.push(R.signUp),
                    onAuthTypeChange: _cubit.setAuthType,
                    isPhone: state.isPhone,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
