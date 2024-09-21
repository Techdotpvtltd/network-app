// Project: 	   concierge_networking
// File:    	   additional_info_screen
// Path:    	   lib/screens/onboarding/additional_info_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 16:22:50 -- Monday
// Description:

import 'package:concierge_networking/blocs/user/user_state.dart';
import 'package:concierge_networking/screens/onboarding/upload_profile_screen.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/extensions/date_extension.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user/user_bloc.dart';
import '../../blocs/user/user_event.dart';
import '../../components/custom_button.dart';
import '../../components/custom_scaffold.dart';
import '../../components/custom_title_textfield.dart';
import '../../components/text_widget.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/constants.dart';
import '../../utils/dialogs/snack_bar.dart';
import '../main/other/agreement_screen.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  DateTime? dob;
  bool isLoading = false;

  void triggerUpdateUserEvent() {
    context.read<UserBloc>().add(UserEventUpdateProfile(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          dob: dob,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserStateProfileUpdating ||
            state is UserStateProfileUpdatingFailure ||
            state is UserStateProfileUpdated) {
          setState(() {
            isLoading = state.isLoading;
          });
          if (state is UserStateProfileUpdatingFailure) {
            CustomSnack.error('Sign up', state.exception.message);
          }

          if (state is UserStateProfileUpdated) {
            NavigationService.go(const UploadProfileScreen());
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
                    "Add Info",
                    size: 34,
                  ),
                  gapH14,
                  const SubtitleText(
                    "Enter additional info for profile",
                  ),
                  gapH24,
                  CustomTextField(
                    controller: firstNameController,
                    hintText: "Enter First Name",
                    keyboardType: TextInputType.name,
                  ),
                  gapH20,
                  CustomTextField(
                    controller: lastNameController,
                    hintText: "Enter Last Name",
                    keyboardType: TextInputType.name,
                  ),
                  gapH20,
                  CustomTextField(
                    controller: TextEditingController(
                      text: dob?.dateToString("dd MMMM yyyy"),
                    ),
                    hintText: "Select Date of birth",
                    keyboardType: TextInputType.datetime,
                    isReadyOnly: true,
                    onTFTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1940),
                        lastDate: DateTime.now(),
                        initialDate: dob ?? DateTime.now(),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          dob = pickedDate;
                        });
                      }
                    },
                  ),
                  gapH20,
                  CustomTextField(
                    controller: phoneController,
                    hintText: "Enter phone number",
                    keyboardType: TextInputType.phone,
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
