import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_2/CountWrapper.dart';
import 'package:flutter_inherited_widget_2/CounterWidget.dart';

void main() {
  runApp(
    const MaterialApp(
      // in our home property we have CountWrapper which is wrapping InheritedWidget in its state and 
      // InheritedWidget contain state object using which any child widget can handle and update the state.
      home: CountWrapper(
        // In child we have CounterWidget which is using the count value stored in state and InheritedWidget
        // which when changes the InheritedWidget rebuilt.
        child: CounterWidget(),
      ),
    ),
  );
}

