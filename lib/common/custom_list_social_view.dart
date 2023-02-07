import 'package:flutter/material.dart';

import '../theme/themes.dart';

class SocialItemType {
  static const twitter = "twitter";
  static const google = "google-oauth2";
  static const facebook = "facebook";
  static const linkedin = "linkedin";
  static const github = "github";
}

typedef SocialCallback = Function(String type);

class CustomListSocialView extends StatelessWidget {
  final SocialCallback onCallBack;

  const CustomListSocialView(this.onCallBack, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 80,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: UIColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: UIColors.grayscaleWhite2, width: 1)),
      child: Row(
        children: [
          itemView(SocialItemType.google),
          itemView(SocialItemType.github),
          itemView(SocialItemType.twitter),
          itemView(SocialItemType.facebook),
          itemView(SocialItemType.linkedin),
        ],
      ));

  Widget itemView(String type) => Expanded(
      child: InkWell(
          onTap: () {
            onCallBack(type);
          },
          child: Image.asset(getIconName(type), height: 40, width: 40)));

  String getIconName(String type) {
    switch (type) {
      case SocialItemType.google:
        return "assets/images/ic_google.png";
      case SocialItemType.github:
        return "assets/images/ic_github.png";

      case SocialItemType.twitter:
        return "assets/images/ic_twitter.png";

      case SocialItemType.facebook:
        return "assets/images/ic_fb.png";

      case SocialItemType.linkedin:
        return "assets/images/ic_linkedin.png";
      default:
        return "";
    }
  }
}
