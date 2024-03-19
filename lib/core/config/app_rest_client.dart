import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppRestClient {
  late final Dio dio;
  AppRestClient({
    required String baseURL,
    required String apiKey,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        queryParameters: {"appid": apiKey},
      ),
    );
    dio.interceptors.addAll([
      //  implement interceptors
      if (kDebugMode) PrettyDioLogger(requestBody: true, requestHeader: true),
    ]);
  }
}
