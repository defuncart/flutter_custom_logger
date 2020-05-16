import 'package:example/widgets/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_logger/flutter_custom_logger.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpenConsoleOnGesture(
        child: HomeScreen(),
      ),
    );
  }
}
