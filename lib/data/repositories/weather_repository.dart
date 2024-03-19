import 'package:geocoding/geocoding.dart';
import 'package:weatherforecasts/data/sources/remote/services/services.dart';
import 'package:weatherforecasts/domain/models/weather.dart';
import 'package:weatherforecasts/domain/repositories/repositories.dart';

class WeatherRepository implements IWeatherRepository {
  final WeatherService _weatherService;
  WeatherRepository(this._weatherService);

  @override
  Future<Weather> getCurrentWeatherByLatLng(double lat, double lng) async {
    final response = await _weatherService.getCurrentWeatherByLatLng(lat: lat, lon: lng);
    final placemarks = await placemarkFromCoordinates(lat, lng);
    final placemark = placemarks.firstOrNull;

    return Weather(
      weatherWind: WeatherWind(
        speedInMeterPerSecond: response.wind?.speed?.toDouble() ?? 0.0,
      ),
      weatherCondition: WeatherCondition(
        description: response.weather?.first.description ?? '',
        icon: response.weather?.first.icon ?? '',
        main: response.weather?.first.main ?? '',
      ),
      weatherMain: WeatherMain(
        humidity: response.main?.humidity?.toDouble() ?? 0,
        temp: response.main?.temp?.toDouble() ?? 0,
        tempMax: response.main?.tempMax?.toDouble() ?? 0,
        tempMin: response.main?.tempMin?.toDouble() ?? 0,
      ),
      date: DateTime.fromMillisecondsSinceEpoch((response.dt?.toInt() ?? 0) * 1000),
      placemark: placemark,
    );
  }
}
