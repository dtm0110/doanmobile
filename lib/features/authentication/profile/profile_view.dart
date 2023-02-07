import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:job_search/common/base_view.dart';
import 'package:job_search/common/custom_edit_text.dart';
import 'package:job_search/common/utils.dart';
import 'package:job_search/extension/edittext_extension.dart';
import 'package:job_search/extension/string_extension.dart';
import 'package:job_search/features/authentication/profile/profile_vm.dart';
import 'package:job_search/features/authentication/profile/selectmajor/import_major_view.dart';
import 'package:job_search/features/authentication/profile/widget/popup_choose_image.dart';
import 'package:job_search/generated/assets.dart';
import 'package:job_search/router.dart';
import 'package:job_search/theme/themes.dart';
import 'package:job_search/utility/widgets/image_kit.dart';

import '../../../common/button_view.dart';
import '../../../common/custom_box.dart';
import '../../../data/database_constant.dart';
import '../../../generated/l10n.dart';
import '../../../utility/widgets/loading.dart';
import '../../../utility/widgets/toolbar.dart';

class ProfileView extends StatefulWidget {
  static const routeName = '/profile';

  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

enum SingingCharacter { male, female }

class _ProfileViewState extends State<ProfileView> {
  late Random rnd;
  TextEditingController? controller;
  SingingCharacter? _character = SingingCharacter.male;

  Widget buildImage(BuildContext context) {
    int min = 0;
    int max = DatabaseConstant.listImagesAccount.length - 1;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    String imageName = DatabaseConstant.listImagesAccount[r].toString();
    return Image.asset(imageName, width: 40.0, height: 40.0);
  }

  @override
  Widget build(BuildContext context) {
    controller = TextEditingController(text: "dd/MM/yyyy");
    return BaseView<ProfileViewModel>(
        onModelReady: (viewModel) {
          viewModel.initData();
          viewModel.onLoggedIn.stream.listen((event) {
            showAlert(context, mess: S.of(context).updateProfileSuccess);
          });
        },
        builder: (context, viewModel, child) => Stack(
              children: [
                _contentView(context, viewModel),
                if (viewModel.loading) const BaseLoading(),
              ],
            ));
  }

