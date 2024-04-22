import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/app/app.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/navigation/routes.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Returns a [MaterialApp] to use inside the tests with the specified [homeTestApp] as the home widget.
getTestApp({required Widget homeTestApp}) {
  return ScreenUtilInit(
      designSize:
          const Size(Constants.prototypeWidth, Constants.prototypeHeight),
      builder: (_, __) {
        return MaterialApp(
          theme: viewLightTheme.copyWith(textTheme: testTextTheme),
          darkTheme: viewDarkTheme.copyWith(textTheme: testTextTheme),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: homeTestApp,
        );
      });
}

/// Returns a [MaterialApp] configurable with an [AuthenticationRepository],
/// an [AppBloc], an [AppStatus] and an optional [location].
/// If [location] is provided, it is set as initial route; otherwise, it uses [AppRouter.getInitialRoute()]
/// to get the initial route in based on the [AppStatus] (default is: [AppStatus.unauthenticated]).
/// The route generator callback is also configured to allow navigation inside the application.
getRouterTestApp(
    {required AuthenticationRepository authRepository,
    required AppBloc appBloc}) {
  return ScreenUtilInit(
      designSize:
          const Size(Constants.prototypeWidth, Constants.prototypeHeight),
      builder: (_, __) {
        return BlocProvider.value(
          value: appBloc,
          child: RepositoryProvider.value(
            value: authRepository,
            child: MaterialApp(
              theme: viewLightTheme.copyWith(textTheme: testTextTheme),
              darkTheme: viewDarkTheme.copyWith(textTheme: testTextTheme),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: Builder(builder: (context) {
                AppStatus appState =
                    context.select((AppBloc bloc) => bloc.state.status);
                return FlowBuilder<AppStatus>(
                    state: appState, onGeneratePages: onGenerateAppViewPages);
              }),
            ),
          ),
        );
      });
}

/// A class providing mock data for testing purposes.
class MockTests {
  static ViewUser userTest = ViewUser(
    id: 'test_id',
    email: 'test@test.com',
    username: 'test',
    profession: 'tester',
    photoUrl: '',
    topics: const [],
    following: const [],
    followers: const [],
    createdAt: Timestamp(0, 0),
  );
  static ViewPost postTest = ViewPost(
      authorId: 'authorId',
      authorName: 'authorName',
      authorPhotoUrl: '',
      id: 'id',
      title: 'title',
      subtitle: 'subtitle',
      body: 'body',
      imageUrl: 'imageUrl',
      createdAt: Timestamp.now(),
      topic: const ViewTopic(topicName: 'topicName'),
      readTime: "3 hours",
      bookmarkedBy: const []);
}

/// Text Theme used for testing that does not use [ScreenUtil] for resizing the text sizes
const testTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 30,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    displayMedium: TextStyle(
        fontSize: 28,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    displaySmall: TextStyle(
        fontSize: 24,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    headlineLarge: TextStyle(
        fontSize: 18,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 22,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 16,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    titleLarge: TextStyle(
        fontSize: 14,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: openSans,
      color: AppColors.viewGray,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontFamily: openSans,
      color: AppColors.viewGray,
    ),
    bodyLarge: TextStyle(
      fontSize: 12,
      fontFamily: openSans,
      color: AppColors.viewGray,
    ),
    labelLarge: TextStyle(
        fontSize: 16,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold),
    labelMedium: TextStyle(
        fontSize: 14,
        fontFamily: openSans,
        color: AppColors.viewAlmostBlack,
        fontWeight: FontsWeight.bold));
