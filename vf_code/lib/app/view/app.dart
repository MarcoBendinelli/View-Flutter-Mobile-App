import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/app/app.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/navigation/routes.dart';
import 'package:view_app/presentation/theme/theme.dart';

/// The root widget of the Flutter application.
///
/// It serves as the entry point for the application and sets up the
/// necessary dependencies and providers.
class App extends StatelessWidget {
  const App(
      {required AuthenticationRepository authenticationRepository, super.key})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: ScreenUtilInit(
            designSize:
                const Size(Constants.prototypeWidth, Constants.prototypeHeight),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return AppView(appTextTheme: viewTextTheme);
            }),
      ),
    );
  }
}

/// It defines the structure of the application's user interface.
/// It utilizes [MaterialApp] and the [FlowBuilder] widget to dynamically update
/// the current route based on the [AuthenticationState].
/// The UI hierarchy is organized by navigating to different pages
/// using the [onGenerateAppViewPages] callback.
class AppView extends StatelessWidget {
  final TextTheme appTextTheme;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppView({super.key, required this.appTextTheme});

  @override
  Widget build(BuildContext context) {
    AppStatus appState = context.select((AppBloc bloc) => bloc.state.status);

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          theme: viewLightTheme.copyWith(textTheme: appTextTheme),
          darkTheme: viewDarkTheme.copyWith(textTheme: appTextTheme),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: FlowBuilder<AppStatus>(
              state: appState, onGeneratePages: onGenerateAppViewPages),
        ));
  }
}
