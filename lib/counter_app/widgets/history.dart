import 'package:flutter/material.dart';
import 'package:flutter_counter_app/counter_app/widgets/counter_state.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterState = CounterState.of(context).model;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The title
        const Text('Increment History'),

        // Actual List
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 16,
            ),
            child: SizedBox(
              height: 40,
              child: AnimatedBuilder(
                animation: counterState,
                builder: (context, _) {
                  if (counterState.history.isNotEmpty) {
                    // Moving the scroll controller to the end
                    controller.animateTo(
                      controller.position.maxScrollExtent + 50 + 10,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }

                  return ListView.separated(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: counterState.history.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, index) => Card(
                      elevation: 4,
                      shadowColor: Colors.blueAccent,
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Text('${counterState.history[index]}'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
