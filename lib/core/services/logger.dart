import 'dart:developer' as developer;

/// Simple logger utility
class AppLogger {
  AppLogger._();

  static void d(String message, {String? tag}) {
    developer.log(message, name: tag ?? 'App');
  }

  static void e(String message, {Object? error, StackTrace? stackTrace, String? tag}) {
    developer.log(
      message,
      name: tag ?? 'App',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void w(String message, {String? tag}) {
    developer.log(message, name: tag ?? 'App', level: 900);
  }

  static void i(String message, {String? tag}) {
    developer.log(message, name: tag ?? 'App', level: 800);
  }
}


