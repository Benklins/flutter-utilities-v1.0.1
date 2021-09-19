import 'package:flutter/material.dart';

abstract class ListBaseViewModel<T> extends ChangeNotifier {
  List<T> itemList = [];
  T? currentlySelected;

  void addToList(List<T> items, {bool clear = true}) {
    if (clear) {
      this.itemList.clear();
      if (this.itemList.isNotEmpty) currentlySelected = this.itemList.first;
    }
    itemList.addAll(items);
    notifyListeners();
  }

  void selectItem(T item) {
    this.currentlySelected = item;

    notifyListeners();
  }

  void resetSelected(){
    this.currentlySelected = null;
  }

  void clearList(){
    this.itemList.clear();
  }
}
