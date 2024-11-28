part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {}

class AuthenticationFailureState extends AuthenticationState {}

class AuthenticationFailurevalidationErrorState extends AuthenticationState {
  final bool isnamevalid;
  final bool ispasswordvalid;
  final bool isphonetaken;
  final bool isemailtaken;
  AuthenticationFailurevalidationErrorState(this.isnamevalid,
      this.ispasswordvalid, this.isphonetaken, this.isemailtaken);
}

// class AuthenticationsignUpSuccessState extends AuthenticationState {}

// class AuthenticationsignUpFailureState extends AuthenticationState {}

// class AuthenticationResetPasswordSuccessState extends AuthenticationState {}

// class AuthenticationResetPasswordFailureState extends AuthenticationState {}

// class AuthenticationforgotPasswordSuccessState extends AuthenticationState {}

// class AuthenticationforgotPasswordFailureState extends AuthenticationState {}

// class AuthenticationVerifyOTPSuccessState extends AuthenticationState {}

// class AuthenticationVerifyOTPFailureState extends AuthenticationState {}
