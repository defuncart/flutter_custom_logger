import 'package:example/widgets/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_logger/flutter_custom_logger.dart';

void main() {
  Log.init(printToConsole: true, formatForConsole: false);
  runApp(MyApp());
}
