import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:view_app/presentation/auth/auth.dart';

/// This test file contains unit tests for the [AuthState] class:
///
///   1. Verify value comparisons for [AuthState] instances.
///   2. Verify [copyWith] feature.
void main() {
  group('AuthState', () {
    test('supports value comparisons', () {
      expect(const AuthState(), const AuthState());
    });

    test('returns same object when no properties are passed', () {
      expect(const AuthState().copyWith(), const AuthState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const AuthState().copyWith(status: FormzSubmissionStatus.initial),
        const AuthState(),
      );
    });
  });
}
