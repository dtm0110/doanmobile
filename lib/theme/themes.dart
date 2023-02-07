import 'package:flutter/material.dart';

class ThemeTextStyle {
  static const TextStyle heading32 =
      BaseTextStyle(fontSize: 32, fontWeight: FontWeight.w700);
  static const TextStyle heading26 =
      BaseTextStyle(fontSize: 26, fontWeight: FontWeight.w700);
  static const TextStyle heading20 =
      BaseTextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static const TextStyle heading18 =
      BaseTextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const TextStyle heading16 =
      BaseTextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle heading14 =
      BaseTextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle heading12 =
      BaseTextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static const TextStyle heading10 =
      BaseTextStyle(fontSize: 10, fontWeight: FontWeight.w500);
  static const TextStyle body14 = BaseTextStyle(fontSize: 14);
  static const TextStyle body12 = BaseTextStyle(fontSize: 12);
  static const TextStyle body10 = BaseTextStyle(fontSize: 10);
  static const TextStyle button =
      BaseTextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle link =
      BaseTextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle keyText =
      BaseTextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}

class BaseTextStyle extends TextStyle {
  const BaseTextStyle({double? fontSize, FontWeight? fontWeight})
      : super(
          fontSize: fontSize ?? 14,
          fontFamily: "Roboto",
          fontWeight: fontWeight ?? FontWeight.w400,
          color: UIColors.black,
        );
}

class UIColors {
  UIColors._();

  static const primary = Color(0xff4FAE5A);
  static const primary50 = Color(0x80D1F58F);
  static const primary2 = Color(0xffEDFAEB);
  static const primaryBam = Color(0xff49CAF6);
  static const primaryBam2 = Color(0xff7DCFE7);
  static const blueFade = Color(0xffC5DCFF);

  static const palette = Color(0xff13151B);
  static const grayscale3 = Color(0xff20232D);
  static const grayscale2 = Color(0xff353842);
  static const grayscale1 = Color(0xff828387);
  static const grayscaleWhite2 = Color(0xffE8E8E8);
  static const grayscaleWhite3 = Color(0xffb2b1b1);

  static const colorGreen = Color(0xff4FAE5A);
  static const colorBlue = Color(0xff3EAEFF);
  static const colorBlueDisable = Color(0xffA7C0FF);
  static const colorWarning = Color(0xffFFA23A);
  static const colorRed = Color(0xffFE5050);
  static const Color shadow = Color(0xffefefef);
  static const Color white = Color(0xffFFFFFF);
  static const Color white60 = Color(0x99ffffff);
  static const Color black = Color(0xff000000);
  static const Color blackPrimary = Color(0xffffffff);
  static const Color black_30 = Color(0x4D000000);
  static const transparent = Colors.transparent;
}
