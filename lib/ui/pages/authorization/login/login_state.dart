part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) final bool loading,
    final String? email,
    final String? password,
    final String? error,
  }) = _LoginState;
}
