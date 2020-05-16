import 'package:example/widgets/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger_flutter/logger_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogConsoleOnShake(
        dark: true,
        debugOnly: false,
        child: HomeScreen(),
      ),
    );
  }
}
