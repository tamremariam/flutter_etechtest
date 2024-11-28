import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:etechtest/core/network/network_constant.dart';
import 'package:etechtest/features/authentication/domain/usecase/authentication_usecase.dart';
import 'package:etechtest/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:etechtest/features/authentication/presentation/signup/bloc/signup_bloc.dart';
import 'package:etechtest/features/home/data/repository/authentication_repository_implimentaton.dart';
import 'package:etechtest/features/home/data/service/api_home.dart';
import 'package:etechtest/features/home/domain/repository/home_repository.dart';
import 'package:etechtest/features/home/domain/usecase/authentication_usecase.dart';
import 'package:etechtest/features/home/presentation/home/bloc/home_bloc.dart';

import '../../features/authentication/data/repository/authentication_repository_implimentaton.dart';
import '../../features/authentication/data/service/api_authentcation.dart';
import '../../features/authentication/domain/repository/authentication_repository.dart';

final sl = GetIt.instance;
final s2 = GetIt.instance;
Future<void> authenticationDependencyInjection() async {
  sl.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: backEndEndPoint)));
  sl.registerSingleton<ApiAuthentcation>(ApiAuthentcation(sl()));
  sl.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImplementation(sl()));
  sl.registerSingleton<AuthenticationUsecase>(AuthenticationUsecase(sl()));
  sl.registerCachedFactory(() => LoginBloc(sl()));
  sl.registerCachedFactory(() => SignupBloc(sl()));
}

Future<void> homeDependencyInjection() async {
  s2.registerSingleton<ApiHome>(ApiHome(sl()));
  s2.registerSingleton<HomeRepository>(HomeRepositoryImplementation(sl()));
  s2.registerSingleton<HomeUsecase>(HomeUsecase(sl()));
  s2.registerCachedFactory(() => HomeBloc(sl()));
}
