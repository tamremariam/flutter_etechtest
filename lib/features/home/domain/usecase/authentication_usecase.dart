import 'package:etechtest/core/network/data_state.dart';
import 'package:etechtest/features/home/domain/entities/responce_entity.dart';
import 'package:etechtest/features/home/domain/repository/home_repository.dart';

class HomeUsecase {
  final HomeRepository homeRepository;
  HomeUsecase(this.homeRepository);
  Future<DataState<List<ResponseEntity>>> listResource(int page) async {
    return await homeRepository.getListResource(page);
  }
}
