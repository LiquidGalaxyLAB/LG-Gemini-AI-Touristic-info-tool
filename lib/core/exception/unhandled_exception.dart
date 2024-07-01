class UnhandledException implements Exception {
  final String message;

  const UnhandledException({
    required this.message,
  });

  @override
  String toString() => message;
}
