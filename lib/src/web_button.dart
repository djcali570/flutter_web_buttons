import 'package:flutter/material.dart';
import 'package:web_buttons/src/web_button_optional_fields.dart';
import 'package:web_buttons/src/enums.dart';

// ignore: must_be_immutable
class WebButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final WebButtonOptionalFields optionalFields;
  Duration? animationDuration;
  Color? backgroundAnimatedColor;
  Color? textAnimatedColor;

  WebButton.simple(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.optionalFields,
  })  : _buttonType = WebButtonList.simple,
        super(key: key);

  WebButton.textScroll(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.optionalFields,
    this.animationDuration,
  })  : _buttonType = WebButtonList.textScroll,
        super(key: key);

  WebButton.backgroundColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.optionalFields,
    this.backgroundAnimatedColor,
    this.animationDuration,
  })  : _buttonType = WebButtonList.backgroundColorChange,
        super(key: key);

  WebButton.textColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.optionalFields,
    this.textAnimatedColor,
    this.animationDuration,
  })  : _buttonType = WebButtonList.textColorChange,
        super(key: key);

  final WebButtonList _buttonType;

  @override
  State<WebButton> createState() => _WebButtonState();
}

class _WebButtonState extends State<WebButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textScrollAnimation;
  late Animation<double> _textScrollOpacityAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _textColorAnimation;
  @override
  void initState() {
    /// Animation Controller
    _controller = AnimationController(
        vsync: this,
        duration:
            widget.animationDuration ?? const Duration(milliseconds: 300));

    /// Curves
    final curvedAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut);

    final curvedAnimation2 = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuint,
        reverseCurve: Curves.easeInOutQuint);

    ///Animations
    _backgroundColorAnimation = ColorTween(
            begin: widget.optionalFields.buttonBackgroundColor ?? Colors.pink,
            end: widget.backgroundAnimatedColor ?? Colors.pink[300])
        .animate(curvedAnimation);

    _textColorAnimation = ColorTween(
            begin: widget.optionalFields.textColor ?? Colors.white,
            end: widget.textAnimatedColor ?? Colors.white70)
        .animate(curvedAnimation);

    /// Sequence Animations
    _textScrollAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: -widget.optionalFields.buttonHeight! / 3,
          ),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.optionalFields.buttonHeight! / 3,
            end: 0.0,
          ),
          weight: 50),
    ]).animate(curvedAnimation2);

    _textScrollOpacityAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1,
          end: 0,
        ),
        weight: 50,
      ),
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          weight: 50),
    ]).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.optionalFields.buttonPadding!,

      /// Use mouse region to start animations.
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            hoverEvent(true);
          });
        },
        onExit: (event) {
          setState(() {
            hoverEvent(false);
          });
        },

        /// Assign on tap event.
        child: GestureDetector(
          onTap: widget.onPressed,
          child: getButton(),
        ),
      ),
    );
  }

  /// Start controller
  hoverEvent(bool hovered) {
    hovered ? _controller.forward() : _controller.reverse();
  }

  Widget getButton() {
    switch (widget._buttonType) {
      case WebButtonList.simple:
        return getSimpleButton();
      case WebButtonList.textScroll:
        return getTextScrollButton();
      case WebButtonList.backgroundColorChange:
        return getBackgroundColorChangeButton();
      case WebButtonList.textColorChange:
        return getTextColorChangeButton();
      default:
        return const SizedBox();
    }
  }

  getSimpleButton() => Container(
        width: widget.optionalFields.buttonWidth ?? double.infinity,
        height: widget.optionalFields.buttonHeight!,
        decoration: widget.optionalFields.eliminateDecoration!
            ? null
            : standardBoxDecoration(),
        child: Align(
            alignment: Alignment.center,
            child: Material(
              type: MaterialType.transparency,
              textStyle: standardTextStyle(),
              child: Text(
                widget.text,
              ),
            )),
      );
  getTextScrollButton() => Container(
        width: widget.optionalFields.buttonWidth ?? double.infinity,
        height: widget.optionalFields.buttonHeight!,
        decoration: widget.optionalFields.eliminateDecoration!
            ? null
            : standardBoxDecoration(),
        child: Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
              animation: _textScrollAnimation,
              builder: (context, child) => Transform(
                    transform: Matrix4.identity()
                      ..translate(0, _textScrollAnimation.value),
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, _) {
                          return Material(
                            type: MaterialType.transparency,
                            textStyle: standardTextStyle(),
                            child: Opacity(
                              opacity: _textScrollOpacityAnimation.value,
                              child: Text(
                                widget.text,
                              ),
                            ),
                          );
                        }),
                  )),
        ),
      );
  getBackgroundColorChangeButton() => AnimatedBuilder(
        animation: _backgroundColorAnimation,
        builder: ((context, child) => Container(
              width: widget.optionalFields.buttonWidth ?? double.infinity,
              height: widget.optionalFields.buttonHeight,
              decoration: BoxDecoration(
                color: _backgroundColorAnimation.value,
                borderRadius: standardBorderRadius(),
                border: standardBorder(),
                boxShadow: standardBoxShadow(),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  type: MaterialType.transparency,
                  textStyle: standardTextStyle(),
                  child: Text(
                    widget.text,
                  ),
                ),
              ),
            )),
      );
  getTextColorChangeButton() => AnimatedBuilder(
        animation: _textColorAnimation,
        builder: ((context, child) => Container(
              width: widget.optionalFields.buttonWidth ?? double.infinity,
              height: widget.optionalFields.buttonHeight,
              decoration: standardBoxDecoration(),
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  type: MaterialType.transparency,
                  textStyle: TextStyle(
                    color: _textColorAnimation.value,
                    fontFamily: widget.optionalFields.fontFamily ?? '',
                    fontSize: widget.optionalFields.fontSize ?? 16,
                  ),
                  child: Text(
                    widget.text,
                  ),
                ),
              ),
            )),
      );
  standardBoxDecoration() => BoxDecoration(
        color: widget.optionalFields.eliminateDecoration!
            ? Colors.transparent
            : widget.optionalFields.buttonBackgroundColor ?? Colors.pink,
        borderRadius: BorderRadius.all(
            Radius.circular(widget.optionalFields.buttonRadius ?? 0)),
        border: widget.optionalFields.buttonBorderColor == null
            ? const Border.fromBorderSide(BorderSide.none)
            : Border.all(
                color: widget.optionalFields.buttonBorderColor!,
                width: widget.optionalFields.buttonBorderWidth ?? 1.0),
        boxShadow: widget.optionalFields.boxShadowColor != null
            ? [
                BoxShadow(
                  color: widget.optionalFields.boxShadowColor!,
                  spreadRadius: widget.optionalFields.spreadRadius ?? -5,
                  blurRadius: widget.optionalFields.blurRadius ?? 7,
                  offset: widget.optionalFields.boxShadowOffset,
                )
              ]
            : null,
      );
  standardBorderRadius() => BorderRadius.all(
      Radius.circular(widget.optionalFields.buttonRadius ?? 0));
  standardBorder() => widget.optionalFields.buttonBorderColor == null
      ? const Border.fromBorderSide(BorderSide.none)
      : Border.all(
          color: widget.optionalFields.buttonBorderColor!,
          width: widget.optionalFields.buttonBorderWidth ?? 1.0);
  standardTextStyle() => TextStyle(
        color: widget.optionalFields.textColor ?? Colors.white,
        fontFamily: widget.optionalFields.fontFamily ?? '',
        fontSize: widget.optionalFields.fontSize ?? 16,
      );

  standardBoxShadow() => widget.optionalFields.boxShadowColor != null
      ? [
          BoxShadow(
            color: widget.optionalFields.boxShadowColor!,
            spreadRadius: widget.optionalFields.spreadRadius ?? -5,
            blurRadius: widget.optionalFields.blurRadius ?? 7,
            offset: widget.optionalFields.boxShadowOffset,
          )
        ]
      : null;
}
