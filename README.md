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

# Flutter Web Buttons

A quick way to add a growing list of customizable flat or animated buttons to your app.

## Features

Each button features it's own constructor with plenty of options for customization.


## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  flutter_web_buttons: <latest_version>
```

## Usage

```dart
import 'package:flutter_web_buttons/flutter_web_buttons.dart';

FlutterWebButton.textScroll(
  'Text Scroll',
  onPressed: () {},
  animationDuration: const Duration(milliseconds: 500),
  flutterWebButtonOptions: FlutterWebButtonOptions(
    buttonWidth: 200,
),

```
![textscroll](https://user-images.githubusercontent.com/60490869/153996197-e9ba2c17-32b5-4e21-9a3b-c18fcbf2cd31.gif)

```dart
import 'package:flutter_web_buttons/flutter_web_buttons.dart';

FlutterWebButton.backgroundFill(
  'Fill Background',
  onPressed: () {},
  flutterWebButtonOptions: FlutterWebButtonOptions(
    buttonWidth: 200,
    buttonRadius: 30,
),

```
![bgfill](https://user-images.githubusercontent.com/60490869/153997598-35c970c8-2832-4afb-b3bb-aabd33e67b93.gif)


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

![raisetext](https://user-images.githubusercontent.com/60490869/154002057-41390fa9-1feb-4afc-8489-16ca2b38eea9.gif)


# Additional information

### Animation Customizations

#### Some properties are not applicable for all buttons.

| Animation Specific Property | Availabilty |
| --- | -- |
| Animation Duration | All Animated Buttons |
| Animated Text Color | Button Specific |
| Animated Background Color | Button Specific |


### Decoration Customizations

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

