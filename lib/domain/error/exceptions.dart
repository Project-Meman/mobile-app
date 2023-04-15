class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

class InvalidCredentialsException implements Exception {
  final String message;

  InvalidCredentialsException(this.message);

  @override
  String toString() => message;
}

class ApiException implements Exception {
  final String message;
  final String code;

  ApiException(this.code, this.message);

  @override
  String toString() => message;
}

class FileUploadException implements Exception {
  final String message;

  FileUploadException(this.message);

  @override
  String toString() => message;
}

class TokenExpiredException implements Exception {}

class JsonFactoryNotFoundException implements Exception {
  final String message;

  JsonFactoryNotFoundException(this.message);

  @override
  String toString() => message;
}
