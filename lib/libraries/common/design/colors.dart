import 'package:flutter/material.dart';

class TPColor {
  static const MaterialColor purple =
      MaterialColor(0xFF6C5DD3, {100: Color(0xFF6C5DD3)});

  static const MaterialColor blue =
      MaterialColor(0xFF0049C6, {100: Color(0xFF0049C6)});

  static Color? lightBlue = Colors.blue[100];

  static Color? blueOpacity40 = Colors.blue.withOpacity(0.4);

  static const MaterialColor red = Colors.red;

  static Color? lightRed = Colors.red[100];

  static Color? redOpacity40 = Colors.red.withOpacity(0.4);

  static const MaterialColor pink =
      MaterialColor(0xFFFFA2C0, {100: Color(0xFFFFA2C0)});

  static const MaterialColor yellow =
      MaterialColor(0xFFFFC373, {100: Color(0xFFFFC373)});

  static const MaterialColor black =
      MaterialColor(0xFF1B1D21, {100: Color(0xFF1B1D21)});

  static const MaterialColor white =
      MaterialColor(0xFFFFFFFF, {100: Color(0xFFFFFFFF)});

  static const MaterialColor grey =
      MaterialColor(0xFF676767, {100: Color(0xFF676767)});
}
