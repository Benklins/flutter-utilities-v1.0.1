import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart' as test;

import '../cubit_utility_export.dart';

///Where [B] is the Cubit
///[Obj] is the object
class BaseListCubitTestHelper<B extends BaseListCubit<Obj>, Obj> {
  late B baseListCubit;
  late FutureOr<void> Function() setup;

  void initBaseList(B cubit) {
    baseListCubit = cubit;
  }

  setUp(FutureOr<void> Function() setup) {
    this.setup = setup;
  }

  @isTest
  void testInitialBaseListSuccess({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    B Function()? build,
    required List<Obj> cubitListExpected,
    required List<Obj> viewModelListExpected,
  }) {
    test.test('emits [BaseListLoading(), BaseListLoaded()] when $whenText',
        () async {
      // ignore: invalid_use_of_visible_for_testing_member
      await testBloc<B, BaseListState>(
        setUp: setup,
        build: build ?? () => baseListCubit,
        act: act,
        expect: () => [
          BaseListLoading(),
          BaseListLoaded(cubitListExpected),
        ],
        verify: (cubit) {
          expect(cubit.viewModel.itemList, viewModelListExpected);
          verify(cubit);
        },
      );
    });
  }

  @isTest
  void testBaseListLoadingEmptySuccess({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    required List<Obj> viewModelListExpected,
    B Function()? build,
  }) {
    test.test('emits [BaseListLoading(), BaseListEmptyState()] when $whenText',
        () async {
      // ignore: invalid_use_of_visible_for_testing_member
      await testBloc<B, BaseListState>(
        setUp: setup,
        build: build ?? () => baseListCubit,
        act: act,
        expect: () => [
          BaseListLoading(),
          BaseListEmptyState(),
        ],
        verify: (cubit) {
          expect(cubit.viewModel.itemList, viewModelListExpected);
          verify(cubit);
        },
      );
    });
  }

  @isTest
  void testNextBaseListSuccess({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    required List<Obj> cubitListExpected,
    required List<Obj> viewModelListExpected,
    B Function()? build,
  }) {
    test.test(
      'emits [BaseBottomListLoading(), BaseListLoaded()] when $whenText',
      () async {
        // ignore: invalid_use_of_visible_for_testing_member
        await testBloc<B, BaseListState>(
          setUp: setup,
          build: build ?? () => baseListCubit,
          act: act,
          expect: () => [
            BaseBottomListLoading(),
            BaseListLoaded(cubitListExpected),
          ],
          verify: (cubit) {
            expect(cubit.viewModel.itemList, viewModelListExpected);
            verify(cubit);
          },
        );
      },
    );
  }

  @isTest
  void testInitialBaseListError({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    required String error,
    B Function()? build,
  }) {
    test.test(
      'emits [BaseListLoading(), BaseListError()] when $whenText',
      () async {
        // ignore: invalid_use_of_visible_for_testing_member
        await testBloc<B, BaseListState>(
          setUp: setup,
          build: build ?? () => baseListCubit,
          act: act,
          expect: () => [
            BaseListLoading(),
            BaseListError(error),
          ],
          verify: (cubit) {
            verify(cubit);
          },
        );
      },
    );
  }

  @isTest
  void testNextBaseListError({
    required String whenText,
    required Function(B cubit) act,
    required Function(B cubit) verify,
    required String error,
    B Function()? build,
  }) {
    test.test(
      'emits [BaseBottomListLoading(), BaseListError()] when $whenText',
      () async {
        // ignore: invalid_use_of_visible_for_testing_member
        await testBloc<B, BaseListState>(
          setUp: setup,
          build: build ?? () => baseListCubit,
          act: act,
          expect: () => [
            BaseBottomListLoading(),
            BaseListError(error),
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
