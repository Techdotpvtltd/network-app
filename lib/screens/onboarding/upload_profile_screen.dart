// Project: 	   concierge_networking
// File:    	   upload_profile_screen
// Path:    	   lib/screens/onboarding/upload_profile_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 16:37:22 -- Monday
// Description:

import 'package:concierge_networking/blocs/user/user_event.dart';
import 'package:concierge_networking/components/avatar_widget.dart';
import 'package:concierge_networking/screens/main/other/agreement_screen.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../blocs/user/user_bloc.dart';
import '../../blocs/user/user_state.dart';
import '../../components/custom_button.dart';
import '../../components/custom_scaffold.dart';
import '../../components/my_image_picker.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_theme.dart';
import '../../utils/constants/constants.dart';
import '../../utils/dialogs/snack_bar.dart';

class UploadProfileScreen extends StatefulWidget {
  const UploadProfileScreen({super.key});

  @override
  State<UploadProfileScreen> createState() => _UploadProfileScreenState();
}

class _UploadProfileScreenState extends State<UploadProfileScreen> {
  String? avatar;

  bool isLoading = false;

  void triggerUpdateUserEvent() {
    context.read<UserBloc>().add(UserEventUpdateProfile(avatar: avatar));
  }

  void showImagePicker() {
    final MyImagePicker imagePicker = MyImagePicker();
    imagePicker.pick();
    imagePicker.onSelection(
      (exception, data) {
        if (data is XFile) {
          setState(() {
            avatar = data.path;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserStateProfileUpdating ||
            state is UserStateProfileUpdatingFailure ||
            state is UserStateProfileUpdated ||
            state is UserStateAvatarUploaded ||
            state is UserStateAvatarUploading ||
            state is UserStatAvatareUploadingFailure) {
          setState(() {
            isLoading = state.isLoading;
          });

          if (state is UserStatAvatareUploadingFailure) {
            CustomSnack.error('Sign up', state.exception.message);
          }
          if (state is UserStateProfileUpdatingFailure) {
            CustomSnack.error('Sign up', state.exception.message);
          }

          if (state is UserStateProfileUpdated) {
            NavigationService.offAll(
                const AgreementScreen(isPrivacy: true, isComingFromAuth: true));
          }
        }
      },
      child: CustomScaffold(
        backgroundImagePath: AppAssets.scaffoldBG1,
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 44, bottom: 40),
            child: SizedBox(
              width: SCREEN_WIDTH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Image.asset(
                      AppAssets.logoIcon,
                      width: 151,
                    ),
                  ),
                  gapH50,
                  gapH20,
                  const PrimaryTitleText(
                    "Upload Picture",
                    size: 34,
                  ),
                  gapH14,
                  const SubtitleText("Select Picture for profile"),
                  gapH50,
                  gapH20,
                  Center(
                    child: AvatarWidget(
                      avatarUrl: avatar,
                      width: 145,
                      height: 145,
                      backgroundColor: AppTheme.darkWidgetColor2,
                      onEditPressed: () {
                        showImagePicker();
                      },
                    ),
                  ),
                  gapH30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        title: "Skip",
                        onPressed: () {
                          NavigationService.offAll(const AgreementScreen(
                              isPrivacy: true, isComingFromAuth: true));
                        },
                        isShowForwardArrow: false,
                        foregroundColor: AppTheme.titleColor1,
                        textDecoration: TextDecoration.underline,
                      ),
                      CustomButton(
                        title: "Next",
                        isLoading: isLoading,
                        onPressed: () {
                          triggerUpdateUserEvent();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
