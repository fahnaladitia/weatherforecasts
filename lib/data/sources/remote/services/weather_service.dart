// import 'package:weatherforecasts/core/config/base_service.dart';

import 'package:dio/dio.dart';
import 'package:weatherforecasts/core/config/base_service.dart';

import '../responses/responses.dart';

class WeatherService extends BaseService {
  WeatherService(super.dio);

  Future<GetCurrentWeatherResponse> getCurrentWeatherByLatLng({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await dio.get(
        '/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': "metric",
        },
      );
      return GetCurrentWeatherResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw exceptionHelper(e);
    } catch (e) {
      rethrow;
    }
  }
}
