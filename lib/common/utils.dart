import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';

String getEnumValue(e) => e.toString().split('.').last;

enum DialogType { center, bottom, animationCenter, animationBottom }

void centerDialog(BuildContext context,
        {String mess = "",
        String title = "Notice",
        String titleCloseBtn = "",
        String titleConfirmBtn = "OK",
        VoidCallback? onCloseCallBack,
        VoidCallback? onConfirmCallBack}) =>
    showDialog(
        context: context,
        builder: (BuildContext context) => alertBuilder(
              context,
              title,
              mess,
              titleConfirmBtn,
              titleCloseBtn,
              onConfirmCallBack,
            ));

alertBuilder(
        BuildContext context,
        String title,
        String mess,
        String titleConfirmBtn,
        String titleCloseBtn,
        VoidCallback? onConfirmCallBack) =>
    AlertDialog(
        titleTextStyle: ThemeTextStyle.heading16,
        contentTextStyle: ThemeTextStyle.body14,
        contentPadding: const EdgeInsets.only(
            top: 12.0, right: 16.0, left: 16.0, bottom: 12.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        content: Text(mess,
            style: ThemeTextStyle.body14, textAlign: TextAlign.center),
        title: Text(title,
            style: ThemeTextStyle.heading16, textAlign: TextAlign.center),
        actions: [
          Column(mainAxisSize: MainAxisSize.min, children: [
            const Divider(
                color: UIColors.grayscaleWhite2, endIndent: 0.0, indent: 0.0),
            getBottomView(
              titleCloseBtn.isEmpty,
              context,
              titleCloseBtn,
              titleConfirmBtn,
              onCallBack: () {
                onConfirmCallBack?.call();
              },
            )
          ])
        ]);

void showAlert(BuildContext context,
        {String mess = "",
        String title = "Notice",
        String titleCloseBtn = "",
        VoidCallback? onCloseCallBack}) =>
    Dialogs.materialDialog(
        titleAlign: TextAlign.center,
        titleStyle: ThemeTextStyle.heading16,
        msgStyle: ThemeTextStyle.body14,
        msg: mess,
        title: title,
        color: UIColors.blackPrimary,
        context: context,
        actions: [
          confirmView(context, "Close", () {
            onCloseCallBack?.call();
          })
        ]);

//--------------------bottom dialog---------------------------------------------
void bottomDialog(BuildContext context,
        {String mess = "",
        String title = "",
        String titleCloseBtn = "",
        String titleConfirmBtn = "",
        VoidCallback? onCloseCallBack,
        VoidCallback? onConfirmCallBack}) =>
    Dialogs.bottomMaterialDialog(
        msg: mess,
        title: title,
        context: context,
        actions: [
          Column(children: [
            const Divider(color: UIColors.grayscaleWhite2),
            getBottomView(
                titleCloseBtn.isEmpty, context, titleCloseBtn, titleConfirmBtn,
                onCallBack: () {
              onConfirmCallBack?.call();
            })
          ])
        ]);

//-----------------Animation Bottom Dialog--------------------------------------
void animationBottomDialog(
  BuildContext context, {
  String mess = "",
  String title = "",
  String titleCloseBtn = "",
  String titleConfirmBtn = "",
  VoidCallback? onCloseCallBack,
  VoidCallback? onConfirmCallBack,
}) =>
    Dialogs.bottomMaterialDialog(
        msg: mess,
        title: title,
        context: context,
        actions: [
          Column(children: [
            const Divider(color: UIColors.grayscaleWhite2),
            Row(children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                      highlightColor: UIColors.blackPrimary,
                      hoverColor: UIColors.black_30,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(titleCloseBtn,
                          style: ThemeTextStyle.button
                              .apply(color: UIColors.primary),
                          textAlign: TextAlign.center))),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      highlightColor: UIColors.blackPrimary,
                      hoverColor: UIColors.black_30,
                      onTap: () {
                        onConfirmCallBack?.call();
                        Navigator.pop(context);
                      },
                      child: Text(titleConfirmBtn,
                          style: ThemeTextStyle.button
                              .apply(color: UIColors.white),
                          textAlign: TextAlign.center)))
            ])
          ])
        ]);

//----------------------Animation Center Button---------------------------------
void animationCenterButton(
  BuildContext context, {
  String mess = "",
  String title = "",
  String titleConfirmBtn = "Confirm",
  VoidCallback? onConfirmCallBack,
}) =>
    Dialogs.materialDialog(
        color: UIColors.blackPrimary,
        msg: mess,
        title: title,
        context: context,
        actions: [
          Expanded(
              flex: 1,
              child: InkWell(
                  highlightColor: UIColors.blackPrimary,
                  hoverColor: UIColors.black_30,
                  onTap: () {
                    onConfirmCallBack?.call();
                    Navigator.pop(context);
                  },
                  child: Text(titleConfirmBtn,
                      style:
                          ThemeTextStyle.button.apply(color: UIColors.primary),
                      textAlign: TextAlign.center)))
        ]);
//---------------------Custom Button View---------------------------------------
Widget getBottomView(
    bool isNotice, BuildContext context, String titleClose, String titleConfirm,
    {VoidCallback? onCallBack}) {
  if (isNotice) {
    return confirmView(context, titleConfirm, () {
      onCallBack?.call();
    });
  } else {
    return Row(children: [
      closeView(context, titleClose),
      Expanded(
          flex: 1,
          child: confirmView(context, titleConfirm, () {
            onCallBack?.call();
          }))
    ]);
  }
}

Widget confirmView(
        BuildContext context, String title, VoidCallback? onCallBack) =>
    InkWell(
        highlightColor: UIColors.blackPrimary,
        hoverColor: UIColors.black_30,
        onTap: () {
          onCallBack?.call();
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            title,
            style: ThemeTextStyle.button,
            textAlign: TextAlign.center,
          ),
        ));

Widget closeView(BuildContext context, String title) => Expanded(
      flex: 1,
      child: InkWell(
        highlightColor: UIColors.blackPrimary,
        hoverColor: UIColors.black_30,
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          title,
          style: ThemeTextStyle.button.apply(color: UIColors.colorRed),
          textAlign: TextAlign.center,
        ),
      ),
    );
