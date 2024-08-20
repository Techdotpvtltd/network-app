// Project: 	   friendzoned
// File:    	   image_picker_widget
// Path:    	   lib/components/image_picker_widget.dart
// Author:       Ali Akbar
// Date:        10-08-24 15:29:32 -- Saturday
// Description:

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/custom_container.dart';
import '../components/custom_network_image.dart';
import '../components/my_image_picker.dart';
import '../components/text_widget.dart';
import '../utils/constants/constants.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key, required this.title, this.description});
  final String title;
  final String? description;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
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
    return SizedBox(
      width: SCREEN_WIDTH,
      height: 200,
      child: avatar != null
          ? CustomContainer(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: CustomNetworkImage(
                imageUrl: avatar ?? "",
              ),
            )
          : CustomContainer(
              onPressed: () {
                showImagePicker();
              },
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("AppAssets.uploadIcon"),
                  gapH10,
                  PrimaryTitleText(widget.title),
                  if (widget.description != null) gapH6,
                  if (widget.description != null)
                    SubtitleText(
                      widget.description ?? "",
                      align: TextAlign.center,
                      size: 10,
                    ),
                ],
              ),
            ),
    );
  }
}
