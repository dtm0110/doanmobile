import 'package:flutter/material.dart';
import 'package:job_search/common/base_view.dart';
import 'package:job_search/common/custom_edit_text.dart';
import 'package:job_search/extension/string_extension.dart';
import 'package:job_search/features/filter/bottom_sheet_province.dart';
import 'package:job_search/features/filter/filter_vm.dart';
import 'package:job_search/utility/widgets/toolbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../common/button_view.dart';
import '../../data/model/filter_arguments.dart';
import '../../extension/edittext_extension.dart';
import '../../generated/l10n.dart';
import '../../theme/themes.dart';

class FilterView extends StatelessWidget {
  static const routeName = '/filter';

  final FilterArguments arguments;

  const FilterView(this.arguments, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FilterVM>(onModelReady: (viewModel) {
      viewModel.initData(arguments);
    }, builder: (context, viewModel, child) {
      return Scaffold(
        backgroundColor: UIColors.blackPrimary,
        body: Column(
          children: [
            Toolbar(
              title: S.of(context).filter,
              isLeftButton: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(S.of(context).minSalary, style: ThemeTextStyle.body14),
                    CustomEditText(
                      S.of(context).minSalary,
                      value: viewModel.filter?.salary?.toString() ?? "",
                      paddingTop: 0.0,
                      type: EditTextType.number,
                      onTextChange: (text) {
                        if (text.isEmpty) {
                          viewModel.filter?.salary = null;
                        } else {
                          viewModel.filter?.salary = text.toInt;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(S.of(context).age, style: ThemeTextStyle.body14),
                    CustomEditText(
                      S.of(context).age,
                      value: viewModel.filter?.age?.toString() ?? '',
                      paddingTop: 0.0,
                      type: EditTextType.number,
                      onTextChange: (text) {
                        if (text.isEmpty) {
                          viewModel.filter?.age = null;
                        } else {
                          viewModel.filter?.age = text.toInt;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(S.of(context).experienceYrs,
                        style: ThemeTextStyle.body14),
                    CustomEditText(
                      S.of(context).experienceYrs,
                      value: viewModel.filter?.age?.toString() ?? '',
                      paddingTop: 0.0,
                      type: EditTextType.number,
                      onTextChange: (text) {
                        if (text.isEmpty) {
                          viewModel.filter?.age = null;
                        } else {
                          viewModel.filter?.age = text.toInt;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(S.of(context).province, style: ThemeTextStyle.body14),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BottomSheetProvince(viewModel);
                            });
                      },
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              width: 1.0,
                              color: UIColors.grayscaleWhite3,
                            )),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            viewModel.filter?.provinceData?.nameEn ??
                                S.of(context).chooseProvince,
                            style: ThemeTextStyle.body14.apply(
                              color: UIColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonView(
                () {
                  Navigator.pop(
                    context,
                    viewModel.filter,
                  );
                },
                content: S.of(context).confirm,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
