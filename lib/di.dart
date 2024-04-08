// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherforecasts/data/sources/local/hive/hive_database.dart';
import 'package:weatherforecasts/secrets.dart';

import 'core/config/app_rest_client.dart';
import 'data/repositories/repositories.dart';
import 'data/sources/remote/services/services.dart';
import 'domain/repositories/repositories.dart';
import 'ui/main/cubit/get_current_weather_cubit.dart';

class DependencyInjection {
  DependencyInjection._();
  static GetIt get DI => GetIt.instance;

  static Future<void> initialize() async {
    await _initializeServices();
    await _initializeDatabase();
    await _initializeRepositories();
    await _initializeBlocs();
  }

  static Future<void> _initializeServices() async {
// Client Http Services
    DI.registerSingleton<Dio>(AppRestClient(baseURL: baseURL, apiKey: apiKey).dio);

    DI.registerSingleton<WeatherService>(WeatherService(DI.get()));
  }

  static Future<void> _initializeDatabase() async {
    final database = await HiveDatabase.instance();
    DI.registerSingleton<HiveDatabase>(database);
  }

  static Future<void> _initializeRepositories() async {
    DI.registerSingleton<IWeatherRepository>(WeatherRepository(DI.get(), DI.get()));
  }

  static Future<void> _initializeBlocs() async {
    Bloc.observer = const SimpleBlocObserver();

    DI.registerFactory<GetCurrentWeatherCubit>(() => GetCurrentWeatherCubit(DI.get()));
  }
}
