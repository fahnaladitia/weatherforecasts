part of '../common.dart';

extension DoubleUtils on double {
  // convert double milliseconds to minute:seconds
  String displayOfMinute() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final duration = Duration(seconds: toInt());
    final minute = twoDigits(duration.inMinutes);
    final second = twoDigits(duration.inSeconds.remainder(60));
    return '$minute:$second';
  }

  // convert double milliseconds to hour:minute:seconds
  String displayOfHourMinuteSecond() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final duration = Duration(seconds: toInt());
    final hour = twoDigits(duration.inHours);
    final minute = twoDigits(duration.inMinutes.remainder(60));
    final second = twoDigits(duration.inSeconds.remainder(60));
    return '$hour:$minute:$second';
  }

  String displayTimeCountDown() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final duration = Duration(seconds: toInt());
    if (duration.inDays > 0) {
      return '${duration.inDays} hari lagi';
    }
    final hour = twoDigits(duration.inHours.remainder(24));
    final minute = twoDigits(duration.inMinutes.remainder(60));
    final second = twoDigits(duration.inSeconds.remainder(60));
    return '$hour:$minute:$second';
  }
}
