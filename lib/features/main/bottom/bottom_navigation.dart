import 'package:flutter/material.dart';
import 'package:job_search/generated/assets.dart';

import '../../../generated/l10n.dart';
import '../../../global/global_key.dart';
import '../../../theme/themes.dart';
import '../main_vm.dart';

class HomeBottomNavigation extends StatelessWidget {
  final MainViewModel viewModel;
  final Function(int) onTapChanged;

  const HomeBottomNavigation(this.viewModel, {Key? key, required this.onTapChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        key: Global.bottomNav,
        backgroundColor: UIColors.white,
        selectedItemColor: UIColors.primary,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: ThemeTextStyle.heading10,
        unselectedLabelStyle: ThemeTextStyle.heading10,
        iconSize: 24,
        currentIndex: viewModel.selectedTabIndex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon:
                const ImageIcon(AssetImage(Assets.imagesRoundHomeBlack48)),
            icon: const ImageIcon(AssetImage(Assets.imagesRoundHomeBlack48)),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            activeIcon:
                const ImageIcon(AssetImage(Assets.imagesRoundGradeBlack48)),
            icon: const ImageIcon(AssetImage(Assets.imagesRoundGradeBlack48)),
            label: S.of(context).favorite,
          ),
          BottomNavigationBarItem(
            activeIcon: const ImageIcon(
                AssetImage(Assets.imagesRoundBookmarkAddedBlack48)),
            icon: const ImageIcon(
                AssetImage(Assets.imagesRoundBookmarkAddedBlack48)),
            label: S.of(context).applied,
          ),
          BottomNavigationBarItem(
            activeIcon: const ImageIcon(
                AssetImage(Assets.imagesRoundPersonBlack48)),
            icon: const ImageIcon(
                AssetImage(Assets.imagesRoundPersonBlack48)),
            label: S.of(context).profile,
          ),
        ],
        onTap: (index) {
          viewModel.onTabChanged(index);
          onTapChanged(index);
        },
      );
}
