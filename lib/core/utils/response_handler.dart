import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../resources/data_state.dart';

Future<DataState<U>> handleApiResponse<T, U>({
  required Future<HttpResponse<T>> Function() execute,
  required U? Function(T) mapper,
}) async {
  try {
    final response = await execute();

    if (response.response.statusCode == HttpStatus.ok) {
      final data = mapper(response.response.data);

      if (data != null) {
        return DataSuccess(data);
      }

      return DataFailure(
        Exception("Invalid Response"),
      );
    } else {
      return DataFailure(
        DioException(
          requestOptions: response.response.requestOptions,
          response: response.response,
          type: DioExceptionType.badResponse,
          error: response.response.statusMessage,
        ),
      );
    }
  } on DioException catch (e) {
    return DataFailure(e);
  }
}
