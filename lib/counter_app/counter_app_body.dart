import 'package:flutter/material.dart';
import 'package:flutter_counter_app/counter_app/model/counter.dart';
import 'package:flutter_counter_app/counter_app/widgets/app_title.dart';
import 'package:flutter_counter_app/counter_app/widgets/counter_button.dart';
import 'package:flutter_counter_app/counter_app/widgets/counter_state.dart';
import 'package:flutter_counter_app/counter_app/widgets/history.dart';

class CounterAppBody extends StatelessWidget {
  const CounterAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterState(
      model: Counter(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              AppTitle(),
              CounterButton(),
              HistoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
