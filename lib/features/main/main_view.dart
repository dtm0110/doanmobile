import 'package:job_search/common/base_view.dart';
import 'package:job_search/features/authentication/profile/profile_view.dart';
import 'package:job_search/features/home/home_view.dart';
import 'package:job_search/features/job/applied/job_applied_view.dart';
import 'package:job_search/features/job/favorite/job_favorite_view.dart';
import 'package:job_search/features/main/bottom/bottom_navigation.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import 'main_vm.dart';

class MainView extends StatelessWidget {
  static const routeName = '/main';

  static final List<Widget> _pages = [
    HomeView(),
    JobFavoriteView(),
    JobAppliedView(),
    const ProfileView(),
  ];

  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
        onModelReady: (viewModel) {},
        builder: (context, viewModel, child) => _contentView(viewModel));
  }

  Widget _contentView(MainViewModel viewModel) => Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: viewModel.selectedTabIndex,
              children: MainView._pages,
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Divider(
                color: UIColors.grayscaleWhite2,
                height: 1,
                indent: 0,
                endIndent: 0,
              ),
            ),
          ],
        ),
        /*    JobFavoriteView(),
    JobAppliedView(),*/
        bottomNavigationBar: HomeBottomNavigation(
          viewModel,
          onTapChanged: (index) {
            if (MainView._pages[index] is JobFavoriteView) {
              (MainView._pages[index] as JobFavoriteView).reloadData();
            }

            if (MainView._pages[index] is JobAppliedView) {
              (MainView._pages[index] as JobAppliedView).reloadData();
            }

            if (MainView._pages[index] is HomeView) {
              (MainView._pages[index] as HomeView).reloadData();
            }
          },
        ),
      );
}
