import 'dart:ui';

/// A simple deBouncer utility class to help manage and control
/// the rate at which actions are triggered.
class DeBouncer {
  /// The duration in milliseconds for which to debounce the action.
  final int milliseconds;

  /// The callback action to be executed.
  VoidCallback? action;

  /// Creates a new instance of the [DeBouncer] class with the specified duration.
  DeBouncer({this.milliseconds = 200});

  /// Runs the provided [action] while debouncing repeated calls within
  /// the specified [milliseconds] duration.
  ///
  /// If a previous action is still pending, it cancels the previous action
  /// and sets a new callback. The actual execution of the callback occurs
  /// after the specified [milliseconds] duration has passed.
  void run(VoidCallback action) {
    // If there's a previous action, cancel it
    if (this.action != null) {
      this.action!();
    }

    // Set a new callback to be executed
    this.action = () {
      action();
      this.action = null;
    };

    // Trigger the callback after the specified duration
    Future.delayed(Duration(milliseconds: milliseconds), () {
      // If the action is still set, execute it
      if (this.action != null) {
        this.action!();
      }
    });
  }
}
