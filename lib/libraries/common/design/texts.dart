import 'package:flutter/material.dart';
import 'package:teemo_professor/libraries/common/design/colors.dart';

class TPTexts {
  static TextStyle h1({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h2({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h3({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h4({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h5({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h6({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h7({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  static TextStyle h8({Color? color}) => TextStyle(
        color: color ?? TPColor.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle t1(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 24,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t2(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 22,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t3(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 20,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t4(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 18,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t5(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 16,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t6(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 14,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t7(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 12,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t8(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 10,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle t9(
          {bool isBold = false, Color? color, String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 8,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');

  static TextStyle description(
          {bool isBold = false,
          Color? color,
          TextDecoration? decoration,
          String? fontFamily}) =>
      TextStyle(
          color: color ?? TPColor.black,
          fontSize: 12,
          decoration: decoration,
          fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontFamily ?? 'TeemoFont1');
}
