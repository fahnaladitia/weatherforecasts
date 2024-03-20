// import 'package:weatherforecasts/core/config/base_service.dart';

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:weatherforecasts/core/config/base_service.dart';

import '../responses/responses.dart';

class WeatherService extends BaseService {
  WeatherService(super.dio);

  Future<GetCurrentWeatherResponse> getCurrentWeatherByLatLng({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await retry(
        () => dio.get(
          '/weather',
          queryParameters: {
            'lat': lat,
            'lon': lon,
            'units': "metric",
          },
          options: applyOptions(),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return GetCurrentWeatherResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHelper(e);
    }
  }

  Future<GetForecastFiveDaysInThreeHourIntervalResponse> getForecastsFiveDays({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await retry(
        () => dio.get(
          '/forecast',
          queryParameters: {
            'lat': lat,
            'lon': lon,
            'units': "metric",
          },
          options: applyOptions(),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      return GetForecastFiveDaysInThreeHourIntervalResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHelper(e);
    }
  }
}
