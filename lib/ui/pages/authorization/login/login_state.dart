part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) final bool loading,
    @Default(false) final bool isPhone,
    final String? email,
    final String? phone,
    final String? password,
    final String? error,
  }) = _LoginState;
}
