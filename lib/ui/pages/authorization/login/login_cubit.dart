import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/configs/router/router.dart';
import 'package:todo/data/repository/login.dart';

import '../../../../configs/router/r.dart';
import '../../../../core/utils/globals.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(const LoginState());

  final LoginRepository loginRepository;

  void onEmailSave(String email) => emit(state.copyWith(email: email));

  void onPasswordSave(String password) => emit(state.copyWith(password: password));

  Future<void> onLogin() async {
    emit(state.copyWith(loading: true));

    final result = await loginRepository.login(email: state.email!, password: state.password!);
    emit(state.copyWith(loading: false));

    if (result.isSuccess) if (result.success?.success ?? false) navigatorKey.currentContext!.go(R.todo);

    if (result.error == null) {
      showErrorDialog(result.error?.message ?? '', callback: () => emit(state.copyWith(loading: false)));
    }
  }
}
