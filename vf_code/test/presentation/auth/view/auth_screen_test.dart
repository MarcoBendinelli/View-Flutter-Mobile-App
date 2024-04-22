import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/presentation/auth/view/auth_screen.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [AuthScreen] widget:
///
///   1. Verify that has a [MaterialPage]
///   2. [AuthScreen] renders correctly the [AuthContent] widget.
void main() {
  group('AuthScreen', () {
    test('has a page', () {
      expect(AuthScreen.page(), isA<MaterialPage<void>>());
    });
    testWidgets('renders the AuthContent', (tester) async {
      await tester.pumpWidget(
        getTestApp(
            homeTestApp: RepositoryProvider<AuthenticationRepository>(
          create: (_) => MockAuthenticationRepository(),
          child: const AuthScreen(),
        )),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AuthContent), findsOneWidget);
    });
  });
}
