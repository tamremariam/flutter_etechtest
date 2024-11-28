import 'package:dio/dio.dart';
import 'package:etechtest/core/network/network_constant.dart';
import 'package:etechtest/features/authentication/domain/usecase/authentication_usecase.dart';
import 'package:etechtest/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../features/authentication/data/repository/authentication_repository_implimentaton.dart';
import '../../features/authentication/data/service/api_authentcation.dart';
import '../../features/authentication/domain/repository/authentication_repository.dart';

final sl = GetIt.instance;
Future<void> authenticationDependencyInjection() async {
  sl.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: backEndEndPoint)));
  sl.registerSingleton<ApiAuthentcation>(ApiAuthentcation(sl()));
  sl.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImplementation(sl()));
  sl.registerSingleton<AuthenticationUsecase>(AuthenticationUsecase(sl()));
  sl.registerCachedFactory(() => AuthenticationBloc(sl()));
}
