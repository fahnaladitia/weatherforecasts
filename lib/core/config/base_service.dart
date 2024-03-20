import 'dart:io';

import 'package:dio/dio.dart';

import '../common/common.dart';

abstract class BaseService {
  final Dio dio;

  BaseService(this.dio);

  Exception exceptionHelper(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return GeneralException(
          code: ErrorCodeConstants.connectionTimeoutCode,
          message: ErrorMessageConstants.connectionTimeoutMessage,
        );
      case DioExceptionType.receiveTimeout:
        return GeneralException(
          code: ErrorCodeConstants.receiveTimeoutCode,
          message: ErrorMessageConstants.receiveTimeoutMessage,
        );
      case DioExceptionType.sendTimeout:
        return GeneralException(
          code: ErrorCodeConstants.sendTimeoutCode,
          message: ErrorMessageConstants.sendTimeoutMessage,
        );
      case DioExceptionType.cancel:
        return GeneralException(
          code: ErrorCodeConstants.cancelCode,
          message: ErrorMessageConstants.cancelMessage,
        );
      case DioExceptionType.connectionError:
        return GeneralException(
          code: ErrorCodeConstants.noInternetConnectionCode,
          message: ErrorMessageConstants.noInternetConnectionMessage,
        );
      case DioExceptionType.badCertificate:
        return GeneralException(
          code: ErrorCodeConstants.badCertificateCode,
          message: ErrorMessageConstants.badCertificateMessage,
        );
      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return GeneralException(
            code: ErrorCodeConstants.noInternetConnectionCode,
            message: ErrorMessageConstants.noInternetConnectionMessage,
          );
        }
        return GeneralException(
          code: ErrorCodeConstants.unknownCode,
          message: e.response!.toString(),
        );
      case DioExceptionType.badResponse:
        if (e.response == null) {
          return GeneralException(
            code: ErrorCodeConstants.noInternetConnectionCode,
            message: ErrorMessageConstants.noInternetConnectionMessage,
          );
        }
        if (e.response!.statusCode == 400) {
          return GeneralException(
            code: e.response!.data['cod'] ?? ErrorCodeConstants.unknownCode,
            message: e.response!.data.toString(),
          );
        }

        if ((e.response!.statusCode ?? 0) >= 401 && (e.response!.statusCode ?? 0) < 500) {
          return GeneralException.fromMap(e.response!.data);
        }
        if (e.response!.statusCode == 500) {
          return GeneralException(
            code: e.response!.data['cod'] ?? ErrorCodeConstants.unknownCode,
            message: e.response!.data['message'] ?? e.response!.toString(),
          );
        }

        return GeneralException(
          code: ErrorCodeConstants.unknownCode,
          message: e.response!.toString(),
        );

      default:
        return GeneralException(
          code: ErrorCodeConstants.unknownCode,
          message: e.response!.toString(),
        );
    }
  }

  Options applyOptions({
    Map<String, dynamic>? extra,
  }) =>
      Options(responseType: ResponseType.json, extra: extra);
}
