import 'dart:developer';

import 'package:touristic/core/exception/invalid_response.dart';

import '../exception/unhandled_exception.dart';
import 'data_state.dart';

Future<DataState<U>> handleResponse<T, U>({
  required Future<T?> Function() execute,
  required U? Function(T) mapper,
}) async {
  try {
    final response = await execute();

    if (response != null) {
      final data = mapper(response);

      if (data != null) {
        return DataSuccess(data);
      }

      return DataFailure(InvalidResponseException(
        message: "Error while mapping response",
        response: "$response",
      ));
    } else {
      return DataFailure(InvalidResponseException(
        message: "Empty response from gemini",
        response: "$response",
      ));
    }
  } on InvalidResponseException catch (e) {
    log('$e');
    return DataFailure(e);
  } catch (e) {
    log('$e');
    return const DataFailure(
      UnhandledException(
        message: "Something went wrong",
      ),
    );
  }
}
