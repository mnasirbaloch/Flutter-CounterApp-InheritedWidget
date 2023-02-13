import 'package:flutter/cupertino.dart';

import 'CountWrapper.dart';

// A widget which is used to pass information down to tree to its child in any of its subtree.
class CounterInherited extends InheritedWidget {
  // All fields must be final because the constructor of InheritedWidget is const
  final int count;
  final Widget child;
  final CountWrapperState countWrapperState;
  const CounterInherited(
      {Key? key,
      required this.child,
      required this.countWrapperState,
      required this.count})
      // must add super in which pass key which can be null and child which is necessory
      : super(key: key, child: child);

// A static method which will return the object of CountWrapperState to any of its children in
// sub-tree
  static CountWrapperState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterInherited>()!
        // we are returning here the object of countWrapperState we can also return entire inherited widget object
        .countWrapperState;
  }

// A method which tell framework should it rebuild the inherited widget or not because it is mutable and
// when any field changes it needs to rebuilt so we compare current value which we can think will be changed
// by any child we should compare if both are not equal then ask framework to rebuild the widget.
  @override
  bool updateShouldNotify(covariant CounterInherited oldWidget) {
    return oldWidget.count != count;
  }
}
