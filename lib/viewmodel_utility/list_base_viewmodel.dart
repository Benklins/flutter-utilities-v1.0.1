import 'package:flutter/material.dart';

abstract class ListBaseViewModel<T> extends ChangeNotifier {
  List<T> itemList = [];
  T? currentlySelected;

  void addToList(List<T> items, {bool clear = true}) {
    if (clear) {
      this.itemList.clear();
    }
    itemList.addAll(items);
    notifyListeners();
  }

  void selectItem(T item) {
    this.currentlySelected = item;

    notifyListeners();
  }

  void resetSelected() {
    this.currentlySelected = null;
    notifyListeners();
  }

  void clearList() {
    this.itemList.clear();
    notifyListeners();
  }

  void replaceByIndex({required int index, required T replacement}) {
    try {
      this.itemList[index] = replacement;
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void replaceWhere({
    required bool Function(T item) whereClause,
    required T replacement,
  }) {
    T? prevItem = findWhere(whereClause: whereClause);

    if (prevItem != null) {
      int index = itemList.indexOf(prevItem);
      this.itemList[index] = replacement;
    }
    notifyListeners();
  }

  T? findWhere({required bool Function(T item) whereClause}) {
    try {
      return itemList.where((element) => whereClause(element)).first;
    } catch (_) {
      return null;
    }
  }

  void insert({int? index, required T item}) {
    if (index == null)
      itemList.add(item);
    else
      itemList.insert(index, item);

    notifyListeners();
  }
}
