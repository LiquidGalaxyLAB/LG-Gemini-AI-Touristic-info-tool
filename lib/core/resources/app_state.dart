import 'package:dio/dio.dart';

abstract class AppState<T> {
  final T? data;
  final DioException ? exception;

  const AppState({this.data, this.exception});
}

class AppSuccess<T> extends AppState<T> {
  const AppSuccess(T data): super(data: data);
}

class AppLoading<T> extends AppState<T> {
  const AppLoading(T data): super(data: data);
}

class AppFailure<T> extends AppState<T> {
  const AppFailure(DioException exception): super(exception: exception);
}