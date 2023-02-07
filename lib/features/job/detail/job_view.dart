import 'package:job_search/common/base_view.dart';
import 'package:job_search/common/button_view.dart';
import 'package:job_search/common/utils.dart';
import 'package:job_search/data/model/career.dart';
import 'package:job_search/extension/bool_extension.dart';
import 'package:job_search/extension/number_extension.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../utility/widgets/loading.dart';
import '../../../utility/widgets/toolbar.dart';
import 'job_vm.dart';

class JobView extends StatelessWidget {
  static const routeName = '/job';

  final Career job;

  const JobView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<JobViewModel>(
      onModelReady: (viewModel) {
        viewModel.onCareerListener.stream.listen(
          (event) {
            showAlert(
              context,
              mess: event == JobState.careerApplied
                  ? S.of(context).yourCvAppliedSuccessfully
                  : S.of(context).jobHasBeenSaveSuccessfully,
            );
          },
        );
      },
      builder: (context, viewModel, child) => Stack(
        children: [
          _contentView(context, viewModel),
          if (viewModel.loading) const BaseLoading(),
        ],
      ),
    );
  }

  Widget _contentView(BuildContext context, JobViewModel viewModel) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Toolbar(
                title: job.name ?? S.of(context).jobDetail,
                tag: job.name,
                isLeftButton: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).companyName,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              job.companyName?.toString() ?? 'N/A',
                              style: ThemeTextStyle.heading18,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).amount,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              "${job.amount?.toString() ?? 'N/A'} staffs",
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).workExperience,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              "${job.experience?.toString() ?? 'N/A'} years",
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).gender,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              job.gender?.toString() ?? 'N/A',
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).salary,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              job.salary?.currency() ??
                                  S.of(context).wageAgreement,
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).age,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              "${job.startAge?.toString() ?? 'N/A'} - ${job.endAge?.toString() ?? 'N/A'}",
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).englishLevel,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              job.englishLevel?.toString() ?? 'N/A',
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).contact,
                              style: ThemeTextStyle.heading16,
                            ),
                            Text(
                              job.contact?.toString() ?? 'N/A',
                              style: ThemeTextStyle.heading16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          S.of(context).address,
                          style: ThemeTextStyle.heading16,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          job.address ?? 'N/A',
                          style: ThemeTextStyle.body14,
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          S.of(context).description,
                          style: ThemeTextStyle.heading16,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          job.description ?? 'N/A',
                          style: ThemeTextStyle.body14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (job.apply.isNullOrFalse)
                      ButtonView(
                        () {
                          viewModel.applyCV(job);
                        },
                        content: S.of(context).applyCv,
                      ),
                    if (job.saved.isNullOrFalse) ...[
                      const SizedBox(height: 12.0),
                      ButtonView(
                        () {
                          viewModel.addToFavorite(job);
                        },
                        content: S.of(context).addFavorite,
                      ),
                    ],
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
