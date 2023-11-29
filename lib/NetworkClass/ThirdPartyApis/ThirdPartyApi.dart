import '../../Helper/ExportFile/Export.dart';
import '../Constant/Constants.dart';
import '../Exceptions/Network_exceptions.dart';

//all function is ame like apiservce 
// i want to tell you this is use for third party apis bacause 
//they have  diffrent url and diffrent headers 
//this class created by ISHPREET SINGH

class ThirdPartyAPI {
  final Dio _dio;

  ThirdPartyAPI() : _dio = Dio();

  Future<Response<T>> ThirdPartyAPIgetRequest<T>({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final String url = '${Constants.ThirdPartyAPI_BASE_URL}';

    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers), // Pass headers directly to Options
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

  Future<Response<T>> ThirdPartyAPIpostRequest<T>(
     {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers, // Added headers parameter
  }) async {
    final String url = '${Constants.ThirdPartyAPI_BASE_URL}';

    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers), // Pass headers directly to Options
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

  Future<Response<T>> ThirdPartyAPIpostImage<T>(
    String endpoint,
    File image, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
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
        options: Options(headers: headers),
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
}
