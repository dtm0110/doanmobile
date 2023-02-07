import 'package:job_search/common/base_view.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:job_search/utility/widgets/toolbar.dart';

import '../../../data/model/career.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../router.dart';
import '../../../utility/widgets/hero_kit.dart';
import 'job_applied_vm.dart';
import "../../../extension/number_extension.dart";

class JobAppliedView extends StatelessWidget {
  static const routeName = '/job_applied';

  JobAppliedViewModel? _viewModel;

  JobAppliedView({Key? key}) : super(key: key);

  void reloadData() {
    _viewModel?.getListCareer();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<JobAppliedViewModel>(
      onModelReady: (viewModel) {
        _viewModel = viewModel;
        viewModel.getListCareer();
      },
      builder: (context, viewModel, child) => _contentView(
        context,
        viewModel,
      ),
    );
  }

  Widget _contentView(BuildContext context, JobAppliedViewModel viewModel) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Toolbar(
                title: S.of(context).careerApplied,
                isLeftButton: false,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: jobList(viewModel),
                ),
              ),
            ],
          ),
        ),
      );

  jobList(JobAppliedViewModel viewModel) => ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            jobItem(context, viewModel.careers[index]),
        itemCount: viewModel.careers.length,
      );

  jobItem(BuildContext context, Career job) => ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        leading: Image.asset(
          color: UIColors.colorGreen,
          Assets.imagesIcLogo,
          width: 32.0,
          height: 32.0,
        ),
        title: HeroKit(
          tagIndex: job.name ?? '',
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              job.name ?? '',
              style: ThemeTextStyle.heading16,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        subtitle: Text(
          job.companyName ?? '',
          style: ThemeTextStyle.body14,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              job.createDateFormatted,
              style: ThemeTextStyle.body12,
            ),
            const SizedBox(height: 8.0),
            Text(
              job.salary?.currency() ?? S.of(context).wageAgreement,
              style: ThemeTextStyle.body12,
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, AppRouter.jobScreen, arguments: job);
        },
      );
}
