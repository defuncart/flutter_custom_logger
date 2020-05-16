import 'package:logger/logger.dart';

/// A custom logger
abstract class Log {
  static Logger _logger;

  /// Initializes the logger
  ///
  /// If `printToConsole`, then logger prints to console
  /// if `formatForConsole`, then logger formats in plain text. Otherwise formats with colors and emojis.
  static void init({bool printToConsole = true, bool formatForConsole = true}) {
    _logger = Logger(
      filter: printToConsole ? _ShowAllLogFilter() : _ShowNoLogFilter(),
      printer: formatForConsole ? _ConsoleLogPrinter() : _AppLogPrinter(),
    );
  }

  /// Logs a debug message
  static void debug(dynamic object) => _logger.d(object);

  /// Logs a warning message
  static void warning(dynamic object) => _logger.w(object);

  /// Logs a error message
  ///
  /// The parameter `error` is optional.
  static void error(dynamic object, {Error error}) => _logger.e(object, error);
}

class _ShowAllLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => true;
}

class _ShowNoLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => false;
}

class _AppLogPrinter extends LogPrinter {
  _AppLogPrinter();

  @override
  void log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = event.level == Level.debug ? '' : PrettyPrinter.levelEmojis[event.level];
    println(color('$emoji${methodName()}'));
    println(color(event.message));
  }

  static final _stackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');
  static final _packageRegex = RegExp(r'(package):([a-z_]*)/([a-zA-z_0-9/\-]*.dart):(\d*:\d*)');

  String methodName() {
    final lines = StackTrace.current.toString().split('\n');
    final regExp = RegExp(r'Logger|Log');

    for (final line in lines) {
      if (!line.contains(regExp)) {
        final match = _stackTraceRegex.matchAsPrefix(line);
        final classMethodName = match.group(1);
        final match2 = _packageRegex.matchAsPrefix(match.group(2));
        final packageName = match2.group(2);
        final fileName = match2.group(3);
        final lineNumber = match2.group(4);

        return '$packageName $fileName $classMethodName $lineNumber';
      }
    }
    return '';
  }
}

extension _MatchExtensions on Match {
  String tryGetGroup(int group) => this != null && groupCount >= group ? this.group(group) : null;
}

class _ConsoleLogPrinter extends LogPrinter {
  _ConsoleLogPrinter();

  @override
  void log(LogEvent event) {
    String levelText;
    switch (event.level) {
      case Level.warning:
        levelText = 'WARNING: ';
        break;
      case Level.error:
        levelText = 'ERROR: ';
        break;
      default:
        levelText = '';
        break;
    }
    println('$levelText${event.message}');
  }
}
