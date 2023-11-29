import '../../Helper/ExportFile/Export.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  factory NetworkException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return NetworkException("Request cancelled");
      case DioExceptionType.connectionTimeout:
        return NetworkException("Connection timeout");
      case DioExceptionType.sendTimeout:
        return NetworkException("Send timeout");
      case DioExceptionType.receiveTimeout:
        return NetworkException("Receive timeout");
      case DioExceptionType.badResponse:
        switch (dioError.response?.statusCode) {
          case 400:
            return NetworkException("Bad request :==> ${dioError.error}");
          case 401:
            return NetworkException("Unauthorized :==> ${dioError.error}");
          case 403:
            return NetworkException("Forbidden :==> ${dioError.error}");
          case 404:
            return NetworkException("Not found :==> ${dioError.error}");
          case 408:
            return NetworkException("Request timeout :==> ${dioError.error}");
          case 500:
            return NetworkException("Internal server error :==> ${dioError.error}");
          case 503:
            return NetworkException("Service unavailable :==> ${dioError.error}");
          default:
            return NetworkException("Request failed with status: ${dioError.response?.statusCode}");
        }
      case DioExceptionType.unknown:
        return NetworkException("Network error");
      default:
        return NetworkException("Unexpected error");
    }
  }

  @override
  String toString() => "NetworkException: $message";
}
