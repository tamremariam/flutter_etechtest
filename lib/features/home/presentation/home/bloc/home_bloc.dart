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
        final result = await homeUsecase.homeRepository.getListResource(1);

        emit(HomeRecourceLoadedState(2, result.data!, false));
      } catch (error) {
        emit(HomeFailedState());
      }
    });
    on<HomeloadMoreresourcesEvent>((event, emit) async {
      if (state is HomeRecourceLoadedState) {
        final currentState = state as HomeRecourceLoadedState;

        if (!currentState.lastpage) {
          try {
            int page = currentState.page;

            final result =
                await homeUsecase.homeRepository.getListResource(page);

            if (result.data!.isEmpty) {
              emit(HomeRecourceLoadedState(
                  currentState.page + 1,
                  List.from(currentState.resources)..addAll(result.data!),
                  true));
            } else {
              emit(HomeRecourceLoadedState(
                  currentState.page + 1,
                  List.from(currentState.resources)..addAll(result.data!),
                  false));
            }
          } catch (error) {
            emit(HomeFailedState());
          }
        }
      }
    });
  }
}
