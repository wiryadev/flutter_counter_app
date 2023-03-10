import 'package:flutter/material.dart';
import 'package:flutter_counter_app/counter_app/model/counter.dart';

class CounterState extends InheritedWidget {
  final Counter model;

  const CounterState({
    super.key,
    required this.model,
    required super.child,
  });

  static CounterState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterState>()!;

  @override
  bool updateShouldNotify(covariant CounterState oldWidget) {
    return model.counter != oldWidget.model.counter ||
        model.history.length != oldWidget.model.history.length;
  }
}
