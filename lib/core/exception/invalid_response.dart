class InvalidResponseException implements Exception {
  final String message;
  final String? response;

  const InvalidResponseException({
    required this.message,
    required this.response,
  });

  @override
  String toString() => message;
}
