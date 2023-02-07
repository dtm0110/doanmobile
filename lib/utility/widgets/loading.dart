import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class BaseLoading extends StatelessWidget {
  final String? content;

  const BaseLoading({this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AbsorbPointer(
        absorbing: true,
        child: Container(
            decoration: const BoxDecoration(color: UIColors.black_30),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: UIColors.blackPrimary,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: UIColors.blackPrimary.withOpacity(0.5),
                      spreadRadius: 5.0,
                      blurRadius: 7.0,
                      offset:
                          const Offset(0.0, 3.0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 12.0),
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      content ?? S.of(context).loading,
                      style: ThemeTextStyle.body14,
                    ),
                  ),
                ]),
              ),
            )),
      );
}
