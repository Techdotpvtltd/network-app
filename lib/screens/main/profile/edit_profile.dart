// Project: 	   concierge_networking
// File:    	   edit_profile
// Path:    	   lib/screens/main/profile/edit_profile.dart
// Author:       Ali Akbar
// Date:        20-08-24 22:56:06 -- Tuesday
// Description:

import 'package:concierge_networking/blocs/user/user_bloc.dart';
import 'package:concierge_networking/blocs/user/user_state.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/manager/app_manager.dart';
import 'package:concierge_networking/models/user_model.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/date_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/user/user_event.dart';
import '../../../components/avatar_widget.dart';
import '../../../components/custom_title_textfield.dart';
import '../../../components/my_image_picker.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/dialogs/snack_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModel? user = AppManager.currentUser;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? avatar;
  DateTime? dob;
  bool isLoading = false;

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

  void triggerUpdateUserEvent() {
    context.read<UserBloc>().add(
          UserEventUpdateProfile(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              dob: dob,
              avatar: avatar,
              phone: phoneController.text),
        );
  }

  void setData() {
    if (user != null) {
      firstNameController.text = user!.firstName ?? "";
      lastNameController.text = user!.lastName ?? "";
      phoneController.text = user!.phone ?? "";
      dob = user?.dateOfBirth;
      avatar = user?.avatar;
    }
  }

  @override
  void initState() {
    setData();
    super.initState();
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
            CustomSnack.error('Update Profile', state.exception.message);
          }
          if (state is UserStateProfileUpdatingFailure) {
            CustomSnack.error('Update Profile', state.exception.message);
          }

          if (state is UserStateProfileUpdated) {
            CustomSnack.success("Update", "Profile Updated");
          }
        }
      },
      child: Scaffold(
        appBar: customAppBar(title: "Edit Profile"),
        body: Padding(
          padding: const EdgeInsets.only(left: 42, right: 42, top: 60),
          child: Column(
            children: [
              AvatarWidget(
                avatarUrl: avatar,
                width: 145,
                height: 145,
                backgroundColor: AppTheme.darkWidgetColor2,
                onEditPressed: () {
                  showImagePicker();
                },
              ),
              gapH30,
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
              gapH40,
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  title: "Save",
                  isLoading: isLoading,
                  onPressed: () {
                    triggerUpdateUserEvent();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
