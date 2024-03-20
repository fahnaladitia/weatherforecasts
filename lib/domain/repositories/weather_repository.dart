import 'package:latlong2/latlong.dart';

import '../models/models.dart';

abstract class IWeatherRepository {
  Future<Weather> getCurrentWeatherByLatLng(LatLng? latLng);
  Future<List<Weather>> getForecastsFiveDays(LatLng latLng);
}
