part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoninSendUserNameAndPasswordEvent extends LoginEvent {
  final String username;
  final String password;
  LoninSendUserNameAndPasswordEvent(this.username, this.password);
}
