import 'package:flutter/material.dart';
import 'package:flutter_counter_app/counter_app/widgets/counter_state.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final counterReference = CounterState.of(context).model;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: CounterState.of(context).model.decrement,
          child: const Text('-'),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: AnimatedBuilder(
            animation: counterReference,
            builder: (context, _) => Text(
              '${counterReference.counter}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: CounterState.of(context).model.increment,
          child: const Text('+'),
        ),
      ],
    );
  }
}
