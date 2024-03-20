import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

import 'package:weatherforecasts/domain/models/models.dart';
import 'package:weatherforecasts/domain/repositories/repositories.dart';

part 'get_current_weather_state.dart';

class GetCurrentWeatherCubit extends Cubit<GetCurrentWeatherState> {
  final IWeatherRepository _weatherRepository;
  GetCurrentWeatherCubit(this._weatherRepository) : super(GetCurrentWeatherInitial());

  // Future<void> getInitialWeather() async {
  //   emit(GetCurrentWeatherLoading());
  //   try {
  //     final position = await GeolocatorService.getCurrentLocation();

  //     final weather = await _weatherRepository.getCurrentWeatherByLatLng(
  //       position.latitude,
  //       position.longitude,
  //     );
  //     final forecasts = await _weatherRepository.getForecastsFiveDays(
  //       position.latitude,
  //       position.longitude,
  //     );
  //     emit(GetCurrentWeatherLoaded(weather: weather, forecasts: forecasts));
  //   } catch (e) {
  //     emit(GetCurrentWeatherError(message: e.toString()));
  //   }
  // }

  Future<void> getCurrentWeatherLatLng({LatLng? latLng, bool isUpdate = false}) async {
    GetCurrentWeatherLoaded? initialState;

    if (state is GetCurrentWeatherLoaded) {
      initialState = state as GetCurrentWeatherLoaded;
    }
    emit(GetCurrentWeatherLoading());

    try {
      LatLng? targetLatLng = isUpdate ? initialState?.weather.latLng : latLng;

      final weather = await _weatherRepository.getCurrentWeatherByLatLng(targetLatLng);
      final forecasts = await _weatherRepository.getForecastsFiveDays(weather.latLng);
      emit(GetCurrentWeatherLoaded(weather: weather, forecasts: forecasts));
    } catch (e) {
      emit(GetCurrentWeatherError(message: e.toString()));
      if (initialState == null) return;
      emit(initialState);
    }
  }
}
