import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:view_app/data/model/view_user.dart';

/// This Dart file contains unit tests for the [ViewUser] class:
///
///   1. The [ViewUser] class should use value equality.
///   2. The [isEmpty] method should return true for an empty user.
///   3. The [isEmpty] method should return false for a non-empty user.
///   4. The [isNotEmpty] method should return false for an empty user.
///   5. The [isNotEmpty] method should return true for a non-empty user.
void main() {
  group('User', () {
    const id = 'mock-id';
    const email = 'mock-email';

    test('uses value equality', () {
      expect(
        ViewUser(
          email: email,
          id: id,
          username: '',
          profession: '',
          photoUrl: '',
          topics: const [],
          following: const [],
          followers: const [],
          createdAt: Timestamp(0, 0),
        ),
        equals(ViewUser(
          email: email,
          id: id,
          username: '',
          profession: '',
          photoUrl: '',
          topics: const [],
          following: const [],
          followers: const [],
          createdAt: Timestamp(0, 0),
        )),
      );
    });

    test('isEmpty returns true for empty user', () {
      expect(ViewUser.empty.isEmpty, isTrue);
    });

    test('isEmpty returns false for non-empty user', () {
      ViewUser user = ViewUser(
        email: email,
        id: id,
        username: '',
        profession: '',
        photoUrl: '',
        topics: const [],
        following: const [],
        followers: const [],
        createdAt: Timestamp(0, 0),
      );
      expect(user.isEmpty, isFalse);
    });

    test('isNotEmpty returns false for empty user', () {
      expect(ViewUser.empty.isNotEmpty, isFalse);
    });

    test('isNotEmpty returns true for non-empty user', () {
      ViewUser user = ViewUser(
        email: email,
        id: id,
        username: '',
        profession: '',
        photoUrl: '',
        topics: const [],
        following: const [],
        followers: const [],
        createdAt: Timestamp(0, 0),
      );
      expect(user.isNotEmpty, isTrue);
    });
  });
}
