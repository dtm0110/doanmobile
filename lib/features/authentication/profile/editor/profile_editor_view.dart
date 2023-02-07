import 'package:job_search/common/base_view.dart';
import 'package:job_search/features/authentication/profile/editor/profile_editor_vm.dart';
import 'package:job_search/theme/themes.dart';
import 'package:flutter/material.dart';


class ProfileEditorView extends StatelessWidget {
  static const routeName = '/edit-profile';

  const ProfileEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileEditorViewModel>(
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
