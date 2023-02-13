import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_2/CounterInheritedWidget.dart';

// A widget which will be using the InheritedWidget and A State of StatfulWidget which wraps the
// Inherited Widget
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

// State of CounterWidget
class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        child: Center(
          child: Text(
            // Getting data from inherited widget
            CounterInherited.of(context).count.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
// Using state object using inherited widget and doing increment in count value of statful widget
// which wraps InheritedWidget in it.
          CounterInherited.of(context).increment();
        },
      ),
    );
  }
}
