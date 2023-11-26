import 'package:kwlib/src/log/colors.dart';
import 'package:logger/logger.dart';

///
/// User this class to log the app.
///
class Probe {
  final Logger _logWithFourLines = Logger(
    printer: PrettyPrinter(
      methodCount: 4, // number of method calls to be displayed
      lineLength: 1, // width of the output
      printEmojis: false, // Print an emoji for each log message
      excludePaths: _excludePaths,
      excludeBox: {
        Level.info: true,
      },
    ),
  );

  final Logger _logWithOneLine = Logger(
    printer: PrettyPrinter(
      methodCount: 1, // number of method calls to be displayed
      lineLength: 1, // width of the output
      printEmojis: false, // Print an emoji for each log message
      excludePaths: _excludePaths,
      excludeBox: {
        Level.info: true,
      },
    ),
  );

  final Logger _logWithNoLine = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // number of method calls to be displayed
      lineLength: 1, // width of the output
      printEmojis: false, // Print an emoji for each log message
      excludePaths: _excludePaths,
      excludeBox: {
        Level.info: true,
      },
    ),
  );

  static const _excludePaths = [
    'package:sudoku_shared/src/bash/probe.dart',
    'package:sudoku_shared/src/bash/flow_ram.dart',
    'package:flutter/',
    'dart:',
  ];

  int _pingCounter = 0;

  /// Just pings the log with current source file.
  void get ping {
    final str = 'PING:$_pingCounter '.green;
    _pingCounter = _pingCounter + 1;
    _logWithOneLine.i(str);
  }

  int _epochStart = DateTime.now().millisecondsSinceEpoch;
  int _epochLast = DateTime.now().millisecondsSinceEpoch;

  /// For measuring execution. Start time.
  void get timerStart {
    _epochStart = DateTime.now().millisecondsSinceEpoch;
    _epochLast = _epochStart;
    final fromStart = '0'.padLeft(10);
    final fromLast = '0'.padLeft(10);
    final str = 'TIMER:$fromStart $fromLast  Start'.purple;
    _logWithOneLine.i(str);
  }

  /// For measuring execution. Start time.
  void timerPing(String msg) {
    final epochNow = DateTime.now().millisecondsSinceEpoch;
    final fromStart = '${epochNow - _epochStart}'.padLeft(10);
    final fromLast = '${epochNow - _epochLast}'.padLeft(10);
    _epochLast = epochNow;
    final str = 'TIMER:$fromStart $fromLast  $msg'.purple;
    _logWithNoLine.i(str);
  }

  /// Dumps name, value and current source file.
  void dump(String name, dynamic value) {
    final str = '$name: $value  '.purple;
    _logWithOneLine.i(str);
  }

  /// Displays info and current source file.
  void i(dynamic value) {
    final str = '$value  '.cyan;
    _logWithOneLine.i(str);
  }

  /// Displays info and current source file.
  void i4(dynamic value) {
    final str = '$value  '.cyan;
    _logWithFourLines.i(str);
  }

  /// Error message with 4 source line in a box.
  void e(dynamic message) => _logWithFourLines.e(message);

  /// Warning message with 4 source line in a box.
  void w(dynamic message) => _logWithFourLines.w(message);
}
