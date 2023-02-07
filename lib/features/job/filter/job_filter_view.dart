import 'package:job_search/common/base_view.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import 'job_filter_vm.dart';

class JobFilterView extends StatelessWidget {
  static const routeName = '/job_filter';

  const JobFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<JobFilterViewModel>(
        onModelReady: (viewModel) {},
        builder: (context, viewModel, child) => _contentView());
  }

  Widget _contentView() => Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          padding: const EdgeInsets.all(24.0),
          child: Center(),
        ),
      );
}
