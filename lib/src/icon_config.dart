import 'package:flutter/widgets.dart';
import 'package:web_buttons/web_buttons.dart';

class WebButtonSocialIcons {
  WebButtonSocialIcons._();

  static const IconData facebook = IconDataBrands(0xf09a);
  static const IconData facebookSquare = IconDataBrands(0xf082);
  static const IconData flickr = IconDataBrands(0xf16e);
  static const IconData github = IconDataBrands(0xf09b);
  static const IconData githubSquare = IconDataBrands(0xf092);
  static const IconData instagram = IconDataBrands(0xf16d);
  static const IconData instagramSquare = IconDataBrands(0xe800);
  static const IconData linkedin = IconDataBrands(0xf0e1);
  static const IconData linkedinSquare = IconDataBrands(0xf08c);
  static const IconData paypal = IconDataBrands(0xf1ed);
  static const IconData paypalSquare = IconDataBrands(0xf1f4);
  static const IconData pinterest = IconDataBrands(0xf0d2);
  static const IconData pinterestSquare = IconDataBrands(0xf0d3);
  static const IconData snapchat = IconDataBrands(0xf2ac);
  static const IconData snapchatSquare = IconDataBrands(0xf2ad);
  static const IconData soundcloud = IconDataBrands(0xf1be);
  static const IconData twitter = IconDataBrands(0xf099);
  static const IconData twitterSquare = IconDataBrands(0xf081);
  static const IconData vimeo = IconDataBrands(0xf27d);
  static const IconData vimeoSquare = IconDataBrands(0xf194);
  static const IconData youtube = IconDataBrands(0xf167);
  static const IconData youtubeSuare = IconDataBrands(0xf431);

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
