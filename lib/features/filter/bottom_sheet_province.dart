import 'package:flutter/material.dart';
import 'package:job_search/data/model/province.dart';
import 'package:job_search/features/filter/filter_vm.dart';
import 'package:job_search/theme/themes.dart';

import '../../generated/l10n.dart';

class BottomSheetProvince extends StatelessWidget {
  const BottomSheetProvince(this.viewModel, {super.key});

  final FilterVM viewModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              S.of(context).province,
              style: ThemeTextStyle.heading16,
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return itemProvince(viewModel.provinces[index], context);
              },
              itemCount: viewModel.provinces.length,
            ))
          ],
        ),
      ),
    );
  }

  Widget itemProvince(Province province, BuildContext context) => InkWell(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              province.nameEn ?? "",
              style: ThemeTextStyle.body14,
            ),
          ),
        ),
        onTap: () {
          viewModel.setProvinceSelected(province);
          Navigator.pop(context);
        },
      );
}
