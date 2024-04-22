import 'package:flutter/cupertino.dart';
import 'package:view_app/app/view/app.dart';
import 'package:view_app/bootstrap.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';

Future<void> mainTest() async {
  // Ensure that Flutter is initialized.
  WidgetsFlutterBinding.ensureInitialized();

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
