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

A quick way to add beautiful fully customizable animated buttons targeted for the web.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  flutter_web_buttons: <latest_version>
```

## Usage

```dart
import 'package:web_buttons/web_buttons.dart';

WebButton.textScroll(
  'Text Scroll',
  onPressed: () {},
  animationDuration: const Duration(milliseconds: 500),
  webButtonOptionalFields: WebButtonOptionalFields(
    buttonWidth: 200,
  ),
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
