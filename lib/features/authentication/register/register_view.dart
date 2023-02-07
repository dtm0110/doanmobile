import 'package:job_search/common/base_view.dart';
import 'package:job_search/common/utils.dart';
import 'package:job_search/features/authentication/register/register_vm.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';

import '../../../common/button_view.dart';
import '../../../common/custom_edit_text.dart';
import '../../../extension/edittext_extension.dart';
import '../../../generated/l10n.dart';
import '../../../router.dart';
import '../../../utility/widgets/loading.dart';
import '../../../utility/widgets/toolbar.dart';

class RegisterView extends StatelessWidget {
  static const routeName = '/register';

  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        onModelReady: (viewModel) {
          viewModel.onRegisteredIn.stream.listen((event) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.homeScreen,
              (route) => false,
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

  Widget _contentView(BuildContext context, RegisterViewModel viewModel) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Toolbar(
                title: S.of(context).register,
                isLeftButton: true,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                      S.of(context).newPassword,
                      title: S.of(context).newPassword,
                      type: EditTextType.pass,
                      onTextChange: (p0) {
                        viewModel.updatePassword(p0);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomEditText(
                      S.of(context).confirmPassword,
                      title: S.of(context).confirmPassword,
                      type: EditTextType.pass,
                      onTextChange: (p0) {
                        viewModel.updateRePassword(p0);
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ButtonView(
                      content: S.of(context).register,
                      () {
                        switch (viewModel.doRegister()) {
                          case RegisterState.emailRequired:
                            showAlert(
                              context,
                              mess: S.of(context).emailIsRequired,
                            );
                            break;
                          case RegisterState.passwordRequired:
                            showAlert(
                              context,
                              mess: S.of(context).passwordIsRequired,
                            );
                            break;
                          case RegisterState.confirmPasswordRequired:
                            showAlert(
                              context,
                              mess: S.of(context).confirmPasswordIsRequired,
                            );
                            break;
                          case RegisterState.passwordNotMatch:
                            showAlert(
                              context,
                              mess: S.of(context).passwordNotMatched,
                            );
                            break;
                          case RegisterState.registerValid:
                            break;
                        }
                      },
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );
}
