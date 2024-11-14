part of 'signup_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) final bool loading,
    final String? email,
    final String? password,
  }) = _SignUpState;
}
