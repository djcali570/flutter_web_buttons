import 'package:flutter/material.dart';
import 'package:flutter_web_buttons/src/clippers.dart';
import 'package:flutter_web_buttons/src/icon_config.dart';
import 'package:flutter_web_buttons/src/flutter_web_button_optional_fields.dart';
import 'package:flutter_web_buttons/src/enums.dart';

// ignore: must_be_immutable
class FlutterWebButton extends StatefulWidget {
  /// Required callback used on button pressed.
  VoidCallback? onPressed;

  /// Text displayed on the button.
  String? text;

  /// Using a separate constructor for properties that are not required to display the button.
  FlutterWebButtonOptions? flutterWebButtonOptions;

  /// Any animated buttons will include the option to change the animation duration.
  Duration? animationDuration;

  /// Used to set the background color for the animation.
  Color? backgroundAnimatedColor;

  /// Used to set the text color for the animation.
  Color? textAnimatedColor;

  /// Used to show a list of enums containing built in social icons.
  FlutterWebButtonSocialIcon? flutterWebButtonSocialIcon;

  /// Using a separate constructor for properties that are not required to display the icon button.
  FlutterWebIconOptions? flutterWebIconButtonOptions;

  /// Button Constructors
  ///
  /// The simplest form of a button. No animations.
  FlutterWebButton.simple(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
  })  : _buttonType = FlutterWebButtonList.simple,
        super(key: key);

  /// The text will scroll to the top and fade out and reappear from the bottom back into position.
  FlutterWebButton.textScroll(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.textScroll,
        super(key: key);

  /// Animates the background color only.
  FlutterWebButton.backgroundColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.backgroundAnimatedColor,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.backgroundColorChange,
        super(key: key);

  /// Animates the text color only.
  FlutterWebButton.textColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.textAnimatedColor,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.textColorChange,
        super(key: key);

  /// Animation that bumps the text up.
  FlutterWebButton.raiseText(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.raiseText,
        super(key: key);

  ///
  /// Animated a background fill from left to right.
  /// [FlutterWebButtonOptions.buttonRadius] does not work for this animation.
  ///
  FlutterWebButton.backgroundFill(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.textAnimatedColor,
    this.backgroundAnimatedColor,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.backgroundFill,
        super(key: key);

  /// Display a simple social icon.
  FlutterWebButton.socialIcon({
    Key? key,
    required this.flutterWebButtonSocialIcon,
    required this.onPressed,
    required this.flutterWebIconButtonOptions,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.socialIcon,
        super(key: key);

  /// Button Type variable thats gets assigned in the constructor.
  final FlutterWebButtonList _buttonType;

  @override
  State<FlutterWebButton> createState() => _FlutterWebButtonState();
}

class _FlutterWebButtonState extends State<FlutterWebButton>
    with SingleTickerProviderStateMixin {
  /// Main animation controller
  late AnimationController _controller;

  /// Used for the text scroll animation
  late Animation<double> _textScrollAnimation;

  /// Used for the opacity to fade the button out on animation.
  late Animation<double> _textScrollOpacityAnimation;

  /// Used to change the background color.
  late Animation<Color?> _backgroundColorAnimation;

  /// Used to change the color of the button text
  late Animation<Color?> _textColorAnimation;

  /// Used to change the color of the text not using a curve.
  late Animation<Color?> _textColorAnimationNoCurve;

  /// Used to bump the text up the y axis.
  late Animation<double> _raiseTextAnimation;

  /// Used to perform a background fill. The animation makes the containers width from 0 to button width
  late Animation<double> _backgroundFill;

  /// These colors are used as the default colors if not changed.
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

    /// These animations are only for non icon buttons.
    /// Checking to see if using a button or an icon button.
    if (widget.flutterWebButtonOptions != null) {
      _backgroundColorAnimation = ColorTween(
              begin: widget.flutterWebButtonOptions!.buttonBackgroundColor ??
                  darkColor,
              end: widget.backgroundAnimatedColor ?? lightColor)
          .animate(curvedAnimation);

      _textColorAnimation = ColorTween(
              begin: widget.flutterWebButtonOptions!.textColor ?? textColor,
              end: widget.textAnimatedColor ?? Colors.white70)
          .animate(curvedAnimation);
      _textColorAnimationNoCurve = ColorTween(
              begin: widget.flutterWebButtonOptions!.textColor ?? darkTextColor,
              end: widget.textAnimatedColor ?? textColor)
          .animate(_controller);
      _raiseTextAnimation =
          Tween<double>(begin: 0.0, end: -4).animate(curvedAnimation);
      _backgroundFill = Tween<double>(
              begin: 0,
              end: widget.flutterWebButtonOptions!.buttonWidth ??
                  double.infinity)
          .animate(curvedAnimation);

      /// Sequence Animations for non icon buttons
      _textScrollAnimation = TweenSequence(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: -widget.flutterWebButtonOptions!.buttonHeight! / 3,
            ),
            weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: widget.flutterWebButtonOptions!.buttonHeight! / 3,
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
    // Set the padding for button or icon button. Since both paddings have a default setting we avoid null values.
    return Padding(
      padding: widget.flutterWebButtonOptions != null
          ? widget.flutterWebButtonOptions!.buttonPadding!
          : widget.flutterWebIconButtonOptions != null
              ? widget.flutterWebIconButtonOptions!.padding!
              : EdgeInsets.zero,

      /// A mouse region is used here so that on hover you can start and reverse the animation.
      child: MouseRegion(
        cursor: SystemMouseCursors.click,

        /// Hover events to start and reverse the animations
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

            /// Decide if using [hero] widget. If using a hero wrap the button with the [Hero] widget
            /// Here we are doing some null checks to see if the hero properties are used or not.
            child: (widget.flutterWebButtonOptions != null)
                ? (widget.flutterWebButtonOptions!.isHeroWidget!)
                    ? Hero(
                        tag: widget.flutterWebButtonOptions!.heroTag!,
                        child: getButton())
                    : getButton()
                : (widget.flutterWebIconButtonOptions != null)
                    ? (widget.flutterWebIconButtonOptions!.isHeroWidget!)
                        ? Hero(
                            tag: widget.flutterWebIconButtonOptions!.heroTag!,
                            child: getButton())
                        : getButton()
                    : getButton()),
      ),
    );
  }

  /// Start/Reverse controller on hover.
  hoverEvent(bool hovered) {
    hovered ? _controller.forward() : _controller.reverse();
  }

  /// Based on the constructor used, return the associated button.
  /// This will call the method used to return the correct button.
  getButton() {
    switch (widget._buttonType) {
      case FlutterWebButtonList.simple:
        return getSimpleButton();
      case FlutterWebButtonList.textScroll:
        return getTextScrollButton();
      case FlutterWebButtonList.backgroundColorChange:
        return getBackgroundColorChangeButton();
      case FlutterWebButtonList.textColorChange:
        return getTextColorChangeButton();
      case FlutterWebButtonList.raiseText:
        return getRaiseTextButton();
      case FlutterWebButtonList.backgroundFill:
        return getBackgroundFillButton();
      case FlutterWebButtonList.socialIcon:
        return getSocialButton(
            WebButtonIcon.getSocialIcon(widget.flutterWebButtonSocialIcon!));
      default:
        return const SizedBox();
    }
  }

  /// Button methods that get returned to the gesture detector.
  getSimpleButton() => Container(
        width: widget.flutterWebButtonOptions!.buttonWidth ?? double.infinity,
        height: widget.flutterWebButtonOptions!.buttonHeight!,
        decoration: widget.flutterWebButtonOptions!.eliminateDecoration!
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
        width: widget.flutterWebButtonOptions!.buttonWidth ?? double.infinity,
        height: widget.flutterWebButtonOptions!.buttonHeight!,
        decoration: widget.flutterWebButtonOptions!.eliminateDecoration!
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
              width: widget.flutterWebButtonOptions!.buttonWidth ??
                  double.infinity,
              height: widget.flutterWebButtonOptions!.buttonHeight,
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
              width: widget.flutterWebButtonOptions!.buttonWidth ??
                  double.infinity,
              height: widget.flutterWebButtonOptions!.buttonHeight,
              decoration: standardBoxDecoration(),
              child: Align(
                alignment: Alignment.center,
                child: Material(
                  type: MaterialType.transparency,
                  textStyle: TextStyle(
                    color: _textColorAnimation.value,
                    fontFamily:
                        widget.flutterWebButtonOptions!.fontFamily ?? '',
                    fontSize: widget.flutterWebButtonOptions!.fontSize ?? 16,
                  ),
                  child: Text(
                    widget.text!,
                  ),
                ),
              ),
            )),
      );
  getRaiseTextButton() => Container(
        width: widget.flutterWebButtonOptions!.buttonWidth ?? double.infinity,
        height: widget.flutterWebButtonOptions!.buttonHeight,
        decoration: widget.flutterWebButtonOptions!.eliminateDecoration!
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
        width: widget.flutterWebButtonOptions!.buttonWidth ?? double.infinity,
        height: widget.flutterWebButtonOptions!.buttonHeight,

        /// A clip path is used so the fill color does not show when using a radius button.
        /// A radius button with a border does not produce a nice looking button.
        child: ClipPath(
          clipper:
              PillClipper(widget.flutterWebButtonOptions!.buttonRadius ?? 0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:
                      widget.flutterWebButtonOptions!.buttonBackgroundColor ??
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
                              widget.flutterWebButtonOptions!.fontFamily ?? '',
                          fontSize:
                              widget.flutterWebButtonOptions!.fontSize ?? 16,
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

  /// A simple social button with no animation.
  getSocialButton(IconData icon) => SizedBox(
        child: Icon(
          icon,
          color: widget.flutterWebIconButtonOptions!.color ?? darkColor,
          size: widget.flutterWebIconButtonOptions!.size ?? 32,
        ),
      );

  /// Default decorations are used by multiple buttons so these eliminate repeated code.
  standardBoxDecoration() => BoxDecoration(
        color: widget.flutterWebButtonOptions!.eliminateDecoration!
            ? Colors.transparent
            : widget.flutterWebButtonOptions!.buttonBackgroundColor ??
                darkColor,
        borderRadius: BorderRadius.all(
            Radius.circular(widget.flutterWebButtonOptions!.buttonRadius ?? 0)),
        border: widget.flutterWebButtonOptions!.buttonBorderColor == null
            ? const Border.fromBorderSide(BorderSide.none)
            : Border.all(
                color: widget.flutterWebButtonOptions!.buttonBorderColor!,
                width:
                    widget.flutterWebButtonOptions!.buttonBorderWidth ?? 1.0),
        boxShadow: widget.flutterWebButtonOptions!.boxShadowColor != null
            ? [
                BoxShadow(
                  color: widget.flutterWebButtonOptions!.boxShadowColor!,
                  spreadRadius:
                      widget.flutterWebButtonOptions!.spreadRadius ?? -5,
                  blurRadius: widget.flutterWebButtonOptions!.blurRadius ?? 7,
                  offset: widget.flutterWebButtonOptions!.boxShadowOffset,
                )
              ]
            : null,
      );

  /// Border radius decoration
  standardBorderRadius() => BorderRadius.all(
      Radius.circular(widget.flutterWebButtonOptions!.buttonRadius ?? 0));

  /// Border decoration
  standardBorder() => widget.flutterWebButtonOptions!.buttonBorderColor == null
      ? const Border.fromBorderSide(BorderSide.none)
      : Border.all(
          color: widget.flutterWebButtonOptions!.buttonBorderColor!,
          width: widget.flutterWebButtonOptions!.buttonBorderWidth ?? 1.0);

  /// Textstyle
  standardTextStyle() => TextStyle(
        color: widget.flutterWebButtonOptions!.textColor ?? textColor,
        fontFamily: widget.flutterWebButtonOptions!.fontFamily ?? '',
        fontSize: widget.flutterWebButtonOptions!.fontSize ?? 16,
      );

  /// Box Shadow
  standardBoxShadow() => widget.flutterWebButtonOptions!.boxShadowColor != null
      ? [
          BoxShadow(
            color: widget.flutterWebButtonOptions!.boxShadowColor!,
            spreadRadius: widget.flutterWebButtonOptions!.spreadRadius ?? -5,
            blurRadius: widget.flutterWebButtonOptions!.blurRadius ?? 7,
            offset: widget.flutterWebButtonOptions!.boxShadowOffset,
          )
        ]
      : null;
}
