import 'package:dio/dio.dart';
import 'package:etechtest/core/network/data_state.dart';
import 'package:etechtest/features/home/data/service/api_home.dart';
import 'package:etechtest/features/home/domain/entities/responce_entity.dart';
import 'package:etechtest/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final ApiHome apiHome;
  HomeRepositoryImplementation(this.apiHome);
  @override
  Future<DataState<List<ResponseEntity>>> getListResource(int page) async {
    try {
      final response = await apiHome.getListResource(page);

      List<ResponseEntity> list = response.data != null
          ? response.data!
              .map((datum) => ResponseEntity(
                    datum.id,
                    datum.name,
                    datum.year,
                    datum.color,
                    datum.pantoneValue,
                  ))
              .toList()
          : [];

      return DataState.success(list);
    } catch (error) {
      return DataState.failure(DioException(
        requestOptions: RequestOptions(path: ''),
        error: "An error occurred: $error",
      ));
    }
  }
}
