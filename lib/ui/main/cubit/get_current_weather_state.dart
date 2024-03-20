part of 'get_current_weather_cubit.dart';

sealed class GetCurrentWeatherState extends Equatable {
  const GetCurrentWeatherState();

  @override
  List<Object> get props => [];
}

final class GetCurrentWeatherInitial extends GetCurrentWeatherState {}

final class GetCurrentWeatherLoading extends GetCurrentWeatherState {}

final class GetCurrentWeatherLoaded extends GetCurrentWeatherState {
  final Weather weather;
  final List<Weather> forecasts;

  const GetCurrentWeatherLoaded({required this.weather, required this.forecasts});

  @override
  List<Object> get props => [weather, forecasts];

  @override
  bool? get stringify => true;
}

final class GetCurrentWeatherError extends GetCurrentWeatherState {
  final String message;

  const GetCurrentWeatherError({required this.message});

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => true;
}
