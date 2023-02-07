import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/l10n.dart';
import '../../../../theme/styles.dart';
import '../../../../theme/themes.dart';

class PopupChooseMethodImport extends StatelessWidget {
  final Function(String)? onPickImage;

  const PopupChooseMethodImport({this.onPickImage, super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          Text(
            S.of(context).selectImage,
            style: ThemeTextStyle.heading20,
          ),
          const SizedBox(height: 32.0),
          _buttonView(
            () {
              _getFromGallery();
            },
            S.of(context).getFromGallery,
          ),
          const SizedBox(height: 16.0),
          _buttonView(
            () {
              _getFromCamera();
            },
            S.of(context).getFromCamera,
          ),
          const SizedBox(height: 24.0),
        ],
      ));

  Widget _buttonView(Function onCallBack, String content) => Container(
      color: UIColors.white,
      child: SizedBox(
          width: double.infinity - 32,
          height: 48.0,
          child: ElevatedButton(
            onPressed: () {
              onCallBack.call();
            },
            style: UCStyle.buttonStyleInvest44,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                content,
                style: ThemeTextStyle.button.apply(color: UIColors.white),
              ),
            ]),
          )));

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      onPickImage?.call(pickedFile.path);
    }
  }

  /// Get from camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      onPickImage?.call(pickedFile.path ?? "");
    }
  }
}
