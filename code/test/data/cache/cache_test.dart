import 'package:flutter_test/flutter_test.dart';
import 'package:view_app/data/cache/view_user_cache.dart';
import 'package:view_app/data/model/view_user.dart';

import '../../utils/utils.dart';

/// This test file contains unit tests for the [ViewUserCache] class:
///
///   1. The [write] method should update data with the provided value.
///   2. The [read] method should return the current data in the cache.
///   3. The [updateUserInfo] method should update specific attributes in the cache
///   and not change unspecified attributes.
void main() {
  group('ViewUserCache', () {
    test('write should update data with the provided value', () {
      final cache = ViewUserCache();
      final newValue = MockTests.userTest;

      cache.write(value: newValue);

      expect(cache.data, equals(newValue));
    });

    test('read should return the current data in the cache', () {
      final initialValue = ViewUser.empty;
      final cache = ViewUserCache()..write(value: initialValue);

      final result = cache.read();

      expect(result, equals(initialValue));
    });

    test(
        'updateUserInfo should update specific attributes in the cache and not change unspecified attributes',
        () {
      final initialValue = MockTests.userTest;
      final cache = ViewUserCache()..write(value: initialValue);

      cache.updateUserInfo(
          email: 'updated@example.com', username: 'updateduser');

      final expectedValue = initialValue.copyWith(
          email: 'updated@example.com', username: 'updateduser');
      expect(cache.data, equals(expectedValue));
    });
  });
}
