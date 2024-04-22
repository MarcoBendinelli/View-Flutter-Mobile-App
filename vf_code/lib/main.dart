import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:view_app/bootstrap.dart';
import 'package:view_app/app/view/app.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/firebase_options.dart';

/// The main entry point for the Flutter application.
///
/// It initializes the Flutter framework, sets up the [AppBlocObserver]
/// for observing state changes and errors within the BLoC architecture,
/// initializes Firebase, and boots the application using the [bootstrap] function.
Future<void> main() async {
  // Ensure that Flutter is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Set a custom BlocObserver for observing Bloc state changes.
  Bloc.observer = const AppBlocObserver();

  // Initialize Firebase with the default options for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure dependency injection using get_it.
  configureDependencies();

  // Retrieve an instance of AuthenticationRepository from the configured dependencies.
  final authenticationRepository = getIt<AuthenticationRepository>();

  // Wait for the user to be available before bootstrapping the application.
  await authenticationRepository.user.first;

  // Bootstrap the application with the provided AuthenticationRepository.
  await bootstrap(
    () => App(authenticationRepository: authenticationRepository),
  );
}
