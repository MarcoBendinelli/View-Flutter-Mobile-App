import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/data/model/view_user.dart';

class MockUser extends Mock implements ViewUser {}

/// This test file contains unit tests for the [AppState] class:
///
///   1. Verifying that [AppState.unauthenticated()] has the correct status and an empty user.
///   2. Confirming that [AppState.authenticated(user)] has the correct status and the provided user.
void main() {
  group('AppState', () {
    group('unauthenticated', () {
      test('has correct status', () {
        final state = AppState.initial();
        expect(state.status, AppStatus.unauthenticated);
        expect(state.user, ViewUser.empty);
      });
    });

    group('authenticated', () {
      test('has correct status', () {
        final user = MockUser();
        final state = AppState.authenticated(user: user);
        expect(state.status, AppStatus.authenticated);
        expect(state.user, user);
      });
    });
  });
}
