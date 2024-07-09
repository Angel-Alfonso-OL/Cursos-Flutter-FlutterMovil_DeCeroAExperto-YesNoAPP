import 'package:flutter/material.dart';

const List<Color> _listColorTheme = [
  Colors.transparent,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.pink,
  Colors.orange,
  Colors.red,
  Colors.lime,
  
];

class MyAppTheme {
  final int _selectedColor;

  MyAppTheme({int selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _listColorTheme.length,
            "List Color Theme is from 0...${_listColorTheme.length}."),
        _selectedColor = selectedColor;

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _listColorTheme.elementAt(_selectedColor),
      //useMaterial3: true,
    );
  }

  ThemeData customTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromARGB(136, 32, 195, 32),
    );
  }
}
