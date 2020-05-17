import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';

/// A widget which opens a render of the log console as a page route once a box/circle gesture is made. This should be as high as possible in widget tree.
class OpenConsoleOnGesture extends StatelessWidget {
  /// The widget's child
  final Widget child;

  /// Constructs a new instance of `OpenConsoleOnGesture`.
  ///
  /// `child` is required and cannot be null.
  const OpenConsoleOnGesture({
    @required this.child,
    Key key,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LogConsoleOnGesture(
      child: child,
      gesture: Gesture.boxCircle,
      dark: true,
      debugOnly: false,
      levelsToFilter: [Level.debug, Level.warning, Level.error],
      defaultLevel: Level.debug,
      lineWidth: 0,
      spaceBetweenElements: true,
    );
  }
}
