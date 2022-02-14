import 'package:flutter/material.dart';
import 'package:web_buttons/src/clippers.dart';
import 'package:web_buttons/src/icon_config.dart';
import 'package:web_buttons/src/web_button_optional_fields.dart';
import 'package:web_buttons/src/enums.dart';

// ignore: must_be_immutable
class WebButton extends StatefulWidget {
  VoidCallback? onPressed;
  String? text;
  WebButtonOptionalFields? webButtonOptionalFields;
  Duration? animationDuration;
  Color? backgroundAnimatedColor;
  Color? textAnimatedColor;
  WebButtonSocialIcon? webButtonSocialIcon;
  WebButtonIconOptionalFields? webButtonIconOptionalFields;

  /// Button Constructors
  WebButton.simple(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.webButtonOptionalFields,
  })  : _buttonType = WebButtonList.simple,
        super(key: key);

  WebButton.textScroll(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.webButtonOptionalFields,
    this.animationDuration,
  })  : _buttonType = WebButtonList.textScroll,
        super(key: key);

  WebButton.backgroundColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.webButtonOptionalFields,
    this.backgroundAnimatedColor,
    this.animationDuration,
  })  : _buttonType = WebButtonList.backgroundColorChange,
        super(key: key);

  WebButton.textColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.webButtonOptionalFields,
    this.textAnimatedColor,
    this.animationDuration,
  })  : _buttonType = WebButtonList.textColorChange,
        super(key: key);

  WebButton.raiseText(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.webButtonOptionalFields,
    this.animationDuration,
  })  : _buttonType = WebButtonList.raiseText,
        super(key: key);

  WebButton.backgroundFill(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.webButtonOptionalFields,
    this.textAnimatedColor,
    this.backgroundAnimatedColor,
    this.animationDuration,
  })  : _buttonType = WebButtonList.backgroundFill,
        super(key: key);

  WebButton.socialIcon({
    Key? key,
    required this.webButtonSocialIcon,
    required this.onPressed,
    required this.webButtonIconOptionalFields,
    this.animationDuration,
  })  : _buttonType = WebButtonList.socialIcon,
        super(key: key);

  /// Button Type variable thats gets assigned in the constructor.

  final WebButtonList _buttonType;

  @override
  State<WebButton> createState() => _WebButtonState();
}

