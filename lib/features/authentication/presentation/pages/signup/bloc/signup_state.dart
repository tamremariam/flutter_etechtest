part of 'signup_bloc.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

class SignupSuccessfulState extends SignupState {
  final String token;

  SignupSuccessfulState(this.token);
}

class SignupFailedState extends SignupState {
  final String message;

  SignupFailedState(this.message);
}

class SignupDataSendinState extends SignupState {}
