import 'package:etechtest/features/authentication/data/model/auth_send_data.dart';
import 'package:etechtest/features/authentication/data/model/login_responce.dart';
import 'package:etechtest/features/authentication/data/model/register_responce.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_authentcation.g.dart';

@RestApi()
abstract class ApiAuthentcation {
  factory ApiAuthentcation(Dio dio, {String baseUrl}) = _ApiAuthentcation;

  @POST("/login")
  Future<Loginresponce> login(@Body() AuthSendData loginData);
  @POST("/register")
  Future<Registerresponce> register(@Body() AuthSendData registerData);
}
