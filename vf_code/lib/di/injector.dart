import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:view_app/di/injector.config.dart';

/// [GetIt] for managing dependency injection.
///
/// It is a simple service locator for Dart and Flutter projects.
/// It allows the registration and retrieval of instances of classes
/// or services throughout the application.
final getIt = GetIt.instance;

/// Configuration function for initializing dependency injection with [GetIt].
///
/// This function is annotated with `@InjectableInit` to indicate that it is
/// the initialization point for dependency injection using `get_it`.
/// It configures the provided [GetIt] instance by invoking the generated
/// `$initGetIt` method.
///
/// #### Parameters:
///   - [initializerName] : The name of the initializer method (default is '$initGetIt').
///   - [preferRelativeImports] : Whether to prefer relative imports.
///   - [asExtension] : Whether to use the initializer as an extension method.
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  $initGetIt(getIt);
}
