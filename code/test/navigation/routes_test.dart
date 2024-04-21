import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/navigation/routes.dart';
import 'package:view_app/presentation/auth/auth.dart';
import 'package:view_app/presentation/first_user_selection/first_user_selection.dart';
import 'package:view_app/presentation/landing/landing_screen.dart';

/// This test file contains unit tests for the [onGenerateAppViewPages] function:
///
///   1. Testing when [AppStatus.authenticated], [LandingScreen] is expected.
///   2. Testing when [AppStatus.unauthenticated], [AuthScreen] is expected.
///   3. Testing when [AppStatus.firstSelection], [TopicSelectionScreen] is expected.
void main() {
  group('onGenerateAppViewPages', () {
    test('returns [LandingScreen] when authenticated', () {
      expect(
        onGenerateAppViewPages(AppStatus.authenticated, []),
        [
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<LandingScreen>(),
          )
        ],
      );
    });

    test('returns [AuthScreen] when unauthenticated', () {
      expect(
        onGenerateAppViewPages(AppStatus.unauthenticated, []),
        [
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<AuthScreen>(),
          )
        ],
      );
    });

    test('returns [TopicSelectionScreen] when in topicSelection state', () {
      expect(
        onGenerateAppViewPages(AppStatus.firstSelection, []),
        [
          isA<MaterialPage<void>>().having(
            (p) => p.child,
            'child',
            isA<TopicSelectionScreen>(),
          )
        ],
      );
    });
  });
}
