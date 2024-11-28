import 'package:etechtest/core/network/data_state.dart';

abstract class AuthenticationRepository {
  Future<DataState<String>> login(String username, String password);

  Future<DataState<String>> register(String username, String password);
}
