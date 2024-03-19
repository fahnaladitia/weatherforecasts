// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:geocoding/geocoding.dart';

import 'package:weatherforecasts/core/common/common.dart';

class Weather {
  // final LatLng latLng;
  final WeatherCondition weatherCondition;
  final WeatherMain weatherMain;
  final WeatherWind weatherWind;
  final DateTime date;
  final Placemark? placemark;
  Weather({
    // required this.latLng,
    required this.weatherCondition,
    required this.weatherMain,
    required this.weatherWind,
    required this.date,
    this.placemark,
  });

  String get displayDate => date.display("EEEE, d MMMM yyyy");

  String get displayTime => date.display("HH:mm");

  String get displayLocation {
    return placemark?.subAdministrativeArea ?? placemark?.administrativeArea ?? placemark?.country ?? 'Unknown';
  }

  @override
  String toString() {
    return 'Weather(weatherCondition: $weatherCondition, weatherMain: $weatherMain, weatherWind: $weatherWind, date: $date, placemark: $placemark)';
  }
}

class WeatherCondition {
  final String description;
  final String icon;
  final String main;

  WeatherCondition({
    required this.description,
    required this.icon,
    required this.main,
  });

  String getIconUrl() => 'http://openweathermap.org/img/wn/$icon.png';

  @override
  String toString() => 'WeatherCondition(description: $description, icon: $icon, main: $main)';
}

class WeatherMain {
  final double humidity;
  final double temp;
  final double tempMax;
  final double tempMin;

  WeatherMain({
    required this.humidity,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
  });

  String displayTemperature({bool isMetric = true}) {
    return isMetric ? '$temp°C' : '${(temp * 9 / 5 + 32).toStringAsFixed(1)}°F';
  }

  String displayTemperatureMax({bool isMetric = true}) {
    return isMetric ? '$tempMax°C' : '${(tempMax * 9 / 5 + 32).toStringAsFixed(1)}°F';
  }

  String displayTemperatureMin({bool isMetric = true}) {
    return isMetric ? '$tempMin°C' : '${(tempMin * 9 / 5 + 32).toStringAsFixed(1)}°F';
  }

  String displayHumidity() => '$humidity%';

  @override
  String toString() {
    return 'WeatherMain(humidity: $humidity, temp: $temp, tempMax: $tempMax, tempMin: $tempMin)';
  }
}

class WeatherWind {
  final double speedInMeterPerSecond;

  WeatherWind({
    required this.speedInMeterPerSecond,
  });

  int get speedInKmh => (speedInMeterPerSecond * 3.6).round();

  int get speedInMph => (speedInMeterPerSecond * 2.237).round();

  String display({bool isMetric = true}) {
    return isMetric ? '$speedInKmh km/h' : '$speedInMph mph';
  }

  @override
  String toString() => 'WeatherWind(speedInMeterPerSecond: $speedInMeterPerSecond)';
}
