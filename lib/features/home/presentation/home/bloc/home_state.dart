part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeRecorceLoadingState extends HomeState {}

final class HomeRecourceLoadedState extends HomeState {}

final class HomeFailedState extends HomeState {}