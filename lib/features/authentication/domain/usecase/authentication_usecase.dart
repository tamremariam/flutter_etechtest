import 'package:etechtest/core/network/data_state.dart';
import 'package:etechtest/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationUsecase {
  final AuthenticationRepository authenticationRepository;
  AuthenticationUsecase(this.authenticationRepository);
  Future<DataState<String>> userLogin(String username, String password) async {
    return await authenticationRepository.login(username, password);
  }

  Future<DataState<String>> register(String username, String password) async {
    return await authenticationRepository.login(username, password);
  }
}
