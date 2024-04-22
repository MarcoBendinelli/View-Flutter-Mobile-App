import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

/// Custom [BlocObserver] for observing the state changes and errors
/// that occur within the BLoC (Business Logic Component) architecture.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // Log the state change when a BLoC's state changes.
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // Log errors that occur within a BLoC.
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Utility function for bootstrapping the Flutter application.
///
/// It sets up global error handling for Flutter errors and associates
/// the [AppBlocObserver] with the BLoC architecture to observe state changes
/// and errors within BLoCs.
///
/// The function takes a `builder` function that returns a [Widget] and runs
/// the Flutter application with the provided widget.
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Set up global error handling for Flutter errors.
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Associate the custom [AppBlocObserver] with the BLoC architecture.
  Bloc.observer = const AppBlocObserver();

  // Run the Flutter application with the provided widget.
  runApp(await builder());
}
