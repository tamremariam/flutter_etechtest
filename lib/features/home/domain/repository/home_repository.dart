import 'package:etechtest/core/network/data_state.dart';
import 'package:etechtest/features/home/domain/entities/responce_entity.dart';

abstract class HomeRepository {
  Future<DataState<List<ResponseEntity>>> getListResource(int page);
}
