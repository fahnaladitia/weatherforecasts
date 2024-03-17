part of '../common.dart';

class ErrorCodeConstants {
  ErrorCodeConstants._();
  static const String connectionTimeoutCode = 'CONNECTION_TIMEOUT_CODE';
  static const String receiveTimeoutCode = 'RECEIVE_TIMEOUT_CODE';
  static const String sendTimeoutCode = 'SEND_TIMEOUT_CODE';
  static const String cancelCode = 'CANCEL_CODE';
  static const String badCertificateCode = 'BAD_CERTIFICATE_CODE';
  static const String noInternetConnectionCode = 'NO_INTERNET_CONNECTION_CODE';
  static const String unknownCode = 'UNKNOWN_CODE';
}

class ErrorMessageConstants {
  ErrorMessageConstants._();
  static const String connectionTimeoutMessage = 'Connection timeout with server';
  static const String receiveTimeoutMessage = 'Receive timeout in connection with server';
  static const String sendTimeoutMessage = 'Send timeout in connection with server';
  static const String cancelMessage = 'Request to server has been cancelled';
  static const String badCertificateMessage = 'Invalid SSL certificate';
  static const String noInternetConnectionMessage = 'No internet connection';
  static const String unknownMessage = 'Unknown error';
}
