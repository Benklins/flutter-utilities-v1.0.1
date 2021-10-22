import 'package:flutter_test/flutter_test.dart';

import 'list_base_viewmodel_impl.dart';

main() {
  late ListBaseViewModelImpl listBaseViewModel;

  setUp(
    () {
      listBaseViewModel = ListBaseViewModelImpl();
    },
  );

  group(
    "Test addToList()",
    () {
      test(
        "Ensure list is cleared before insertion when addToList(items, clear =true) called",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.addToList(['My name', 'Is'], clear: true);
          expect(listBaseViewModel.itemList, ['My name', 'Is']);
        },
      );

      test(
        "Ensure previous list is NOT cleared before insertion when addToList(items, clear =false) called",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.addToList(['My name', 'Is'], clear: false);
          expect(
              listBaseViewModel.itemList, ['Hello', 'World', 'My name', 'Is']);
        },
      );
    },
  );

  group(
    "Test selectItem()",
    () {
      test(
        "Ensure currentlySelected is set when selectItem() ",
        () {
          listBaseViewModel.selectItem("Hello");
          expect(listBaseViewModel.currentlySelected, "Hello");
        },
      );
    },
  );

  group(
    "Test resetSelected()",
    () {
      test(
        "Ensure currentlySelected is set to NULL when resetSelected() ",
        () {
          listBaseViewModel.resetSelected();
          expect(listBaseViewModel.currentlySelected, null);
        },
      );
    },
  );

  group(
    "Test clearList()",
    () {
      test(
        "Ensure itemList is cleared when clearList() called",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.clearList();

          expect(listBaseViewModel.itemList, []);
        },
      );
    },
  );

  group(
    "Test replaceByIndex()",
    () {
      test(
        "Ensure specicified item is replaced at the index specified in list",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.replaceByIndex(index: 0, replacement: 'Bye');

          expect(listBaseViewModel.itemList, ['Bye', 'World']);
        },
      );

      test(
        "Ensure nothing happens when an error occurred while replacing "
        "Example the index is no valid",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.replaceByIndex(index: 3, replacement: 'Bye');

          expect(listBaseViewModel.itemList, ['Hello', 'World']);
        },
      );
    },
  );

  group(
    "Test replaceWhere()",
    () {
      test(
        "Ensure specicified item is replaced where item is found in list",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.replaceWhere(
              whereClause: (item) => item == 'Hello', replacement: 'Bye');

          expect(listBaseViewModel.itemList, ['Bye', 'World']);
        },
      );

      test(
        "Ensure nothing happens when where item is not found "
        "Example the index is no valid",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          listBaseViewModel.replaceWhere(
              whereClause: (item) => item == 'Nama', replacement: 'Bye');

          expect(listBaseViewModel.itemList, ['Hello', 'World']);
        },
      );
    },
  );

  group(
    "Test findWhere()",
    () {
      test(
        "Ensure that correct item is returned when where clause runs to true",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          expect(
              listBaseViewModel.findWhere(
                  whereClause: (item) => item == 'Hello'),
              "Hello");
        },
      );

      test(
        "Ensure that NULL is returned when where clause runs to false",
        () {
          listBaseViewModel.itemList = ['Hello', 'World'];

          expect(
            listBaseViewModel.findWhere(whereClause: (item) => item == 'Nama'),
            null,
          );
        },
      );
    },
  );
}
