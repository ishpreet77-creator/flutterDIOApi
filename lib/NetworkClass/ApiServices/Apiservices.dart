import 'package:dio/dio.dart';
import 'dart:io';

class ApiService {
  // static final String _baseUrl = 'https://swapi.dev/api';
  static final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  final Dio _dio;

  ApiService() : _dio = Dio();

  Future<Response<T>> getRequest<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers, // Added headers parameter
  }) async {
    final String url = '$_baseUrl/$endpoint';

    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers), // Pass headers directly to Options
      );
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<Response<T>> postRequest<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers, // Added headers parameter
  }) async {
    final String url = '$_baseUrl/$endpoint';

    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers), // Pass headers directly to Options
      );
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<Response<T>> postImage<T>(
    String endpoint,
    File image, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String url = '$_baseUrl/$endpoint';

    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
        ...?data,
      });

      final response = await _dio.post<T>(
        url,
        data: formData,
        options: Options(headers: headers),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (error) {
      throw error;
    }
  }
}
