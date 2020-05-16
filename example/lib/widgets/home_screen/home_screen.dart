import 'package:flutter/material.dart';
import 'package:flutter_custom_logger/flutter_custom_logger.dart';

class MyObj {
  final String title;

  const MyObj(this.title);
}

class MyObj2 {
  final String title;

  const MyObj2(this.title);

  @override
  String toString() => '{title: $title}';
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Log.debug('Hello world');
    final a = MyObj('hey');
    Log.warning('Might be an issue: $a');
    final b = MyObj2('pa');
    Log.error('Oh o: $b');

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
