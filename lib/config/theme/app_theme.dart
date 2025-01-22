import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(15, 31, 13, 192);

const List<Color> _colorThemes = [
  _customColor,
  Color.fromARGB(255, 247, 4, 4),
  Color.fromARGB(255, 118, 255, 64),
  Color.fromARGB(255, 255, 109, 64),
  Color.fromARGB(255, 64, 255, 137),
  Color.fromARGB(255, 201, 15, 92),
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'colors must be between and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed:
          _colorThemes[selectedColor], //Hacer paleta de colores en theme
      // brightness: Brightness.dark //Para ponerlo en modo oscuro
    );
  }
}
