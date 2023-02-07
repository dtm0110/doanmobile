import 'package:job_search/common/base_view.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import '../../../common/button_view.dart';
import '../../../common/custom_edit_text.dart';
import '../../../extension/edittext_extension.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../router.dart';
import '../../../utility/widgets/hero_kit.dart';
import '../../../utility/widgets/loading.dart';
import 'login_vm.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/login';

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onModelReady: (viewModel) {
          viewModel.onLoggedIn.stream.listen((event) {
            Navigator.pushReplacementNamed(
              context,
              AppRouter.homeScreen,
              arguments: event,
            );
          });
        },
        builder: (context, viewModel, child) => Stack(
              children: [
                _contentView(context, viewModel),
                if (viewModel.loading) const BaseLoading(),
              ],
            ));
  }

  Widget _contentView(BuildContext context, LoginViewModel viewModel) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeroKit(
                  tagIndex: "logo",
                  child: Image.asset(
                    Assets.imagesIcLogo,
                    color: UIColors.colorGreen,
                    fit: BoxFit.contain,
                    width: 76.0,
                    height: 76.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                CustomEditText(
                  S.of(context).email,
                  title: S.of(context).email,
                  type: EditTextType.email,
                  onTextChange: (p0) {
                    viewModel.updateEmail(p0);
                  },
                ),
                const SizedBox(height: 16.0),
                CustomEditText(
                  S.of(context).password,
                  title: S.of(context).password,
                  type: EditTextType.pass,
                  onTextChange: (p0) {
                    viewModel.updatePassword(p0);
                  },
                ),
                const SizedBox(height: 32.0),
                ButtonView(
                  content: S.of(context).login,
                  () {
                    viewModel.doLogin();
                  },
                ),
                const SizedBox(height: 16.0),
                ButtonView(
                  content: S.of(context).register,
                  () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.registerScreen,
                      arguments: false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
