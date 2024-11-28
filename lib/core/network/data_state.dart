import 'package:dio/dio.dart';

class DataState<T> {
  final T? data;
  final String? error;

  DataState._({this.data, this.error});

  factory DataState.success(T data) => DataState._(data: data);

  factory DataState.failure(DioException dioError) {
    String errorMessage = "An error occurred: ${dioError.error}";

    return DataState._(error: errorMessage);
  }
  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
