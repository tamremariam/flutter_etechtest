import 'package:dio/dio.dart';
import 'package:etechtest/core/network/data_state.dart';
import 'package:etechtest/features/authentication/data/model/auth_send_data.dart';
import 'package:etechtest/features/authentication/data/model/login_responce.dart';
import 'package:etechtest/features/authentication/data/service/api_authentcation.dart';
import 'package:etechtest/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final ApiAuthentcation apiAuthentcation;
  AuthenticationRepositoryImplementation(this.apiAuthentcation);
  @override
  Future<DataState<String>> login(String username, String password) async {
    try {
      final loginData = AuthSendData(email: username, password: password);
      // Send login request
      final response = await apiAuthentcation.login(loginData);
      print(response.toString());

      return DataState.success(response.token!);
    } catch (error) {
      print(error.toString());
      return DataState.failure(DioException(
        requestOptions: RequestOptions(path: ''),
        error: "An error occurred: $error",
      ));
    }
  }

  @override
  Future<DataState<String>> register(String username, String password) async {
    try {
      final registerData = AuthSendData(email: username, password: password);

      // Send login request
      final response = await apiAuthentcation.register(registerData);

      final registerResponse = loginresponceFromJson(response.token!);

      // Check if the token is null and handle it
      if (registerResponse.token != null) {
        return DataState.success(registerResponse.token!);
      }

      //there must be additional error handling
      return DataState.success(registerResponse.token!);
    } catch (error) {
      return DataState.failure(DioException(
        requestOptions: RequestOptions(path: ''),
        error: "An error occurred: $error",
      ));
    }
  }
}
