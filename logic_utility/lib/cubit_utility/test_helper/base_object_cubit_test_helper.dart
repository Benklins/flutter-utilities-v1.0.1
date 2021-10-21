import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart' as test;

import '../../logic_utility.dart';

///Where [B] is the Cubit
///[Obj] is the object
class BaseObjectCubitTestHelper<B extends BaseObjectCubit<Obj>, Obj> {
  late B baseObjectCubit;
  late FutureOr<void> Function() setup;

  void initBaseList(B cubit) {
    baseObjectCubit = cubit;
  }

  setUp(FutureOr<void> Function() setup) {
    this.setup = setup;
  }

  @isTest
  void testBaseObjectSuccess({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    B Function()? build,
    required Obj objectExpected,
  }) {
    test.test('emits [BaseObjectLoading(), BaseObjectLoaded()] when $whenText',
        () async {
      // ignore: invalid_use_of_visible_for_testing_member
      await testBloc<B, BaseObjectState>(
        setUp: setup,
        build: build ?? () => baseObjectCubit,
        act: act,
        expect: () => [
          BaseObjectLoading(),
          BaseObjectLoaded(objectExpected),
        ],
        verify: (cubit) {
          verify(cubit);
        },
      );
    });
  }

  @isTest
  void testBaseObjectError({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    required String error,
    B Function()? build,
  }) {
    test.test(
      'emits [BaseObjectLoading(), BaseObjectError()] when $whenText',
      () async {
        // ignore: invalid_use_of_visible_for_testing_member
        await testBloc<B, BaseObjectState>(
          setUp: setup,
          build: build ?? () => baseObjectCubit,
          act: act,
          expect: () => [
            BaseObjectLoading(),
            BaseObjectError(error),
          ],
          verify: (cubit) {
            verify(cubit);
          },
        );
      },
    );
  }

  @isTest
  testVerifyMethodCalled() {}
}
