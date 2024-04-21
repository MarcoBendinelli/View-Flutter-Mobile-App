import 'package:flutter/material.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/presentation/auth/auth.dart';
import 'package:view_app/presentation/first_user_selection/first_user_selection.dart';
import 'package:view_app/presentation/landing/landing_screen.dart';

/// Generates a list of [Page] objects based on the current [AppStatus].
///
/// Returns a list with a single [MaterialPage] containing either [LandingScreen]
/// or [AuthScreen] based on the [AppStatus].
List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [LandingScreen.page()];
    case AppStatus.firstSelection:
      return [TopicSelectionScreen.page()];
    case AppStatus.unauthenticated:
      return [AuthScreen.page()];
  }
}
