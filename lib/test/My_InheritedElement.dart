import 'package:flutter/cupertino.dart';

class MyInheritedElement extends InheritedElement{
  MyInheritedElement(super.widget);

  @override
  void update(covariant ProxyWidget newWidget) {
    // TODO: implement update
    super.update(newWidget);
  }


  @override
  void updated(covariant InheritedWidget oldWidget) {
    // TODO: implement updated
    super.updated(oldWidget);
  }

  @override
  void rebuild({bool force = false}) {
    // TODO: implement rebuild
    super.rebuild(force: force);
  }

  @override
  Widget build() {
    // TODO: implement build
    return super.build();
  }

  @override
  Element? updateChild(Element? child, Widget? newWidget, Object? newSlot) {
    // TODO: implement updateChild
    return super.updateChild(child, newWidget, newSlot);
  }

}