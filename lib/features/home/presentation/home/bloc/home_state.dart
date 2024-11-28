part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeRecorceLoadingState extends HomeState {}

final class HomeRecourceLoadedState extends HomeState {
  final int page;
  final List<ResponseEntity> resources;
  HomeRecourceLoadedState(this.page, this.resources);
}

final class HomeFailedState extends HomeState {}
