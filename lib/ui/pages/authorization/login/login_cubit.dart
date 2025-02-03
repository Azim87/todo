import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/router/router.dart';
import 'package:todo/core/mixin/auth_mixin.dart';
import 'package:todo/data/repository/login.dart';

import '../../../../config/router/r.dart';
import '../../../../core/utils/globals.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@singleton
class LoginCubit extends Cubit<LoginState> with AuthMixin {
  LoginCubit(this.loginRepository) : super(const LoginState());

  final LoginRepository loginRepository;

  @override
  void onPhoneNumberSave(String phone) => emit(state.copyWith(phone: phone));

  @override
  void onEmailSave(String email) => emit(state.copyWith(email: email));

  @override
  void onPasswordSave(String password) => emit(state.copyWith(password: password));

  @override
  void setAuthType() => emit(state.copyWith(isPhone: !state.isPhone));

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
