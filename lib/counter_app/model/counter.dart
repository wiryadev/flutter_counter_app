import 'dart:collection';

import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter;
  final List<int> _history;

  /// Initialize counter to 0
  Counter()
      : _counter = 0,
        _history = [];

  /// The current counter state
  int get counter => _counter;

  /// The increases history.
  List<int> get history => UnmodifiableListView<int>(_history);

  void increment() {
    _counter++;
    _history.add(_counter);
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