  Widget _contentView(BuildContext context, ProfileViewModel viewModel) =>
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: UIColors.blackPrimary),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Toolbar(
                title: S.of(context).profile,
                isLeftButton: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemAvatar(context, viewModel),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomEditText(
                          S.of(context).enterFullName,
                          title: S.of(context).fullName,
                          value: viewModel.account?.name ?? "",
                          type: EditTextType.text,
                          isShowIcon: true,
                          icon: Assets.imagesIcEdit,
                          onTextChange: (value) {
                            viewModel.account?.name = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomEditText(
                          S.of(context).enterEmail,
                          title: S.of(context).email,
                          value: viewModel.account?.getEmail() ?? "",
                          type: EditTextType.text,
                          isEnable: false,
                          isShowIcon: false,
                        ),
                        const SizedBox(height: 16.0),
                        itemGender(context, viewModel),
                        const SizedBox(height: 16.0),
                        itemPhoneAndGender(context, viewModel),
                        const SizedBox(height: 16.0),
                        itemWeightHeight(context, viewModel),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: InkWell(
                                    onTap: () {
                                      showListMajorBottomSheet(
                                          context, viewModel);
                                    },
                                    child: CustomBox(
                                      title: S.of(context).major,
                                      value: viewModel.account?.career ??
                                          S.of(context).chooseMajor,
                                      type: EditTextType.text,
                                      isShowIcon: true,
                                      icon: Assets.imagesIcEdit,
                                    ))),
                            const SizedBox(width: 8.0),
                            Expanded(
                                child: CustomEditText(
                              S.of(context).selectWorkExperience,
                              title: S.of(context).workExperience,
                              value: "${viewModel.account?.experience ?? 0}",
                              isShowIcon: true,
                              type: EditTextType.text,
                              icon: Assets.imagesIcEdit,
                              onTextChange: (value) {
                                viewModel.account?.experience = value.toInt;
                              },
                            )),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        CustomEditText(
                          S.of(context).enterDescription,
                          value: viewModel.account?.description ?? "",
                          title: S.of(context).shortDescription,
                          onTextChange: (p0) {
                            viewModel.account?.description = p0;
                          },
                        )
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
                child: Column(children: [
                  ButtonView(
                    () {
                      viewModel.updateProfile();
                    },
                    content: S.of(context).update,
                  ),
                  /*const SizedBox(height: 12.0),
                  ButtonView(
                    () {
                      showAlert(
                        context,
                        mess: S.of(context).doYouWantLogout,
                        titleCloseBtn: S.of(context).logout,
                        onCloseCallBack: () {
                          viewModel.logout();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouter.loginScreen,
                            (route) => false,
                          );
                        },
                      );
                    },
                    content: S.of(context).logout,
                  ),*/
                ]),
              )
            ],
          ),
        ),
      );

  Widget itemPhoneAndGender(BuildContext context, ProfileViewModel viewModel) =>
      Row(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
          child: InkWell(
            child: CustomBox(
              title: S.of(context).birthdate,
              value: viewModel.account?.birthday ?? "dd-MM-yyyy",
              isShowIcon: true,
              icon: Assets.imagesIcEdit,
            ),
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1900, 1, 1),
                maxTime: DateTime.now(),
                onChanged: (date) {
                  if (kDebugMode) {
                    print('onChanged $date');
                  }
                },
                onConfirm: (date) {
                  viewModel.updateBirthDay(date);
                },
                currentTime: viewModel.dob(),
                locale: LocaleType.vi,
              );
            },
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
            child: CustomEditText(
          S.of(context).enterPhone,
          title: S.of(context).phone,
          value: viewModel.account?.phone ?? "",
          type: EditTextType.number,
          isShowIcon: true,
          icon: Assets.imagesIcEdit,
          onTextChange: (value) {
            viewModel.account?.phone = value;
          },
        )),
      ]);

  Widget itemWeightHeight(BuildContext context, ProfileViewModel viewModel) =>
      Row(mainAxisSize: MainAxisSize.max, children: [
        Expanded(
            child: CustomEditText(
          S.of(context).enterWeight,
          title: S.of(context).weightkg,
          value: "${viewModel.account?.weight ?? 0}",
          type: EditTextType.number,
          isShowIcon: true,
          icon: Assets.imagesIcEdit,
          onTextChange: (value) {
            viewModel.account?.weight = value.toInt;
          },
        )),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
            child: CustomEditText(
          S.of(context).enterHeightcm,
          title: S.of(context).heightcm,
          value: "${viewModel.account?.height ?? 0}",
          type: EditTextType.number,
          isShowIcon: true,
          icon: Assets.imagesIcEdit,
          onTextChange: (value) {
            viewModel.account?.height = value.toDouble;
          },
        )),
      ]);

  showListMajorBottomSheet(BuildContext context, ProfileViewModel viewModel) =>
      showModalBottomSheet(
          context: context,
          elevation: 20.0,
          isScrollControlled: true,
          backgroundColor: UIColors.blackPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero),
          ),
          builder: (BuildContext context) {
            return ImportNetworkView(
              networks: viewModel.majors,
              onSelectItem: (item) {
                viewModel.updateCurrentMajor(item);
              },
              currentMajor: viewModel.currentMajor,
            );
          }).whenComplete(() {});

  Widget itemGender(BuildContext context, ProfileViewModel viewModel) {
    _character = viewModel.account?.genderEnum() ?? SingingCharacter.male;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(S.of(context).gender, style: ThemeTextStyle.body14),
        Expanded(
            child: ListTile(
          title: Text(
            S.of(context).male,
            style: ThemeTextStyle.body12,
          ),
          leading: Radio<SingingCharacter>(
            activeColor: UIColors.primary,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: SingingCharacter.male,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                viewModel.updateGender(S.of(context).male);
              });
            },
          ),
        )),
        Expanded(
            child: ListTile(
          title: Text(
            S.of(context).female,
            style: ThemeTextStyle.body12,
          ),
          leading: Radio<SingingCharacter>(
            activeColor: UIColors.primary,
            value: SingingCharacter.female,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                viewModel.updateGender(S.of(context).female);
              });
            },
          ),
        )),
      ],
    );
  }

  Widget itemAvatar(BuildContext context, ProfileViewModel viewModel) => Center(
        child: InkWell(
            onTap: () {
              showPopupChooseImageBottomSheet(context, viewModel);
            },
            child: ImageKit(
              size: 96.0,
              borderRadius: BorderRadius.circular(48.0),
              url: viewModel.pathImage,
              isPath: true,
            )),
      );

  showPopupChooseImageBottomSheet(
          BuildContext context, ProfileViewModel viewModel) =>
      showModalBottomSheet(
          context: context,
          elevation: 20.0,
          isScrollControlled: true,
          backgroundColor: UIColors.blackPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero),
          ),
          builder: (BuildContext context) {
            return PopupChooseMethodImport(
              onPickImage: (path) {
                viewModel.updatePathAvatar(path);
                Navigator.of(context).pop();
              },
            );
          });
}
