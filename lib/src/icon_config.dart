import 'package:flutter/widgets.dart';
import 'package:web_buttons/web_buttons.dart';

class WebButtonSocialIcons {
  WebButtonSocialIcons._();

  static const IconData instagram = IconDataBrands(0xf16d);
  static const IconData twitter = IconDataBrands(0xf099);
  static const IconData facebook = IconDataBrands(0xf09a);
}

class IconDataBrands extends IconData {
  const IconDataBrands(int codePoint)
      : super(
          codePoint,
          fontFamily: 'WebButtonSocialIcons',
          fontPackage: 'web_buttons',
        );
}

class WebButtonIcon {
  static getSocialIcon(WebButtonSocialIcon socialIcon) {
    switch (socialIcon) {
      case WebButtonSocialIcon.instagram:
        return WebButtonSocialIcons.instagram;
      case WebButtonSocialIcon.twitter:
        return WebButtonSocialIcons.twitter;
      case WebButtonSocialIcon.facebook:
        return WebButtonSocialIcons.facebook;
      default:
        return const SizedBox(
          child: Text('Icon Error'),
        );
    }
  }
}
