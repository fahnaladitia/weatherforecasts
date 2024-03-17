// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/config/app_rest_client.dart';

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
    DI.registerFactory<Dio>(() => AppRestClient(baseURL: baseURL, apiKey: apiKey).dio);
  }

  static Future<void> _initializeDatabase() async {}
  static Future<void> _initializeRepositories() async {}
  static Future<void> _initializeBlocs() async {
    Bloc.observer = const SimpleBlocObserver();
  }
}
