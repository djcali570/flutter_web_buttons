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

  /// Icon used for custom icon animations.
  IconData? icon;

  /// Icon color used for custom icon animations.
  Color? iconColor;

  /// Using a separate constructor for properties that are not required to display the button.
  FlutterWebButtonOptions? flutterWebButtonOptions;

  /// Any animated buttons will include the option to change the animation duration.
  Duration? animationDuration;

  /// Used to set the background color for the animation.
  Color? backgroundAnimatedColor;

  /// Used to set the text color for the animation.
  Color? textAnimatedColor;

  /// Used to set grow amount
  double? growAmount;

  /// Used to set the underline thickness
  double? lineThickness;

  /// Used to set the underline spacing between text and line
  double? lineSpacing;

  /// Used to set distance the animation moves in the x direction.
  double? moveDistanceX;

  /// Used to set distance the animation moves in the x direction.
  double? moveDistanceY;

  /// Used to show a list of enums containing built in social icons.
  FlutterWebButtonSocialIcon? flutterWebButtonSocialIcon;

  /// Using a separate constructor for properties that are not required to display the icon button.
  FlutterWebIconOptions? flutterWebIconOptions;

  /// Using a separate constructor for text only properties that are not required to display the text.
  FlutterTextOptions? flutterTextOptions;

  /// Used to align the widget being animated on the cross axis.
  CrossAxisAlignment? animationCrossAxisAlignment;

  /// Button Constructors

  /// Animates the background color only.
  FlutterWebButton.backgroundColorChange(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.backgroundAnimatedColor,
    this.textAnimatedColor,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.backgroundColorChange,
        super(key: key);

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

  /// Simple button with grow effect.
  FlutterWebButton.buttonHighlightIconFill(
    this.text, {
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.flutterTextOptions,
    this.animationDuration,
    this.iconColor,
    this.backgroundAnimatedColor,
  })  : _buttonType = FlutterWebButtonList.buttonHighlightIconFill,
        super(key: key);

  /// Simple button with grow effect.
  FlutterWebButton.grow(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.animationDuration,
    this.growAmount = 1.05,
  })  : _buttonType = FlutterWebButtonList.buttonGrow,
        super(key: key);

  /// Simple icon with grow effect.
  FlutterWebButton.iconGrow({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.flutterWebIconOptions,
    this.animationDuration,
    this.growAmount = 1.05,
  })  : _buttonType = FlutterWebButtonList.iconGrow,
        super(key: key);

  /// Animation that bumps the text up.
  FlutterWebButton.raiseText(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
    this.animationDuration,
    this.textAnimatedColor,

    /// This animation only moves in one direction. (The bigger value is chosen)
    this.moveDistanceX = 0,
    this.moveDistanceY = -4,
  })  : _buttonType = FlutterWebButtonList.raiseText,
        super(key: key);

  /// The simplest form of a button. No animations.
  FlutterWebButton.simple(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterWebButtonOptions,
  })  : _buttonType = FlutterWebButtonList.simple,
        super(key: key);

  /// Simple icon with no animation.
  FlutterWebButton.simpleIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.flutterWebIconOptions,
  })  : _buttonType = FlutterWebButtonList.simpleIcon,
        super(key: key);

  /// Display a simple social icon.
  FlutterWebButton.socialIcon({
    Key? key,
    required this.flutterWebButtonSocialIcon,
    required this.onPressed,
    required this.flutterWebIconOptions,
    this.animationDuration,
  })  : _buttonType = FlutterWebButtonList.socialIcon,
        super(key: key);

  /// Display a social icon with grow effect
  FlutterWebButton.socialIconGrow({
    Key? key,
    required this.flutterWebButtonSocialIcon,
    required this.onPressed,
    required this.flutterWebIconOptions,
    this.animationDuration,
    this.growAmount = 1.1,
  })  : _buttonType = FlutterWebButtonList.socialIconGrow,
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

  /// Display text with an animated move in x or y direction.
  FlutterWebButton.textMove(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterTextOptions,
    this.animationDuration,

    /// This animation only moves in one direction. (The bigger value is chosen)
    this.moveDistanceX = 0,
    this.moveDistanceY = 0,
  })  : _buttonType = FlutterWebButtonList.textMove,
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

  /// Display text with an animated underline effect.
  FlutterWebButton.textUnderline(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.flutterTextOptions,
    this.animationDuration,
    this.textAnimatedColor,
    this.animationCrossAxisAlignment,
    this.lineThickness = 2,
    this.lineSpacing = 0,
  })  : _buttonType = FlutterWebButtonList.textUnderline,
        super(key: key);

  /// Button Type variable thats gets assigned in the constructor.
  final FlutterWebButtonList _buttonType;

  @override
  State<FlutterWebButton> createState() => _FlutterWebButtonState();
}

