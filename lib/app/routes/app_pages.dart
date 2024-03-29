import 'package:weatherforecasts/ui/ui.dart';
import 'package:get/get.dart';

import 'routes.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: Routes.INITIAL,
    page: () => const MainPage(),
  ),
  GetPage(
    name: Routes.MAPS,
    page: () => const MapsPage(),
  ),
  GetPage(
    name: Routes.WEATHER_DETAIL,
    page: () => const WeatherDetailPage(),
  ),
];
