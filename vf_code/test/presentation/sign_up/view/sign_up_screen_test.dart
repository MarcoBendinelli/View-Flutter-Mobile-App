import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/presentation/sign_up/sign_up.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [SignUpScreen] widget:
///
///   1. Verify that as a [MaterialPageRoute]
///   2. [SignUpScreen] renders correctly the [SignUpForm] widget.
void main() {
  group('SignUpScreen', () {
    test('has a page', () {
      expect(SignUpScreen.route(), isA<MaterialPageRoute<void>>());
    });
    testWidgets('renders a SignUpForm', (tester) async {
      await tester.pumpWidget(
        getTestApp(
            homeTestApp: RepositoryProvider<AuthenticationRepository>(
              create: (_) => MockAuthenticationRepository(),
              child: const SignUpScreen(),
            )),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SignUpForm), findsOneWidget);
    });
  });
}
