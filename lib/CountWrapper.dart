import 'package:flutter/material.dart';
import 'CounterInheritedWidget.dart';

// A widget which will be wrapping InheritedWidget by returning InheritedWidget object
class CountWrapper extends StatefulWidget {
  final Widget child;
  const CountWrapper({super.key, required this.child});
  // createState() method will return state of CountWrapper
  @override
  State<CountWrapper> createState() => CountWrapperState();
}

// Normally the state class is private, but since we are using this class to controll the state
// of our app and we also allow other child widget to use this state object to make change we
// have to make it public, or we can make it public and return object of this class to its
// child which is normally equal to making it normal and we can do that using of method as,
// static CountWrapperState of(BuildContext context) {
// return (context.dependOnInheritedWidgetOfExactType<CounterInherited>())!.countWrapperState;
// }
// but we will make it public and keep its instance in our inherited widget and any child of inherited
// widget can use this instance.

class CountWrapperState extends State<CountWrapper> {
  // initializing count variable
  int count = 0;
  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget "),
      ),
      // hre we are returning InheritedWidget and the child of InheritedWidget will be any widget passed
      // in constructor of CounterWrapper statful widget constructor.
      body: CounterInherited(
        // Now when-ever the count value changes the flutter will rebuild the state object which means the
        // count value passed to inherited widget given below will be differnt then the value passed before
        // so the updateShouldNotify will be executed which return true and the InheritedWidget which is
        // imutable will rebuild same as the statless widget rebuild.
        count: count,
        // setting state object as current object
        countWrapperState: this,
        // child will be passed in constructor of CountWrapper
        child: widget.child,
      ),
    );
  }
}
