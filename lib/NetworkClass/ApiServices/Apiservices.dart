import '../../Helper/ExportFile/Export.dart';
import '../Constant/Constants.dart';
import '../Exceptions/Network_exceptions.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio();
//TODO set the header in this api
  final Map<String, dynamic> ApiHeaders = {
    'Content-Type': 'application/json',
    'Authorization': ' [your API key]'
  };

//TODO get request 
//! use this function get or fetch the data with  api 

  Future<Response<T>> getRequest<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final String url = '${Constants.BASE_URL}/$endpoint';

    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: Options(headers: ApiHeaders), // Pass headers directly to Options
      );
      return response;
    } on DioException catch (error) {
      throw NetworkException.fromDioError(error);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      throw FormatException("Unable to process the data $e");
    } catch (error) {
      throw error;
    }
  }
//TODO  post request
//! use this function  for post api to send the parameter   on the api

  Future<Response<T>> postRequest<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    // Map<String, dynamic>? headers, // Added headers parameter
  }) async {
    final String url = '${Constants.BASE_URL}/$endpoint';

    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: ApiHeaders), // Pass headers directly to Options
      );
      return response;
    } on DioException catch (error) {
      throw NetworkException.fromDioError(error);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      throw FormatException("Unable to process the data $e");
    } catch (error) {
      throw error;
    }
  }
//TODO  post image  request
//! use this function  for post image in api

  Future<Response<T>> postImage<T>(
    String endpoint,
    File image, {
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String url = '${Constants.BASE_URL}/$endpoint';

    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
        ...?data,
      });

      final response = await _dio.post<T>(
        url,
        data: formData,
        options: Options(headers: ApiHeaders),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (error) {
      throw NetworkException.fromDioError(error);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      throw FormatException("Unable to process the data $e");
    } catch (error) {
      throw error;
    }
  }
//TODO  put request
//! use this function PUT for update the data in api

  Future<Response<T>> putRequest<T>(
  String endpoint, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) async {
  final String url = '${Constants.BASE_URL}/$endpoint';

  try {
    final response = await _dio.put<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: ApiHeaders), // Pass headers directly to Options
    );
    return response;
  } on DioException catch (error) {
    throw NetworkException.fromDioError(error);
  } on SocketException catch (e) {
    throw SocketException(e.toString());
  } on FormatException catch (e) {
    throw FormatException("Unable to process the data $e");
  } catch (error) {
    throw error;
  }
}
//TODO  Delete request
//! use this function  for delete api 

Future<Response<T>> deleteRequest<T>(
  String endpoint, {
  Map<String, dynamic>? queryParameters,
}) async {
  final String url = '${Constants.BASE_URL}/$endpoint';

  try {
    final response = await _dio.delete<T>(
      url,
      queryParameters: queryParameters,
      options: Options(headers: ApiHeaders), // Pass headers directly to Options
    );
    return response;
  } on DioException catch (error) {
    throw NetworkException.fromDioError(error);
  } on SocketException catch (e) {
    throw SocketException(e.toString());
  } on FormatException catch (e) {
    throw FormatException("Unable to process the data $e");
  } catch (error) {
    throw error;
  }
}
//TODO  downloadFile request
//! use this function  for downloadFile api 
Future<Response<dynamic>> downloadFile(
  Uri uri, {
  String? savePath = '',
  ProgressCallback? onReceiveProgress,
}) async {
  try {
    final response = await _dio.download(
      uri.toString(),
      savePath,
      onReceiveProgress: onReceiveProgress,
      options: Options(headers: ApiHeaders), // Pass headers directly to Options
    );
    return response;
  } on DioException catch (error) {
    throw NetworkException.fromDioError(error);
  } on SocketException catch (e) {
    throw SocketException(e.toString());
  } on FormatException catch (e) {
    throw FormatException("Unable to process the data $e");
  } catch (error) {
    throw error;
  }
}


}
