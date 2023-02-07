import 'package:job_search/common/base_view.dart';
import 'package:job_search/common/custom_edit_text.dart';
import 'package:job_search/data/model/career.dart';
import 'package:job_search/extension/list_extensions.dart';
import 'package:job_search/extension/number_extension.dart';
import 'package:job_search/extension/operation_extension.dart';
import 'package:job_search/generated/assets.dart';
import 'package:job_search/router.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:job_search/utility/widgets/hero_kit.dart';

import '../../data/model/filter_arguments.dart';
import '../../generated/l10n.dart';
import 'home_vm.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home';

  HomeViewModel? _viewModel;

  HomeView({Key? key}) : super(key: key);

  void reloadData() {
    _viewModel?.getListCareer();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {
        _viewModel = viewModel;
        viewModel.initData();
      },
      builder: (context, viewModel, child) => _contentView(context, viewModel),
    );
  }

  Widget _contentView(BuildContext context, HomeViewModel viewModel) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: MediaQuery.of(context).viewPadding.top,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CustomEditText(
                        S.of(context).search,
                        paddingTop: 0.0,
                        onTextChange: (key) {
                          viewModel.doSearch(key);
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var result = await Navigator.pushNamed(
                            context, AppRouter.filterScreen,
                            arguments: viewModel.filter);
                        if (result != null) {
                          viewModel.filterList(result as FilterArguments);
                        }
                      },
                      child: Container(
                        height: 48.0,
                        margin: const EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Center(
                          child: Image.asset(
                            Assets.imagesRoundFilterAltBlack48,
                            width: 24.0,
                            height: 24.0,
                            color: UIColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  jobList(HomeViewModel viewModel) => StreamBuilder(
        stream: viewModel.careers.stream,
        builder: (context, snapshot) => ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return snapshot.data
                    ?.getOrNull(index)
                    ?.let((it) => jobItem(context, it)) ??
                Container();
          },
          itemCount: snapshot.data?.length ?? 0,
        ),
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
