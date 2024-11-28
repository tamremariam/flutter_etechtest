part of 'signup_bloc.dart';

sealed class SignupEvent {}

class SignupSendUserNameAndPasswordEvent extends SignupEvent {
  final String username;
  final String password;
  SignupSendUserNameAndPasswordEvent(this.username, this.password);
}
