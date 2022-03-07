<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
[![BuymMeACoffee][buy_me_a_coffee_badge]][buymeacoffee]

# flutter_web_buttons

[![pub package](https://img.shields.io/pub/v/flutter_web_buttons.svg)](https://pub.dev/packages/flutter_web_buttons)

A quick way to add a growing list of customizable flat or animated buttons to your app.

## Features

* Each button features it's own constructor with plenty of options for customization.
* Includes most commonly used Social Icons
* Buttons can be used as a Hero

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  flutter_web_buttons: <latest_version>
```

In your library add the following import:

```dart
import 'package:flutter_web_buttons/flutter_web_buttons.dart';
```

## Getting Started

```dart
FlutterWebButton.textScroll(
  'Text Scroll',
  onPressed: () {},
  animationDuration: const Duration(milliseconds: 500),
  flutterWebButtonOptions: FlutterWebButtonOptions(
      buttonWidth: 200,
      buttonRadius: 30,
      textColor: Colors.pink,
      buttonBackgroundColor: Colors.transparent,
      buttonBorderColor: Colors.pink),
),

```

## Examples

| Button | Animation |
| --- | ---|
| backgroundColorChange | ![bg_color] |
| backgroundFill | ![bg_fill] |
| grow | ![button_grow] |
| iconGrow | ![icon_grow] |
| textMove | ![move_text] |
| simple | Simple button with no animation |
| socialIcon | Social icon with no animation (see list)|
| socialIconGrow | Scales a social icon to a given size |
| textColorChange | Animates the text color |
| textScroll | Animates the text to the top and back into original position |
| textUnderline | Animates an underline from given position |
| buttonHighlightIconFill | ![icon_w_bg_fill] |


## Button Customization Properties

### Animation Properties

#### Some properties are not applicable for all buttons.

| Animation Specific Property | Availabilty |
| --- | -- |
| Animation Duration | All Animated Buttons |
| Animated Text Color | Button Specific |
| Animated Background Color | Button Specific |
| growAmount | Grow effect buttons only |


### Decoration Properties

| FlutterWebButtonOptions | FlutterWebIconButtonOptions |
| --- | --- |
| Height | Icon Size |
| Width | Icon Color |
| Background Color | Padding |
| Text Color | Hero Tag |
| Font Size | IsHeroWidget |
| Font Family |  |
| Padding |  |
| Eliminate Decoration |  |
| Button Radius |  |
| Border Color |  |
| Border Width |  |
| Shadow Color |  |
| Spread Radius |  |
| Blur Radius |  |
| Shadow Offset |  |
| Hero Tag |  |
| IsHeroWidget |  |


<!-- Links -->
[raisetext4]:https://user-images.githubusercontent.com/60490869/154080497-ced74f8d-7093-4352-9f56-2586fcfb8edc.gif
[backgroundfill]:https://user-images.githubusercontent.com/60490869/154086649-006e9772-d0e3-455f-9403-ffad0b41a658.gif
[textscroll]:https://user-images.githubusercontent.com/60490869/154091366-62667363-d1e3-4abe-a754-4aa5647beef6.gif
[buy_me_a_coffee_badge]: https://img.buymeacoffee.com/button-api/?text=Buy%20Me%20A%20Coffee&emoji=&slug=djcali570&button_colour=29b6f6&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00
[buymeacoffee]:https://www.buymeacoffee.com/djcali
[bg_color]:https://user-images.githubusercontent.com/60490869/156978470-06f5eae6-b62a-4d82-a9ea-16fb0df12d46.gif
[icon_w_bg_fill]:https://user-images.githubusercontent.com/60490869/156976695-20bc5c5f-37ed-4810-900d-5d2784c6cb94.gif
[bg_fill]:https://user-images.githubusercontent.com/60490869/156979143-0ee5d402-b1d2-4911-b979-c1a7925b6f3e.gif
[button_grow]:https://user-images.githubusercontent.com/60490869/156979533-d7796263-7a54-440d-95d8-50edb5f0e1d2.gif
[icon_grow]:https://user-images.githubusercontent.com/60490869/156980305-a8f21f7e-e2b9-4bc3-a1f3-59e2f3db67c5.gif
[move_text]:https://user-images.githubusercontent.com/60490869/156981057-450e5ee2-bc7c-49ce-a644-30270df06551.gif
