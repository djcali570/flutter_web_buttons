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

```dart
FlutterWebButton.backgroundFill(
  'Background Fill',
  onPressed: () {},
  flutterWebButtonOptions: FlutterWebButtonOptions(
    buttonWidth: 200,
    buttonRadius: 30,
),

```

```dart
FlutterWebButton.raiseText(
  'Raise Text | Shadow',
  onPressed: () {},
  flutterWebButtonOptions: FlutterWebButtonOptions(
    buttonWidth: 200,
    buttonRadius: 8,
    boxShadowColor: Colors.grey.withOpacity(0.8),
  ),
),

```
## Examples


### Text Scroll

![textscroll][textscroll]

### Background Fill

![backgroundfill][backgroundfill]

### Raise Text

![raisetext4][raisetext4]

# Button Customization Properties

### Animation Properties

#### Some properties are not applicable for all buttons.

| Animation Specific Property | Availabilty |
| --- | -- |
| Animation Duration | All Animated Buttons |
| Animated Text Color | Button Specific |
| Animated Background Color | Button Specific |


### Decoration Properties

| FlutterWebButtonOptions | FlutterWebIconButtonOptions |
| --- | --- |
| Height | Icon Size |
| Width | Icon Color |
| Background Color | Padding |
| Text Color |  |
| Font Size |  |
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


<!-- Links -->
[raisetext4]:https://user-images.githubusercontent.com/60490869/154080497-ced74f8d-7093-4352-9f56-2586fcfb8edc.gif
[backgroundfill]:https://user-images.githubusercontent.com/60490869/154086649-006e9772-d0e3-455f-9403-ffad0b41a658.gif
[textscroll]:https://user-images.githubusercontent.com/60490869/154091366-62667363-d1e3-4abe-a754-4aa5647beef6.gif
[buy_me_a_coffee_badge]: https://img.buymeacoffee.com/button-api/?text=Buy%20Me%20A%20Coffee&emoji=&slug=djcali570&button_colour=29b6f6&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00
[buymeacoffee]:https://www.buymeacoffee.com/djcali
