part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginDataSendinState extends LoginState {}

class LoginSuccessfulState extends LoginState {
  final String token;

  LoginSuccessfulState(this.token);
}

class LoginFailedState extends LoginState {
  final String message;

  LoginFailedState(this.message);
}
