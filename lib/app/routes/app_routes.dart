// ignore_for_file: constant_identifier_names, unused_field

abstract class Routes {
  Routes._();
  static const INITIAL = _Paths.MAIN;
  static const MAPS = _Paths.MAPS;
  static const WEATHER_DETAIL = _Paths.WEATHER_DETAIL;
}

abstract class _Paths {
  _Paths._();
  static const MAIN = '/';
  static const MAPS = '/maps_page';
  static const WEATHER_DETAIL = '/weather_detail_page';
}
