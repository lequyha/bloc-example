import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<OnChangeEmail>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: event.email.isEmpty ? 'Không để trống email' : null,
        ),
      );
    });

    on<OnChangePassword>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          passwordError:
              event.password.isEmpty ? 'Không để trống password' : null,
        ),
      );
    });

    on<Submit>((event, emit) {
      print('email: ${state.email}');
      print('password: ${state.password}');
    });
  }
}
