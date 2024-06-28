import 'package:touristic/core/exception/invalid_response.dart';

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
    return DataFailure(e);
  }
}
