part of '../common.dart';

extension StringUtils on String {
  // First letter of each word is capitalized
  String get capitalizeFirstLetter {
    final words = split(' ');
    final capitalized = words.map((word) {
      final firstLetter = word.substring(0, 1).toUpperCase();
      final remainingLetters = word.toLowerCase().substring(1);
      return '$firstLetter$remainingLetters';
    });
    return capitalized.join(' ');
  }

  Color get toColor {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  // from string to IconData
  IconData get toIconData => IconData(int.parse("0${toUpperCase()}", radix: 16));
}
