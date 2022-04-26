import 'package:flutter/material.dart';

class FlutterWebButtonOptions {
  /// Width of the button. If left null it will use the max available space.
  double? buttonWidth;

  /// Height of the button. Default value of 50.
  double? buttonHeight;
  Color? buttonBackgroundColor;
  LinearGradient? gradient;
  Color? textColor;
  double? fontSize;
  String? fontFamily;
  double? letterSpacing;
  EdgeInsetsGeometry? buttonPadding;
  bool? eliminateDecoration;
  double? buttonRadius;
  Color? buttonBorderColor;
  double? buttonBorderWidth;
  Color? boxShadowColor;
  double? spreadRadius;
  double? blurRadius;
  Offset boxShadowOffset;
  String? heroTag;
  bool? isHeroWidget;

  FlutterWebButtonOptions({
    this.buttonWidth,
    this.buttonHeight = 50,
    this.buttonBackgroundColor,
    this.gradient,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.letterSpacing,
    this.buttonPadding = const EdgeInsets.all(10),
    this.eliminateDecoration = false,
    this.buttonRadius,
    this.buttonBorderColor,
    this.buttonBorderWidth,
    this.boxShadowColor,
    this.spreadRadius,
    this.blurRadius,
    this.boxShadowOffset = const Offset(0.0, 8.0),

    /// These properties are only used if using a [Hero] widget.
    /// The hero tag must be unique to the widget tree.
    this.heroTag,

    /// If this button will be wrapped in a [Hero] set this to true. Used for nesting multiple hero widgets.
    this.isHeroWidget = false,
  });
}

class FlutterWebIconOptions {
  double? size;
  Color? color;
  EdgeInsetsGeometry? padding;
  String? heroTag;
  bool? isHeroWidget;
  FlutterWebIconOptions({
    this.size,
    this.color,
    this.padding = const EdgeInsets.all(10),

    /// These properties are only used if using a [Hero] widget.
    /// The hero tag must be unique to the widget tree.
    this.heroTag,

    /// If this button will be wrapped in a [Hero] set this to true. Used for nesting multiple hero widgets.
    this.isHeroWidget = false,
  });
}

class FlutterTextOptions {
  Color? textColor;
  double? fontSize;
  String? fontFamily;
  double? letterSpacing;
  EdgeInsetsGeometry? padding;
  String? heroTag;
  bool? isHeroWidget;
  FlutterTextOptions({
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.letterSpacing,
    this.padding = const EdgeInsets.all(10),

    /// These properties are only used if using a [Hero] widget.
    /// The hero tag must be unique to the widget tree.
    this.heroTag,

    /// If this button will be wrapped in a [Hero] set this to true. Used for nesting multiple hero widgets.
    this.isHeroWidget = false,
  });
}
