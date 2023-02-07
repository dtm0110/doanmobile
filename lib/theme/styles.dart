import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

class UCStyle {
  static ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.primary),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12)));

  static ButtonStyle buttonSmallStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.primary),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(99))),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12)));

  static ButtonStyle buttonBorderStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: const BorderSide(color: UIColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 12));

  static ButtonStyle buttonStyleNoBackground = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.transparent),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14)));

  static ButtonStyle buttonStyleDisable = OutlinedButton.styleFrom(
      backgroundColor: UIColors.colorBlueDisable,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: const BorderSide(color: UIColors.transparent),
      padding: const EdgeInsets.symmetric(vertical: 14));

  static ButtonStyle buttonStyleCancel = OutlinedButton.styleFrom(
      backgroundColor: UIColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: const BorderSide(color: UIColors.transparent),
      padding: const EdgeInsets.symmetric(vertical: 14));

  static ButtonStyle buttonStyleConfirm = OutlinedButton.styleFrom(
      backgroundColor: UIColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: const BorderSide(color: UIColors.transparent),
      padding: const EdgeInsets.symmetric(vertical: 14));

  static ButtonStyle buttonStyleInvest = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.primary),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 2)));

  static ButtonStyle buttonStyleInvestDisable = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.grayscaleWhite2),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12)));

  static ButtonStyle buttonStyleInvest44 = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.primary),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 2)));

  static ButtonStyle buttonStyleInvestDisable44 = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.grayscaleWhite2),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12.0)));

  static ButtonStyle buttonStyleInvestGray144 = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.grayscale1),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12)));

  static ButtonStyle buttonStyleInvest46= ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.primary),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 2)));

  static ButtonStyle buttonStyleInvestDisable46= ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.grayscaleWhite2),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12)));

  static ButtonStyle buttonStyleWhite = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(UIColors.white),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23),
      )),
      padding:
      MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14)));

}
