import 'package:flutter/material.dart';
import 'package:job_search/global/logger.dart';

import '../extension/edittext_extension.dart';
import '../theme/themes.dart';

class CustomBox extends StatefulWidget {
  final String title;
  final String value;
  final String icon;
  final bool isShowIcon;
  final int minLine;
  final int? maxLine;
  final EditTextType type;
  final TextEditingController? controller;
  final double? paddingTop;

  const CustomBox({
    this.title = "",
    this.value = "",
    this.type = EditTextType.text,
    this.isShowIcon = false,
    this.icon = "",
    Key? key,
    this.minLine = 1,
    this.maxLine,
    this.controller,
    this.paddingTop,
  }) : super(key: key);

  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  TextEditingController? controller;
  var text = '';

  @override
  void initState() {
    text = widget.value;
    controller = widget.controller ?? TextEditingController(text: text);
    Log.d("initState: $text");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.paddingTop ?? 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Text(widget.title, style: ThemeTextStyle.body14),
          const SizedBox(height: 12.0),
          editView()
        ],
      ),
    );
  }

  Widget editView() => Container(
      decoration: BoxDecoration(
          color: UIColors.white,
          border: Border.all(color: UIColors.grayscaleWhite3, width: 1.0),
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                widget.value,
                style:
                    ThemeTextStyle.body14.apply(color: UIColors.black),
              )),
              if (widget.icon.isNotEmpty)
                Image.asset(
                  widget.icon,
                  alignment: Alignment.centerRight,
                  color: UIColors.grayscale1,
                  width: 24.0,
                  height: 24.0,
                )
            ],
          )));
}
