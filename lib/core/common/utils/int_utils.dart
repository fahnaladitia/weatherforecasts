part of '../common.dart';

extension IntUtils on int {
  String get millisecondsToHourMinute {
    final int hour = this ~/ 3600000;
    final int minute = (this % 3600000) ~/ 60000;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String get dayInWeekInIndonesia {
    switch (this) {
      case 0:
        return 'Senin';
      case 1:
        return 'Selasa';
      case 2:
        return 'Rabu';
      case 3:
        return 'Kamis';
      case 4:
        return 'Jumat';
      case 5:
        return 'Sabtu';
      case 6:
        return 'Minggu';
      default:
        return '';
    }
  }
}
