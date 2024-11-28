import 'package:bloc/bloc.dart';
import 'package:etechtest/features/home/domain/entities/responce_entity.dart';
import 'package:etechtest/features/home/domain/usecase/authentication_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase homeUsecase;
  HomeBloc(this.homeUsecase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeloadresourcesEvent>((event, emit) async {
      emit(HomeRecorceLoadingState());
      try {
        print("111111111111111");
        final result = await homeUsecase.homeRepository.getListResource(1);

        emit(HomeRecourceLoadedState(1, result.data!));
      } catch (error) {
        // emit(HomeResourceErrorState(error.toString()));
      }
    });
  }
}
