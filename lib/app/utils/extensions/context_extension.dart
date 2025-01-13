import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get sw => MediaQuery.of(this).size.width;

  double get sh => MediaQuery.of(this).size.height;
}