class _FlutterWebButtonState extends State<FlutterWebButton>
    with SingleTickerProviderStateMixin {
  /// Global key used for text animation.
  final GlobalKey _textKey = GlobalKey();

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
  late Animation<double> _moveTextAnimation;

  /// Used to perform a background fill. The animation makes the containers width from 0 to button width
  late Animation<double> _backgroundFill;

  /// Used to make the button grow and shrink
  late Animation<double> _grow;

  /// A curve animation.
  late CurvedAnimation _curvedAnimation;

  /// A curve animation.
  late CurvedAnimation _curvedCircAnimation;

  /// These colors are used as the default colors if not changed.
  final Color darkColor = const Color(0XFF2E7D32);
  final Color darkColorTint = const Color(0xFF33691E);
  final Color lightColor = const Color(0xFFF0E9E1);
  final Color textColor = const Color(0xFFF0E9E1);
  final Color darkTextColor = const Color(0xFF2A2C2B);
  final double fallbackFontSize = 16;

  /// Some variables used so we can reuse animations
  late Size _textSize;

  @override
  void initState() {
    /// Animation Controller
    _controller = AnimationController(
        vsync: this,
        duration:
            widget.animationDuration ?? const Duration(milliseconds: 300));

    /// Curves
    _curvedAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut);

    final curvedAnimation2 = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuint,
        reverseCurve: Curves.easeInOutQuint);

    /// Animates a fast start and slower end.
    _curvedCircAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCirc,
        reverseCurve: Curves.easeInCirc);

    ///Animations

    /// These animations are only for non icon buttons.
    /// Checking to see if using a button or an icon button.
    if (widget.flutterWebButtonOptions != null) {
      _backgroundColorAnimation = ColorTween(
              begin: widget.flutterWebButtonOptions!.buttonBackgroundColor ??
                  darkColor,
              end: widget.backgroundAnimatedColor ?? darkColorTint)
          .animate(_curvedAnimation);

      _textColorAnimation = ColorTween(
              begin: widget.flutterWebButtonOptions!.textColor ?? textColor,
              end: widget.textAnimatedColor ?? darkTextColor)
          .animate(_curvedAnimation);
      _textColorAnimationNoCurve = ColorTween(
              begin: widget.flutterWebButtonOptions!.textColor ?? darkTextColor,
              end: widget.textAnimatedColor ?? textColor)
          .animate(_controller);

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

    _moveTextAnimation = Tween<double>(
            begin: 0,
            end: widget.moveDistanceX != 0
                ? widget.moveDistanceX
                : widget.moveDistanceY != 0
                    ? widget.moveDistanceY
                    : 0)
        .animate(_curvedAnimation);

    /// These animations are for buttons or icon buttons
    _grow = Tween<double>(begin: 1.0, end: widget.growAmount)
        .animate(_curvedAnimation);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the size of the text.
    // This is used for predetermining the size so the underline animation will stretch to the size of the text.
    // We first have to null check in case the underline animation is being used or not.
    widget.flutterTextOptions != null
        ? _textSize = (TextPainter(
                text: TextSpan(
                  text: widget.text,
                  style: TextStyle(
                    fontSize:
                        widget.flutterTextOptions!.fontSize ?? fallbackFontSize,
                    fontFamily: widget.flutterTextOptions!.fontFamily ?? '',
                    letterSpacing:
                        widget.flutterTextOptions!.letterSpacing ?? 0,
                  ),
                ),
                maxLines: 1,
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                textDirection: TextDirection.ltr)
              ..layout())
            .size
        : _textSize = Size.zero;

    // Set the padding for button or icon button. Since both paddings have a default setting we avoid null values.
    return Padding(
      padding: widget.flutterWebButtonOptions != null
          ? widget.flutterWebButtonOptions!.buttonPadding!
          : widget.flutterWebIconOptions != null
              ? widget.flutterWebIconOptions!.padding!
              : widget.flutterTextOptions != null
                  ? widget.flutterTextOptions!.padding!
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
              : (widget.flutterWebIconOptions != null)
                  ? (widget.flutterWebIconOptions!.isHeroWidget!)
                      ? Hero(
                          tag: widget.flutterWebIconOptions!.heroTag!,
                          child: getButton())
                      : getButton()
                  : (widget.flutterTextOptions != null)
                      ? (widget.flutterTextOptions!.isHeroWidget!)
                          ? Hero(
                              tag: widget.flutterTextOptions!.heroTag!,
                              child: getButton(),
                            )
                          : getButton()
                      : getButton(),
        ),
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

      /// Return the background fill button.
      case FlutterWebButtonList.backgroundFill:

        /// Set the animated width to the button width.
        setState(() {
          _backgroundFill = Tween<double>(
                  begin: 0,
                  end: widget.flutterWebButtonOptions!.buttonWidth ??
                      double.infinity)
              .animate(_curvedCircAnimation);
        });

        /// Get the button
        return getBackgroundFillButton();

      /// Return the highlight icon fill button
      case FlutterWebButtonList.buttonHighlightIconFill:

        /// Set the animated width to the text width.
        setState(() {
          _backgroundFill = Tween<double>(
                  begin: widget.flutterTextOptions!.fontSize != null
                      ? widget.flutterTextOptions!.fontSize! + 30
                      : fallbackFontSize + 30,
                  end: widget.flutterTextOptions!.fontSize != null
                      ? _textSize.width +
                          widget.flutterTextOptions!.fontSize! +
                          35
                      : _textSize.width + fallbackFontSize + 35)
              .animate(_curvedCircAnimation);
        });
        return getButtonHighlightIconFill(widget.icon!);

      /// Return a simple button
      case FlutterWebButtonList.simple:
        return getSimpleButton();

      /// Return a simple icon button.
      case FlutterWebButtonList.simpleIcon:
        return getSimpleIconButton(widget.icon!);

      /// Return a text with a move animation.
      case FlutterWebButtonList.textMove:
        return getTextMove();
      case FlutterWebButtonList.textScroll:
        return getTextScrollButton();
      case FlutterWebButtonList.backgroundColorChange:
        return getBackgroundColorChangeButton();
      case FlutterWebButtonList.textColorChange:
        return getTextColorChangeButton();
      case FlutterWebButtonList.iconGrow:
        return getIconGrow(widget.icon!);
      case FlutterWebButtonList.raiseText:
        return getRaiseTextButton();
      case FlutterWebButtonList.socialIcon:
        return getSimpleIconButton(
            WebButtonIcon.getSocialIcon(widget.flutterWebButtonSocialIcon!));
      case FlutterWebButtonList.socialIconGrow:
        return getIconGrow(
            WebButtonIcon.getSocialIcon(widget.flutterWebButtonSocialIcon!));
      case FlutterWebButtonList.buttonGrow:
        return getButtonGrow();

      case FlutterWebButtonList.textUnderline:

        /// Set the animated width to the text width.
        setState(() {
          _backgroundFill = Tween<double>(begin: 0, end: _textSize.width)
              .animate(_curvedCircAnimation);
        });

        /// Get the button
        return getTextUnderlineButton();
      default:
        return const SizedBox();
    }
  }

  /// Button methods that get returned to the gesture detector.

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
                  child: AnimatedBuilder(
                      animation: _textColorAnimation,
                      builder: (context, _) {
                        return Text(
                          widget.text!,
                          style: TextStyle(

                              /// If a text color animation is chosen then animate the text color else use the original color else set to default color.
                              color: widget.textAnimatedColor != null
                                  ? _textColorAnimation.value
                                  : widget.flutterWebButtonOptions!.textColor !=
                                          null
                                      ? widget
                                          .flutterWebButtonOptions!.textColor!
                                      : lightColor,
                              fontSize:
                                  widget.flutterWebButtonOptions!.fontSize ??
                                      fallbackFontSize,
                              fontFamily:
                                  widget.flutterWebButtonOptions!.fontFamily ??
                                      ''),
                        );
                      }),
                ),
              ),
            )),
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
                          fontSize: widget.flutterWebButtonOptions!.fontSize ??
                              fallbackFontSize,
                          letterSpacing:
                              widget.flutterWebButtonOptions!.letterSpacing ??
                                  0,
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

  /// Simple button with grow effect.
  getButtonGrow() => AnimatedBuilder(
      animation: _grow,
      builder: (context, _) {
        return Transform.scale(
          scale: _grow.value,
          child: Container(
            width:
                widget.flutterWebButtonOptions!.buttonWidth ?? double.infinity,
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
          ),
        );
      });

  /// Button with icon that fills the backgound
  getButtonHighlightIconFill(IconData icon) => SizedBox(
        width: widget.flutterTextOptions!.fontSize != null
            ? _textSize.width + widget.flutterTextOptions!.fontSize! + 35
            : fallbackFontSize + _textSize.width + 35,
        height: _textSize.height + 35,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedBuilder(
                  animation: _backgroundFill,
                  builder: (context, _) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      width: _backgroundFill.value,
                      height: widget.flutterTextOptions!.fontSize != null
                          ? widget.flutterTextOptions!.fontSize! + 30
                          : fallbackFontSize + 30,
                      decoration: BoxDecoration(
                          color: widget.backgroundAnimatedColor ?? lightColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              widget.flutterTextOptions!.fontSize != null
                                  ? widget.flutterTextOptions!.fontSize! + 10
                                  : 30))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Icon(
                          icon,
                          color: widget.iconColor ?? darkColor,
                          size: widget.flutterTextOptions!.fontSize ??
                              fallbackFontSize,
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.flutterTextOptions!.fontSize != null
                      ? widget.flutterTextOptions!.fontSize! + 14
                      : fallbackFontSize + 14),
              child: Text(
                widget.text!,
                style: TextStyle(
                  color: widget.flutterTextOptions!.textColor ?? darkTextColor,
                  fontSize:
                      widget.flutterTextOptions!.fontSize ?? fallbackFontSize,
                  fontFamily: widget.flutterTextOptions!.fontFamily ?? '',
                  letterSpacing: widget.flutterTextOptions!.letterSpacing ?? 0,
                ),
              ),
            ),
          ],
        ),
      );

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
                    fontSize: widget.flutterWebButtonOptions!.fontSize ??
                        fallbackFontSize,
                    letterSpacing:
                        widget.flutterWebButtonOptions!.letterSpacing ?? 0,
                  ),
                  child: Text(
                    widget.text!,
                  ),
                ),
              ),
            )),
      );

  getTextMove() => AnimatedBuilder(
      animation: _moveTextAnimation,
      builder: (context, child) => Transform.translate(
            offset: Offset(
                widget.moveDistanceX! != 0 ? _moveTextAnimation.value : 0,
                widget.moveDistanceY! != 0 ? _moveTextAnimation.value : 0),
            child: Material(
              type: MaterialType.transparency,
              textStyle: textOnlyTextStyle(),
              child: Text(
                widget.text!,
              ),
            ),
          ));

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
  getTextUnderlineButton() => SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              widget.animationCrossAxisAlignment ?? CrossAxisAlignment.start,
          children: [
            Text(
              widget.text!,
              style: TextStyle(
                color: widget.flutterTextOptions!.textColor ?? darkTextColor,
                fontSize:
                    widget.flutterTextOptions!.fontSize ?? fallbackFontSize,
                fontFamily: widget.flutterTextOptions!.fontFamily ?? '',
                letterSpacing: widget.flutterTextOptions!.letterSpacing ?? 0,
              ),
              key: _textKey,
            ),
            SizedBox(
              height: widget.lineSpacing,
            ),
            AnimatedBuilder(
                animation: _backgroundFill,
                builder: (context, _) {
                  return Transform.scale(
                      scaleX: 1,
                      alignment: Alignment.centerLeft,
                      child: Container(
                          color: widget.textAnimatedColor ?? darkColor,
                          width: _backgroundFill.value,
                          height: widget.lineThickness));
                }),
          ],
        ),
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
              animation: _moveTextAnimation,
              builder: (context, child) => Transform.translate(
                    offset: Offset(
                        widget.moveDistanceX! != 0
                            ? _moveTextAnimation.value
                            : 0,
                        widget.moveDistanceY! != 0
                            ? _moveTextAnimation.value
                            : 0),
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

  /// Method that returns a simple icon.
  getSimpleIconButton(IconData icon) => SizedBox(
        child: Icon(
          icon,
          color: widget.flutterWebIconOptions!.color ?? darkColor,
          size: widget.flutterWebIconOptions!.size ?? 32,
        ),
      );

  /// icon with grow effect.
  getIconGrow(IconData icon) => SizedBox(
      child: AnimatedBuilder(
          animation: _grow,
          builder: (context, _) {
            return Transform.scale(
              scale: _grow.value,
              child: Icon(
                icon,
                color: widget.flutterWebIconOptions!.color ?? darkColor,
                size: widget.flutterWebIconOptions!.size ?? 32,
              ),
            );
          }));

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

  /// Text only button text styles
  textOnlyTextStyle() => TextStyle(
        color: widget.flutterTextOptions!.textColor ?? darkTextColor,
        fontFamily: widget.flutterTextOptions!.fontFamily ?? '',
        fontSize: widget.flutterTextOptions!.fontSize ?? fallbackFontSize,
        letterSpacing: widget.flutterTextOptions!.letterSpacing ?? 0,
      );

  /// Textstyle
  standardTextStyle() => TextStyle(
        color: widget.flutterWebButtonOptions!.textColor ?? textColor,
        fontFamily: widget.flutterWebButtonOptions!.fontFamily ?? '',
        fontSize: widget.flutterWebButtonOptions!.fontSize ?? fallbackFontSize,
        letterSpacing: widget.flutterWebButtonOptions!.letterSpacing ?? 0,
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
