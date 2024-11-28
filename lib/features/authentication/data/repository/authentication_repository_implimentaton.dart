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
      // Create login data
      final loginData = AuthSendData(username: username, password: password);

      // Send login request
      final response = await apiAuthentcation.login(loginData);

      // Parse the response
      final loginResponse = loginresponceFromJson(response.token!);

      // Check if the token is null and handle it
      if (loginResponse.token != null) {
        return DataState.success(loginResponse.token!);
      }

      //there must be additional error handling
      return DataState.success(loginResponse.token!);
    } catch (error) {
      return DataState.failure(DioException(
        requestOptions: RequestOptions(path: ''),
        error: "An error occurred: $error",
      ));
    }
  }

  @override
  Future<DataState<String>> register(String username, String password) async {
    try {
      // Create Register data
      final registerData = AuthSendData(username: username, password: password);

      // Send login request
      final response = await apiAuthentcation.register(registerData);

      // Parse the response
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
