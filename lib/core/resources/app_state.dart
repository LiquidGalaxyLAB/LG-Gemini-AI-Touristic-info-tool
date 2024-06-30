abstract class AppState<T> {
  final T? data;
  final Exception? exception;

  const AppState({this.data, this.exception});
}

class AppSuccess<T> extends AppState<T> {
  const AppSuccess(T data) : super(data: data);
}

class AppEmpty<T> extends AppState<T> {
  const AppEmpty();
}

class AppLoading<T> extends AppState<T> {
  const AppLoading();
}

class AppFailure<T> extends AppState<T> {
  const AppFailure(Exception exception) : super(exception: exception);
}
