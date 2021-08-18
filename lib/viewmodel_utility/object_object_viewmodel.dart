import 'package:flutter/material.dart';

abstract class ObjectBaseViewModel<T> extends ChangeNotifier {
  T? item;

  void setItem(T item) {
    this.item = item;
    notifyListeners();
  }

  void clear(){
    item = null;
    notifyListeners();
  }
}
