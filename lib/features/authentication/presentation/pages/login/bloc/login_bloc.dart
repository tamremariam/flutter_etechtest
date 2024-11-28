import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:etechtest/features/authentication/domain/usecase/authentication_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationUsecase authenticationUsecase;

  LoginBloc(this.authenticationUsecase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoninSendUserNameAndPasswordEvent>((event, emit) async {
      emit(LoginDataSendinState());
      final loginresult = await authenticationUsecase.authenticationRepository
          .login(event.username, event.password);

      if (loginresult.isSuccess) {
        emit(LoginSuccessfulState(loginresult.data!));
      } else {
        if (loginresult.error is DioException) {
          final error = loginresult.error as DioException;
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout) {
            emit(LoginFailedState(
                "Connection issue. Please check your internet and try again."));
          } else {
            emit(LoginFailedState(
                "Something went wrong. Please try again later."));
          }
        } else {
          emit(LoginFailedState(
              "Incorrect email or password. Please try again."));
        }
      }
    });
  }
}
