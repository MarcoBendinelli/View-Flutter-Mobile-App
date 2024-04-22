import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/forgot_password/cubit/forgot_password_cubit.dart';

/// This test file contains unit tests for the [ForgotPasswordState] class:
///
///   1. Verify value comparisons for [ForgotPasswordState] instances.
///   2. Verify [copyWith] feature.
void main() {
  const email = Email.dirty('email');

  group('ForgotPasswordState', () {
    test('supports value comparisons', () {
      expect(const ForgotPasswordState(), const ForgotPasswordState());
    });

    test('returns same object when no properties are passed', () {
      expect(
          const ForgotPasswordState().copyWith(), const ForgotPasswordState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const ForgotPasswordState()
            .copyWith(status: FormzSubmissionStatus.initial),
        const ForgotPasswordState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const ForgotPasswordState().copyWith(email: email),
        const ForgotPasswordState(email: email),
      );
    });
  });
}
