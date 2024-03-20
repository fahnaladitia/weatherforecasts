import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherforecasts/data/sources/remote/services/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherforecasts/domain/models/models.dart';
import 'package:weatherforecasts/domain/repositories/repositories.dart';

part 'get_current_weather_state.dart';

class GetCurrentWeatherCubit extends Cubit<GetCurrentWeatherState> {
  final IWeatherRepository _weatherRepository;
  GetCurrentWeatherCubit(this._weatherRepository) : super(GetCurrentWeatherInitial());

  Future<void> getInitialWeather() async {
    emit(GetCurrentWeatherLoading());
    try {
      final position = await GeolocatorService.getCurrentLocation();

      final weather = await _weatherRepository.getCurrentWeatherByLatLng(
        position.latitude,
        position.longitude,
      );
      final forecasts = await _weatherRepository.getForecastsFiveDays(
        position.latitude,
        position.longitude,
      );
      emit(GetCurrentWeatherLoaded(weather: weather, forecasts: forecasts));
    } catch (e) {
      emit(GetCurrentWeatherError(message: e.toString()));
    }
  }

  // Future<void> getCurrentWeatherLatLng() async {
  //   emit(GetCurrentWeatherLoading());
  //   try {
  //     final weather = Weather(
  //       weatherWind: WeatherWind(speedInMeterPerSecond: 0.62),
  //       // latLng: latLng,
  //       weatherCondition: WeatherCondition(
  //         description: 'broken clouds',
  //         icon: '04d',
  //         main: 'Clouds',
  //       ),
  //       weatherMain: WeatherMain(
  //         humidity: 83,
  //         temp: 29.0,
  //         tempMax: 29.0,
  //         tempMin: 29.0,
  //       ),
  //       // placemark: const Placemark(
  //       //   name: 'Kota Samarinda',
  //       //   administrativeArea: 'Kalimantan Timur',
  //       //   subAdministrativeArea: 'Sungai Kunjang',
  //       //   country: 'Indonesia',
  //       // ),
  //       date: DateTime.now(),
  //     );
  //     emit(GetCurrentWeatherLoaded(weather: weather));
  //   } catch (e) {
  //     emit(GetCurrentWeatherError(message: e.toString()));
  //   }
  // }
}
