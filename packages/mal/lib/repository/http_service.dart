import 'package:dio/dio.dart';
import 'package:mal/constant/enum/http_type.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  HttpService._privateConstructor() {

    _dio.options = BaseOptions(
      baseUrl: 'https://api.jikan.moe',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
  }

  static final HttpService _instance = HttpService._privateConstructor();
  factory HttpService() => _instance;

  final Dio _dio = Dio();

  Future<T?> request<T>(
      RequestType requestType,
      String path, {
        dynamic body,
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      Response response;

      switch (requestType) {
        case RequestType.GET:
          response = await _dio.get(path, queryParameters: query);
          break;
        case RequestType.POST:
          response = await _dio.post(path, data: body, queryParameters: query);
          break;
        case RequestType.DELETE:
          response = await _dio.delete(path, data: body, queryParameters: query);
          break;
      }

      if (fromJson != null && response.data != null) {
        return fromJson(response.data);
      }

      return response.data as T?;

    } on DioException catch (e) {
      print("HTTP Error: ${e.message}");
      rethrow;
    }
  }
}