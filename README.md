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

FlutterWebButton.backgroundFill(
  'Fill Background',
  onPressed: () {},
  flutterWebButtonOptions: FlutterWebButtonOptions(
    buttonWidth: 200,
    buttonRadius: 30,
),

```
<div id="images" align="center" style="white-space: no-wrap">
  <img src ="https://user-images.githubusercontent.com/60490869/153996197-e9ba2c17-32b5-4e21-9a3b-c18fcbf2cd31.gif">
  <img src ="https://user-images.githubusercontent.com/60490869/153997598-35c970c8-2832-4afb-b3bb-aabd33e67b93.gif">
</div>


## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
