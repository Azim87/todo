import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/router/r.dart';
import 'package:todo/config/router/router.dart';
import 'package:todo/core/mixin/auth_mixin.dart';
import 'package:todo/core/utils/globals.dart';
import 'package:todo/data/repository/signup.dart';

part 'signup_cubit.freezed.dart';
part 'signup_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> with AuthMixin {
  SignUpCubit(this.signupRepository) : super(const SignUpState());

  final SignupRepository signupRepository;

  @override
  void onEmailSave(String email) => emit(state.copyWith(email: email));

  @override
  void onPasswordSave(String password) => emit(state.copyWith(password: password));

  @override
  void onPhoneNumberSave(String phone) => emit(state.copyWith(phone: phone));

  @override
  void setAuthType() => emit(state.copyWith(isPhone: !state.isPhone));

  Future<void> onSignUp() async {
    emit(state.copyWith(loading: true));
    final result = await signupRepository.signup(email: state.email!, password: state.password!);

    emit(state.copyWith(loading: false));

    if (result.isSuccess) {
      if (result.success?.success ?? false) {
        showSuccessDialog(
          result.success?.message ?? '',
          () => navigatorKey.currentContext!.push(R.root),
        );
      }
    }
    if (result.isError) showErrorDialog(result.error?.message ?? '');
  }
}
