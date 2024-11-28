import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:etechtest/features/authentication/domain/usecase/authentication_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthenticationUsecase authenticationUsecase;
  SignupBloc(this.authenticationUsecase) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<SignupSendUserNameAndPasswordEvent>((event, emit) async {
      emit(SignupDataSendinState());
      final signupresult = await authenticationUsecase.authenticationRepository
          .register(event.username, event.password);

      if (signupresult.isSuccess) {
        emit(SignupSuccessfulState(signupresult.data!));
      } else {
        if (signupresult.error is DioException) {
          final error = signupresult.error as DioException;
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout) {
            emit(SignupFailedState(
                "Connection issue. Please check your internet and try again."));
          } else {
            emit(SignupFailedState(
                "Something went wrong. Please try again later."));
          }
        } else {
          emit(SignupFailedState(
              "Incorrect email or password. Please try again."));
        }
      }
    });
  }
}
