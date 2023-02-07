import 'package:flutter/material.dart';

import '../theme/themes.dart';

class CustomText extends StatefulWidget {
  final String content;
  final String title;
  final Color color;
  final TextEditingController? controller;
  final Function(String)? onTextChange;
  final String? textHint;

  const CustomText({
    super.key,
    required this.content,
    required this.title,
    this.color = UIColors.white,
    this.controller,
    this.onTextChange,
    this.textHint,
  });

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  TextEditingController? controller;
  var text = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // padding: const EdgeInsets.all(12.0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(8.0),
      //     border: Border.all(color: widget.color)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: ThemeTextStyle.body14.apply(color: widget.color),
          ),
          const SizedBox(height: 12.0,),
          editView(),
        ],
      ),
    );
  }

  Widget editView() => Container(
      decoration: BoxDecoration(
        color: UIColors.white,
        border: Border.all(color: UIColors.grayscaleWhite3, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              text = value;
              widget.onTextChange?.call(value);
            },
            minLines: 1,
            maxLines: 10,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.next,
            style: ThemeTextStyle.body14.apply(color: UIColors.black),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                errorBorder: InputBorder.none,
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 24.0, maxWidth: 24.0),
                hintText: widget.textHint,
                hintStyle:
                    ThemeTextStyle.body14.apply(color: UIColors.grayscale1),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 16.0),
                isDense: true),
          )));
}
