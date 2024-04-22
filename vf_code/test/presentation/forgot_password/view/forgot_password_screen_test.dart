import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/presentation/forgot_password/forgot_password.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [ForgotPasswordScreen] widget:
///
///   1. Verify that as a [MaterialPageRoute]
///   2. [ForgotPasswordScreen] renders correctly the [MaterialPageRoute] widget.
void main() {
  group('ForgotPasswordScreen', () {
    test('has a page', () {
      expect(ForgotPasswordScreen.route(), isA<MaterialPageRoute<void>>());
    });
    testWidgets('renders the Forgot Password Content', (tester) async {
      await tester.pumpWidget(
        getTestApp(
            homeTestApp: RepositoryProvider<AuthenticationRepository>(
          create: (_) => MockAuthenticationRepository(),
          child: const ForgotPasswordScreen(),
        )),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ForgotPasswordContent), findsOneWidget);
    });
  });
}
