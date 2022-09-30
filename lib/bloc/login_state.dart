part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;

  const LoginState({
    this.email = '',
    this.emailError,
    this.password = '',
    this.passwordError,
  });

  LoginState copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
  }) {
    return LoginState(
      email: email ?? this.email,
      emailError: emailError,
      password: password ?? this.password,
      passwordError: passwordError,
    );
  }

  List<Object> get props => [email, password];
}
