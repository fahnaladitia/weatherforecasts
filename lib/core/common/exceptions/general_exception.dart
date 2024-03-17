part of '../common.dart';

class GeneralException implements Exception {
  final String code;
  final String message;
  GeneralException({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
    };
  }

  factory GeneralException.fromMap(Map<String, dynamic> map) {
    return GeneralException(
      code: map['code'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralException.fromJson(String source) =>
      GeneralException.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeneralException(code: $code, message: $message)';
}
