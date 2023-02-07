import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/extension/string_extension.dart';
import 'package:job_search/generated/assets.dart';
import 'package:job_search/theme/themes.dart';

class ImageKit extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final double? size;
  final String? ratio;
  final BoxFit? boxFit;
  final String placeHolder;
  final String? errorHolder;
  final Widget? errorChild;
  final BorderRadiusGeometry? borderRadius;
  final bool isPath;

  const ImageKit(
      {super.key,
      required this.url,
      this.width,
      this.height,
      this.size,
      this.boxFit,
      this.placeHolder = Assets.imagesAppIcon,
      this.errorHolder,
      this.errorChild,
      this.ratio,
      this.borderRadius,
      this.isPath = false});

  @override
  Widget build(BuildContext context) {
    var image = url.emptyOrNull
        ? _errorHolder()
        : (isPath
            ? Image.file(File(url ?? ""), width: 96.0, height: 96.0, fit: BoxFit.fill,)
            : FadeInImage.assetNetwork(
                width: size ?? width,
                height: size ?? height,
                fit: boxFit ?? BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) =>
                    _errorHolder(),
                placeholder: placeHolder,
                placeholderFit: boxFit ?? BoxFit.cover,
                image: url ?? "",
              ));
    return borderRadius?.let((it) => ClipRRect(
              child: image,
              borderRadius: it,
            )) ??
        image;
  }

  _errorHolder() =>
      errorChild ??
          Image.asset(
            errorHolder ?? placeHolder,
        width: size ?? width,
        height: size ?? height,
        fit: boxFit ?? BoxFit.cover,
        color: UIColors.grayscale1,
      );
}
