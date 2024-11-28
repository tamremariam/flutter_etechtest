import 'package:bloc/bloc.dart';
import 'package:etechtest/features/authentication/domain/usecase/authentication_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUsecase authenticationUsecase;
  AuthenticationBloc(this.authenticationUsecase)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AuthenticationLoginEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      final loginresult = await authenticationUsecase.authenticationRepository
          .login(event.username, event.password);

      if (loginresult.isSuccess) {
        emit(AuthenticationSuccessState());
      } else {
        emit(AuthenticationFailureState());
      }
    });
    on<AuthenticationsendOTP>((event, emit) {});

    on<AuthenticationsSignUp>((event, emit) async {
      // emit(AuthenticationLoadingState());
      // final signupresonce = await authenticationUsecase.authenticationRepository
      //     .signUp(
      //         event.fullName, event.email, event.password, event.mobileNUmber);

      // if (signupresonce.isSuccess) {
      //   UserRegistrationResponce responce = signupresonce.data!;
      //   if (responce.responcecode == 1) {
      //     emit(AuthenticationSuccessState());
      //   } else {
      //     bool isnamenotvalid = false;
      //     bool ispasswordnotvalid = false;
      //     bool isphonetaken = false;
      //     bool isemailtaken = false;

      //     if (responce.message['errors'] != null) {
      //       final errors = responce.message['errors'];
      //       if (errors['name'] != null) {
      //         isnamenotvalid = true;
      //       }
      //       if (errors['email'] != null) {
      //         isemailtaken = true;
      //       }
      //       if (errors['phoneNumber'] != null) {
      //         isphonetaken = true;
      //       }
      //       if (errors['password'] != null) {
      //         ispasswordnotvalid = true;
      //       }
      //     }
      //     emit(AuthenticationFailurevalidationErrorState(
      //         isnamenotvalid, ispasswordnotvalid, isphonetaken, isemailtaken));
      //   }
      // } else {
      //   emit(AuthenticationFailureState());
      // }
    });
    on<AuthenticationsVerifyOTP>((event, emit) {});
  }
}
