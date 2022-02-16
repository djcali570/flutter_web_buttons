import 'package:flutter/material.dart';
import 'package:flutter_web_buttons/flutter_web_buttons.dart';

class FlutterWebButtonSocialIcons {
  FlutterWebButtonSocialIcons._();

  /// Facebook Icons
  static const IconData facebook = IconDataBrands(0xf09a);
  static const IconData facebookSquare = IconDataBrands(0xf082);

  /// Flickr Icon
  static const IconData flickr = IconDataBrands(0xf16e);

  /// Github Icons
  static const IconData github = IconDataBrands(0xf09b);
  static const IconData githubSquare = IconDataBrands(0xf092);

  /// Instagram Icons
  static const IconData instagram = IconDataBrands(0xf16d);
  static const IconData instagramSquare = IconDataBrands(0xe800);

  /// LinkedIn Icons
  static const IconData linkedin = IconDataBrands(0xf0e1);
  static const IconData linkedinSquare = IconDataBrands(0xf08c);

  /// Paypal Icons
  static const IconData paypal = IconDataBrands(0xf1ed);
  static const IconData paypalSquare = IconDataBrands(0xf1f4);

  /// Pinterest Icons
  static const IconData pinterest = IconDataBrands(0xf0d2);
  static const IconData pinterestSquare = IconDataBrands(0xf0d3);

  /// Snapchat Icons
  static const IconData snapchat = IconDataBrands(0xf2ac);
  static const IconData snapchatSquare = IconDataBrands(0xf2ad);

  /// Soundcloud Icon
  static const IconData soundcloud = IconDataBrands(0xf1be);

  /// Twitter Icons
  static const IconData twitter = IconDataBrands(0xf099);
  static const IconData twitterSquare = IconDataBrands(0xf081);

  /// Vimeo Icons
  static const IconData vimeo = IconDataBrands(0xf27d);
  static const IconData vimeoSquare = IconDataBrands(0xf194);

  /// Youtube Icons
  static const IconData youtube = IconDataBrands(0xf167);
  static const IconData youtubeSuare = IconDataBrands(0xf431);
}

class IconDataBrands extends IconData {
  const IconDataBrands(int codePoint)
      : super(
          codePoint,
          fontFamily: 'WebButtonSocialIcons',
          fontPackage: 'flutter_web_buttons',
        );
}

class WebButtonIcon {
  static getSocialIcon(FlutterWebButtonSocialIcon socialIcon) {
    switch (socialIcon) {
      case FlutterWebButtonSocialIcon.facebook:
        return FlutterWebButtonSocialIcons.facebook;
      case FlutterWebButtonSocialIcon.facebookSquare:
        return FlutterWebButtonSocialIcons.facebookSquare;
      case FlutterWebButtonSocialIcon.flickr:
        return FlutterWebButtonSocialIcons.flickr;
      case FlutterWebButtonSocialIcon.github:
        return FlutterWebButtonSocialIcons.github;
      case FlutterWebButtonSocialIcon.githubSquare:
        return FlutterWebButtonSocialIcons.githubSquare;
      case FlutterWebButtonSocialIcon.instagram:
        return FlutterWebButtonSocialIcons.instagram;
      case FlutterWebButtonSocialIcon.instagramSquare:
        return FlutterWebButtonSocialIcons.instagramSquare;
      case FlutterWebButtonSocialIcon.linkedin:
        return FlutterWebButtonSocialIcons.linkedin;
      case FlutterWebButtonSocialIcon.linkedinSquare:
        return FlutterWebButtonSocialIcons.linkedinSquare;
      case FlutterWebButtonSocialIcon.paypal:
        return FlutterWebButtonSocialIcons.paypal;
      case FlutterWebButtonSocialIcon.paypalSquare:
        return FlutterWebButtonSocialIcons.paypalSquare;
      case FlutterWebButtonSocialIcon.pinterest:
        return FlutterWebButtonSocialIcons.pinterest;
      case FlutterWebButtonSocialIcon.pinterestSquare:
        return FlutterWebButtonSocialIcons.pinterestSquare;
      case FlutterWebButtonSocialIcon.snapchat:
        return FlutterWebButtonSocialIcons.snapchat;
      case FlutterWebButtonSocialIcon.snapchatSquare:
        return FlutterWebButtonSocialIcons.snapchatSquare;
      case FlutterWebButtonSocialIcon.soundcloud:
        return FlutterWebButtonSocialIcons.soundcloud;
      case FlutterWebButtonSocialIcon.twitter:
        return FlutterWebButtonSocialIcons.twitter;
      case FlutterWebButtonSocialIcon.twittersquare:
        return FlutterWebButtonSocialIcons.twitterSquare;
      case FlutterWebButtonSocialIcon.vimeo:
        return FlutterWebButtonSocialIcons.vimeo;
      case FlutterWebButtonSocialIcon.vimeoSquare:
        return FlutterWebButtonSocialIcons.vimeoSquare;
      case FlutterWebButtonSocialIcon.youtube:
        return FlutterWebButtonSocialIcons.youtube;
      case FlutterWebButtonSocialIcon.youtubeSquare:
        return FlutterWebButtonSocialIcons.youtubeSuare;

      default:
        return Icons.error;
    }
  }
}
