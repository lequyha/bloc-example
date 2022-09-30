part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnChangeEmail extends LoginEvent {
  const OnChangeEmail(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class OnChangePassword extends LoginEvent {
  const OnChangePassword(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class Submit extends LoginEvent {
  const Submit();

  @override
  List<Object> get props => [];
}
