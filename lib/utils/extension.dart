import 'package:flutter/material.dart';

extension WidgetListSpacing on List<Widget> {
  List<Widget> separate(double spacing) {
    List<Widget> separatedWidgets = [];
    for (int i = 0; i < this.length; i++) {
      separatedWidgets.add(this[i]);
      if (i < this.length - 1) {
        separatedWidgets.add(SizedBox(height: spacing));
      }
    }
    return separatedWidgets;
  }
}