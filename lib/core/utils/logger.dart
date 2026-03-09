import 'package:flutter/foundation.dart';

/// Logging Utility
/// Handles all logging operations in the app

class AppLogger {
  static void log(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '';
      print('$prefix $message');
    }
  }

  static void logError(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '';
      print('ERROR: $prefix $message');
    }
  }

  static void logWarning(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '';
      print('WARNING: $prefix $message');
    }
  }

  static void logInfo(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '';
      print('INFO: $prefix $message');
    }
  }

  static void logSuccess(String message, {String? tag}) {
    if (kDebugMode) {
      final prefix = tag != null ? '[$tag]' : '';
      print('SUCCESS: $prefix $message');
    }
  }
}
