import 'package:flutter/material.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/global/logger.dart';

import '../extension/edittext_extension.dart';
import '../generated/assets.dart';
import '../generated/l10n.dart';
import '../theme/themes.dart';

class CustomEditText extends StatefulWidget {
  final String textHint;
  final String title;
  final String? value;
  final String icon;
  final bool isShowIcon;
  final int minLine;
  final int? maxLine;
  final EditTextType type;
  final bool isEnable;
  final Function(String)? onTextChange;
  final bool isError;
  final TextEditingController? controller;
  final double? paddingTop;

  const CustomEditText(
    this.textHint, {
    this.title = "",
    this.value,
    this.type = EditTextType.text,
    this.isShowIcon = false,
    this.isEnable = true,
    this.icon = Assets.imagesIcEyeFist,
    this.onTextChange,
    this.isError = false,
    Key? key,
    this.minLine = 1,
    this.maxLine,
    this.controller,
    this.paddingTop,
  }) : super(key: key);

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  bool _isSecurity = true;
  TextEditingController? controller;
  var text = '';

  @override
  void initState() {
    widget.value?.let((it) => text = it);
    controller = widget.controller ?? TextEditingController(text: text);
    Log.d("initState: $text");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.value?.let((it) => controller?.text = it);
    return Container(
      margin: EdgeInsets.only(top: widget.paddingTop ?? 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.title, style: ThemeTextStyle.body14),
              const Expanded(child: SizedBox()),
              if (widget.type == EditTextType.pass)
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSecurity = !_isSecurity;
                    });
                  },
                  child: Text(
                      _isSecurity ? S.of(context).show : S.of(context).hide,
                      style: ThemeTextStyle.body14),
                )
            ]),
          const SizedBox(height: 12.0),
          editView()
        ],
      ),
    );
  }

  Widget editView() => Container(
      decoration: BoxDecoration(
        color: widget.isEnable ? UIColors.white : UIColors.grayscaleWhite2,
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
            minLines: widget.minLine,
            maxLines: widget.maxLine ?? widget.minLine,
            readOnly: !widget.isEnable,
            keyboardType: widget.type.keyboardType,
            obscureText: (widget.type.isSecurity && _isSecurity) ? true : false,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.next,
            style: ThemeTextStyle.body14.apply(color: UIColors.black),
            textAlign: widget.isError ? TextAlign.center : TextAlign.left,
            decoration: InputDecoration(
                errorBorder: InputBorder.none,
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 24.0, maxWidth: 24.0),
                suffixIcon: widget.isEnable
                    ? InkWell(
                        onTap: () {},
                        child: Image.asset(
                          widget.icon,
                          alignment: Alignment.centerRight,
                          color: widget.isShowIcon
                              ? UIColors.grayscale1
                              : UIColors.white,
                        ))
                    : const SizedBox(
                        width: 0.0,
                      ),
                hintText: widget.textHint,
                hintStyle: ThemeTextStyle.body14.apply(
                    color: widget.isError
                        ? UIColors.colorRed
                        : UIColors.grayscale1),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 16.0),
                isDense: true),
          )));
}
