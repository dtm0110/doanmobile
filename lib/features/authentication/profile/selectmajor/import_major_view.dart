import 'package:flutter/material.dart';
import 'package:job_search/data/model/major.dart';
import 'package:job_search/features/authentication/profile/selectmajor/widget/item_major.dart';

import '../../../../common/base_view.dart';
import '../../../../generated/l10n.dart';
import '../../../../theme/themes.dart';
import 'import_major_vm.dart';

class ImportNetworkView extends StatelessWidget {
  static const routeName = '/import-networks';
  final List<Major>? networks;
  final Function(Major)? onSelectItem;
  final Major? currentMajor;

  const ImportNetworkView(
      {super.key, this.networks, this.onSelectItem, this.currentMajor});

  @override
  Widget build(BuildContext context) {
    return BaseView<ImportNetworkVM>(onModelReady: (viewModel) {
      viewModel.initData(networks ?? [], currentMajor);
    }, builder: (context, viewModel, child) {
      return Container(
          padding: EdgeInsets.only(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: UIColors.transparent,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 20.0),
            Text(S.of(context).major, style: ThemeTextStyle.button),
            networkList(viewModel, viewModel.networks ?? []),
            const SizedBox(height: 8.0),
          ]));
    });
  }

  Widget networkList(ImportNetworkVM viewModel, List<dynamic> data) => SizedBox(
      height: 300.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return getItemView(context, data.elementAt(index), viewModel);
        },
        itemCount: viewModel.networks?.length ?? 0,
      ));

  Widget getItemView(
      BuildContext context, dynamic element, ImportNetworkVM viewModel) {
    var major = element as Major;
    return ItemNetwork((item) {
      Navigator.pop(context, item);
      viewModel.updateDataSelect(item);
      onSelectItem?.call(item);
    },
        major.name?.trim().toLowerCase() ==
            viewModel.currentNetwork?.name?.trim().toLowerCase(),
        network: major);
  }
}
