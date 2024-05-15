import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:touristic/core/resources/data_state.dart';

Future<DataState<U>> handleApiResponse<T, U>({
  required Future<HttpResponse<T>> Function() execute,
  required U Function(T) mapper,
}) async {
  try {
    final response = await execute();

    if (response.response.statusCode == HttpStatus.ok) {
      return DataSuccess(
        mapper(response.response.data),
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