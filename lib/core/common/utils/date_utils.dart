part of '../common.dart';

extension DateUtils on DateTime {
  /// Display date in the format of `dd MMM yyyy`
  /// Example: 01 Jan 2021
  String display([String format = 'dd MMM yyyy', String? locale = "id_ID"]) => DateFormat(format, locale).format(this);

  /// Display date in the format of `dd MMM`
  /// Example: 01 Jan
  String displayDayAndMonth([String? locale = "id_ID"]) {
    return DateFormat('dd MMM', locale).format(this);
  }

  /// Display date in the format of `EEE`
  /// Example: Mon
  String displayDayName([String? locale = "id_ID"]) {
    return DateFormat('EEE', locale).format(this);
  }

  /// Display date in the format of `hh:mm a`
  /// Example: 12:00 AM
  String displayHoursAMorPM([String? locale = "id_ID"]) {
    return DateFormat('hh:mm a', locale).format(this);
  }

  bool isSameDate(DateTime same) {
    var isSame = false;
    isSame = day == same.day && month == same.month && year == same.year;
    return isSame;
  }

  bool isToday() {
    DateTime now = DateTime.now();

    return year == now.year && month == now.month && day == now.day;
  }

  bool isTomorrow() {
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  bool isFuture() {
    DateTime today = DateTime.now();
    return isSameDate(today) || isAfter(today);
  }
}