class _WebButtonState extends State<WebButton>
    with SingleTickerProviderStateMixin {
  /// Animations and Controllers
  late AnimationController _controller;
  late Animation<double> _textScrollAnimation;
  late Animation<double> _textScrollOpacityAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _textColorAnimation;
  late Animation<Color?> _textColorAnimationNoCurve;
  late Animation<double> _raiseTextAnimation;
  late Animation<double> _backgroundFill;

  // final Color darkColor = Colors.blue;
  // final Color? lightColor = Colors.blue[100];
  final Color darkColor = Colors.pink;
  final Color? lightColor = Colors.pink[100];
  final Color textColor = Colors.white;
  final Color darkTextColor = Colors.pink;

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
    ///
    /// These animations are only for non icon buttons.
    if (widget.webButtonOptionalFields != null) {
      _backgroundColorAnimation = ColorTween(
              begin: widget.webButtonOptionalFields!.buttonBackgroundColor ??
                  darkColor,
              end: widget.backgroundAnimatedColor ?? lightColor)
          .animate(curvedAnimation);

      _textColorAnimation = ColorTween(
              begin: widget.webButtonOptionalFields!.textColor ?? textColor,
              end: widget.textAnimatedColor ?? Colors.white70)
          .animate(curvedAnimation);
      _textColorAnimationNoCurve = ColorTween(
              begin: widget.webButtonOptionalFields!.textColor ?? darkTextColor,
              end: widget.textAnimatedColor ?? textColor)
          .animate(_controller);
      _raiseTextAnimation =
          Tween<double>(begin: 0.0, end: -4).animate(curvedAnimation);
      _backgroundFill = Tween<double>(
              begin: 0,
              end: widget.webButtonOptionalFields!.buttonWidth ??
                  double.infinity)
          .animate(curvedAnimation);

      /// Sequence Animations for non icon buttons
      _textScrollAnimation = TweenSequence(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: -widget.webButtonOptionalFields!.buttonHeight! / 3,
            ),
            weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: widget.webButtonOptionalFields!.buttonHeight! / 3,
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
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Got to buildcontext');
    return

        /// If optional fields are not required by the button, set default padding.
        Padding(
      padding: widget.webButtonOptionalFields != null
          ? widget.webButtonOptionalFields!.buttonPadding!
          : const EdgeInsets.all(0),

      /// A mouse region is used here so that on hover you can start and reverse the animation.
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

        /// Gesture detector is used to handle the onPressed event.
        child: GestureDetector(
          onTap: widget.onPressed,
          child: getButton(),
        ),
      ),
    );
  }

  /// Start/Reverse controller on hover.
  hoverEvent(bool hovered) {
    hovered ? _controller.forward() : _controller.reverse();
  }

  /// Based on the constructor used, return the associated button.
  getButton() {
    switch (widget._buttonType) {
      case WebButtonList.simple:
        return getSimpleButton();
      case WebButtonList.textScroll:
        return getTextScrollButton();
      case WebButtonList.backgroundColorChange:
        return getBackgroundColorChangeButton();
      case WebButtonList.textColorChange:
        return getTextColorChangeButton();
      case WebButtonList.raiseText:
        return getRaiseTextButton();
      case WebButtonList.backgroundFill:
        return getBackgroundFillButton();
      case WebButtonList.socialIcon:
        return getSocialButton(
            WebButtonIcon.getSocialIcon(widget.webButtonSocialIcon!));
      default:
        return const SizedBox();
    }
  }

  /// Button Types that get returned to the gesture detector.
  getSimpleButton() => Container(
        width: widget.webButtonOptionalFields!.buttonWidth ?? double.infinity,
        height: widget.webButtonOptionalFields!.buttonHeight!,
        decoration: widget.webButtonOptionalFields!.eliminateDecoration!
            ? null
            : standardBoxDecoration(),
        child: Align(
            alignment: Alignment.center,
            child: Material(
              type: MaterialType.transparency,
              textStyle: standardTextStyle(),
              child: Text(
                widget.text!,
              ),
            )),
      );
  getTextScrollButton() => Container(
        width: widget.webButtonOptionalFields!.buttonWidth ?? double.infinity,
        height: widget.webButtonOptionalFields!.buttonHeight!,
        decoration: widget.webButtonOptionalFields!.eliminateDecoration!
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
                                widget.text!,
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
              width: widget.webButtonOptionalFields!.buttonWidth ??
                  double.infinity,
              height: widget.webButtonOptionalFields!.buttonHeight,
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
                    widget.text!,
                  ),
                ),
              ),
            )),
      );
  getTextColorChangeButton() => AnimatedBuilder(
        animation: _textColorAnimation,
        builder: ((context, child) => Container(
              width: widget.webButtonOptionalFields!.buttonWidth ??
                  double.infinity,
              height: widget.webButtonOptionalFields!.buttonHeight,
              decoration: standardBoxDecoration(),
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  type: MaterialType.transparency,
                  textStyle: TextStyle(
                    color: _textColorAnimation.value,
                    fontFamily:
                        widget.webButtonOptionalFields!.fontFamily ?? '',
                    fontSize: widget.webButtonOptionalFields!.fontSize ?? 16,
                  ),
                  child: Text(
                    widget.text!,
                  ),
                ),
              ),
            )),
      );
  getRaiseTextButton() => Container(
        width: widget.webButtonOptionalFields!.buttonWidth ?? double.infinity,
        height: widget.webButtonOptionalFields!.buttonHeight,
        decoration: widget.webButtonOptionalFields!.eliminateDecoration!
            ? null
            : standardBoxDecoration(),
        child: Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
              animation: _raiseTextAnimation,
              builder: (context, child) => Transform.translate(
                    offset: Offset(0.0, _raiseTextAnimation.value),
                    child: Material(
                      type: MaterialType.transparency,
                      textStyle: standardTextStyle(),
                      child: Text(
                        widget.text!,
                      ),
                    ),
                  )),
        ),
      );
  getBackgroundFillButton() => SizedBox(
        width: widget.webButtonOptionalFields!.buttonWidth ?? double.infinity,
        height: widget.webButtonOptionalFields!.buttonHeight,

        /// A clip path is used so the fill color does not show when using a radius button.
        child: ClipPath(
          clipper:
              PillClipper(widget.webButtonOptionalFields!.buttonRadius ?? 0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:
                      widget.webButtonOptionalFields!.buttonBackgroundColor ??
                          lightColor,
                  border: standardBorder(),
                ),
              ),

              /// This the container which gets animated to fill the button.
              AnimatedBuilder(
                animation: _backgroundFill,
                builder: ((context, child) => Transform.scale(
                      scaleX: 1,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: _backgroundFill.value,
                        decoration: BoxDecoration(
                          color: widget.backgroundAnimatedColor ?? darkColor,
                        ),
                      ),
                    )),
              ),

              /// This is the text with color animation.
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: _textColorAnimationNoCurve,
                  builder: ((context, child) => Material(
                        type: MaterialType.transparency,
                        textStyle: TextStyle(
                          color: _textColorAnimationNoCurve.value,
                          fontFamily:
                              widget.webButtonOptionalFields!.fontFamily ?? '',
                          fontSize:
                              widget.webButtonOptionalFields!.fontSize ?? 16,
                        ),
                        child: Text(
                          widget.text!,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      );
  static getSocialButton(IconData icon) => SizedBox(
        child: Icon(icon),
      );

  /// Default decorations are used by multiple buttons so these eliminate repeated code.
  standardBoxDecoration() => BoxDecoration(
        color: widget.webButtonOptionalFields!.eliminateDecoration!
            ? Colors.transparent
            : widget.webButtonOptionalFields!.buttonBackgroundColor ??
                darkColor,
        borderRadius: BorderRadius.all(
            Radius.circular(widget.webButtonOptionalFields!.buttonRadius ?? 0)),
        border: widget.webButtonOptionalFields!.buttonBorderColor == null
            ? const Border.fromBorderSide(BorderSide.none)
            : Border.all(
                color: widget.webButtonOptionalFields!.buttonBorderColor!,
                width:
                    widget.webButtonOptionalFields!.buttonBorderWidth ?? 1.0),
        boxShadow: widget.webButtonOptionalFields!.boxShadowColor != null
            ? [
                BoxShadow(
                  color: widget.webButtonOptionalFields!.boxShadowColor!,
                  spreadRadius:
                      widget.webButtonOptionalFields!.spreadRadius ?? -5,
                  blurRadius: widget.webButtonOptionalFields!.blurRadius ?? 7,
                  offset: widget.webButtonOptionalFields!.boxShadowOffset,
                )
              ]
            : null,
      );
  standardBorderRadius() => BorderRadius.all(
      Radius.circular(widget.webButtonOptionalFields!.buttonRadius ?? 0));
  standardBorder() => widget.webButtonOptionalFields!.buttonBorderColor == null
      ? const Border.fromBorderSide(BorderSide.none)
      : Border.all(
          color: widget.webButtonOptionalFields!.buttonBorderColor!,
          width: widget.webButtonOptionalFields!.buttonBorderWidth ?? 1.0);
  standardTextStyle() => TextStyle(
        color: widget.webButtonOptionalFields!.textColor ?? textColor,
        fontFamily: widget.webButtonOptionalFields!.fontFamily ?? '',
        fontSize: widget.webButtonOptionalFields!.fontSize ?? 16,
      );
  standardBoxShadow() => widget.webButtonOptionalFields!.boxShadowColor != null
      ? [
          BoxShadow(
            color: widget.webButtonOptionalFields!.boxShadowColor!,
            spreadRadius: widget.webButtonOptionalFields!.spreadRadius ?? -5,
            blurRadius: widget.webButtonOptionalFields!.blurRadius ?? 7,
            offset: widget.webButtonOptionalFields!.boxShadowOffset,
          )
        ]
      : null;
}
