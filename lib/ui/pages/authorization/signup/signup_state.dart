part of 'signup_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) final bool loading,
    @Default(false) final bool isPhone,
    final String? email,
    final String? phone,
    final String? password,
  }) = _SignUpState;
}
