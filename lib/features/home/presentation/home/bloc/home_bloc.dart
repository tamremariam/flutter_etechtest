import 'package:bloc/bloc.dart';
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
        print(result.data.toString());
        // Assuming you return data from the `loadResources` method
        // emit(HomeResourceLoadedState(result));
      } catch (error) {
        print(error.toString());
        // emit(HomeResourceErrorState(error.toString()));
      }
    });
  }
}
