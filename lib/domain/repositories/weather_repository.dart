import '../models/models.dart';

abstract class IWeatherRepository {
  Future<Weather> getCurrentWeatherByLatLng(double lat, double lng);
}
