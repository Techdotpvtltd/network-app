// Project: 	   concierge_networking
// File:    	   edit_profile
// Path:    	   lib/screens/main/profile/edit_profile.dart
// Author:       Ali Akbar
// Date:        20-08-24 22:56:06 -- Tuesday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/avatar_widget.dart';
import '../../../components/custom_title_textfield.dart';
import '../../../components/my_image_picker.dart';
import '../../../utils/constants/app_theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? avatar;

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
    return Scaffold(
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
            const CustomTextField(
              hintText: "Enter First Name",
              keyboardType: TextInputType.name,
            ),
            gapH20,
            const CustomTextField(
              hintText: "Enter Last Name",
              keyboardType: TextInputType.name,
            ),
            gapH20,
            CustomTextField(
              hintText: "Select Date of birth",
              keyboardType: TextInputType.datetime,
              isReadyOnly: true,
              onTFTap: () {},
            ),
            gapH20,
            const CustomTextField(
              hintText: "Enter phone number",
              keyboardType: TextInputType.phone,
            ),
            gapH40,
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                title: "Save",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
