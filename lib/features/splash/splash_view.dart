import 'package:job_search/common/base_view.dart';
import 'package:job_search/features/splash/splash_vm.dart';
import 'package:job_search/generated/assets.dart';
import 'package:job_search/router.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:job_search/utility/widgets/hero_kit.dart';

class SplashView extends StatelessWidget {
  static const routeName = '/';

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        onModelReady: (viewModel) {
          viewModel.startSplash(context).then((value) => {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouter.loginScreen,
                )
              });
        },
        builder: (context, viewModel, child) => _splashView());
  }

  Widget _splashView() => Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: HeroKit(
              tagIndex: "logo",
              child: Image.asset(
                Assets.imagesIcLogo,
                fit: BoxFit.contain,
                width: 96.0,
                height: 96.0,
              ),
            ),
          ),
        ),
      );
}
