import 'package:flutter/material.dart';

class FlutterWebButtonOptions {
  double? buttonWidth;
  double? buttonHeight;
  Color? buttonBackgroundColor;
  Color? textColor;
  double? fontSize;
  String? fontFamily;
  EdgeInsetsGeometry? buttonPadding;
  bool? eliminateDecoration;
  double? buttonRadius;
  Color? buttonBorderColor;
  double? buttonBorderWidth;
  Color? boxShadowColor;
  double? spreadRadius;
  double? blurRadius;
  Offset boxShadowOffset;

  FlutterWebButtonOptions({
    this.buttonWidth,
    this.buttonHeight = 50,
    this.buttonBackgroundColor,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.buttonPadding = const EdgeInsets.all(10),
    this.eliminateDecoration = false,
    this.buttonRadius,
    this.buttonBorderColor,
    this.buttonBorderWidth,
    this.boxShadowColor,
    this.spreadRadius,
    this.blurRadius,
    this.boxShadowOffset = const Offset(0.0, 8.0),
  });
}

class FlutterWebIconOptions {
  double? size;
  Color? color;
  EdgeInsetsGeometry? padding;
  FlutterWebIconOptions({
    this.size,
    this.color,
    this.padding = const EdgeInsets.all(10),
  });
}