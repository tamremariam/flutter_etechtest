part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationLoginEvent extends AuthenticationEvent {
  final String username;
  final String password;
  AuthenticationLoginEvent(this.username, this.password);
}

class AuthenticationsendOTP extends AuthenticationEvent {}

class AuthenticationsForgot extends AuthenticationEvent {
  final String email;
  AuthenticationsForgot(this.email);
}

class AuthenticationsSignUp extends AuthenticationEvent {
  final String fullName;
  final String password;
  final String email;
  final String mobileNUmber;
  AuthenticationsSignUp(
      this.fullName, this.password, this.email, this.mobileNUmber);
}

class AuthenticationsVerifyOTP extends AuthenticationEvent {}
