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
      latitude: response.coord?.lat?.toDouble() ?? 0.0,
      longitude: response.coord?.lon?.toDouble() ?? 0.0,
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

  @override
  Future<List<Weather>> getForecastsFiveDays(double lat, double lng) async {
    final response = await _weatherService.getForecastsFiveDays(lat: lat, lon: lng);

    return response.list?.map((e) {
          return Weather(
            latitude: response.city?.coord?.lat?.toDouble() ?? 0.0,
            longitude: response.city?.coord?.lon?.toDouble() ?? 0.0,
            weatherWind: WeatherWind(
              speedInMeterPerSecond: e.wind?.speed?.toDouble() ?? 0.0,
            ),
            weatherCondition: WeatherCondition(
              description: e.weather?.first.description ?? '',
              icon: e.weather?.first.icon ?? '',
              main: e.weather?.first.main ?? '',
            ),
            weatherMain: WeatherMain(
              humidity: e.main?.humidity?.toDouble() ?? 0,
              temp: e.main?.temp?.toDouble() ?? 0,
              tempMax: e.main?.tempMax?.toDouble() ?? 0,
              tempMin: e.main?.tempMin?.toDouble() ?? 0,
            ),
            date: DateTime.fromMillisecondsSinceEpoch((e.dt?.toInt() ?? 0) * 1000),
          );
        }).toList() ??
        [];
  }
}
