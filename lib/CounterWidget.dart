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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter with Inherited WIdget"),
      ),
      body: SizedBox.expand(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterInherited.of(context).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
