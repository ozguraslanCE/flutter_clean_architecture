import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? exception;
  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data, exception: null);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException exception)
      : super(data: null, exception: exception);
}
