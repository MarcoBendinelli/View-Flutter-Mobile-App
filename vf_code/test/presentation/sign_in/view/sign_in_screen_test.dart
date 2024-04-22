import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [SignInScreen] widget:
///
///   1. Verify that as a [MaterialPageRoute]
///   2. [SignInScreen] renders correctly the [MaterialPageRoute] widget.
void main() {
  group('SignInScreen', () {
    test('has a page', () {
      expect(SignInScreen.route(), isA<MaterialPageRoute<void>>());
    });
    testWidgets('renders a LoginForm', (tester) async {
      await tester.pumpWidget(
        getTestApp(
            homeTestApp: RepositoryProvider<AuthenticationRepository>(
          create: (_) => MockAuthenticationRepository(),
          child: const SignInScreen(),
        )),
      );
      await tester.pumpAndSettle();
      expect(find.byType(SignInForm), findsOneWidget);
    });
  });
}
