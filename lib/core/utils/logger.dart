import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // 호출 스택에서 보여줄 메서드 수
      errorMethodCount: 8, // 에러 발생시 보여줄 메서드 수
      lineLength: 120, // 로그 라인 길이
      colors: true, // 색상 사용 여부
      printEmojis: true, // 이모지 사용 여부
      printTime: true, // 시간 표시 여부
    ),
  );

  static void debug(dynamic message) {
    _logger.d(message);
  }

  static void info(dynamic message) {
    _logger.i(message);
  }

  static void warning(dynamic message) {
    _logger.w(message);
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
