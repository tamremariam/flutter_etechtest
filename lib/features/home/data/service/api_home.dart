import 'package:etechtest/features/home/data/model/home_lists_responce_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_home.g.dart';

@RestApi()
abstract class ApiHome {
  factory ApiHome(Dio dio, {String baseUrl}) = _ApiHome;

  @GET("/unknown")
  Future<Homelistsresponcemodel> getListResource(@Query("page") int page);
}
