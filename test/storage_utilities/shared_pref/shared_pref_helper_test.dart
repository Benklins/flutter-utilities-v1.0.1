import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utilities/storage_utility/shared_pref/storage_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  setUp(
    () {
      SharedPreferences.setMockInitialValues(
        {'string_key': 'Hello World', 'int_key': 2000, 'bool_key': true},
      );
    },
  );

  group(
    'Test get',
    () {
      group(
        'Test getBoolean()',
        () {
          test(
            'Test that actual value is returned, when getBolean() called',
            () async {
              expect(await StorageHelper.getBoolean('bool_key', false), true);
            },
          );

          test(
            'Test that actual default value is returned, when getBolean() called'
            'and key doesnt exists',
            () async {
              expect(
                  await StorageHelper.getBoolean('bool_key_not_exist', false),
                  false);
            },
          );
        },
      );

      group(
        'Test getString()',
        () {
          test(
            'Test that actual value is returned, when getString() called with correct key',
            () async {
              expect(
                  await StorageHelper.getString('string_key'), 'Hello World');
            },
          );

          test(
            'Test that null is returned, when getString() called'
            'and key doesnt exists',
            () async {
              expect(
                  await StorageHelper.getString('string_key_not_exist'), null);
            },
          );
        },
      );
    },
  );

  group(
    'Test shared pref setter',
    () {
      group(
        'Test setString()',
        () {
          test(
            'Test that NO value is set when setString() called and key is empty',
            () async {
              StorageHelper.setString('', 'Yeah');

              expect(await StorageHelper.getString(''), null);
            },
          );

          test(
            'Test that NO value is set when setString() called and value is empty',
            () async {
              StorageHelper.setString('new_string_key', '');

              expect(await StorageHelper.getString('new_string_key'), null);
            },
          );
        },
      );

      group(
        'Test setBoolean()',
        () {
          test(
            'Test that NO value is set when setBoolean() called and key is empty',
            () async {
              StorageHelper.setBoolean('', true);

              expect(await StorageHelper.getBoolean('', false), false);
            },
          );
        },
      );
    },
  );

  group(
    'Test remove()',
    () {
      test(
        'Test that when remove(key), the value mapped to that key is removed',
        () async {
          StorageHelper.remove('string_key');

          expect(await StorageHelper.getString('storage_key'), null);
        },
      );
    },
  );
}
