abstract class CustomExceptionModel implements Exception {
  final String message;
  final String? code;

  const CustomExceptionModel(this.message, [this.code]);

  @override
  String toString() => 'Error: $message${code != null ? ' (Code: $code)' : ''}';
}

class ShowException extends CustomExceptionModel {
  const ShowException(super.message, [super.code]);
}

class UnKnownException extends CustomExceptionModel {
  const UnKnownException(super.message, [super.code]);
}
