// Project: 	   balanced_workout
// File:    	   custom_back_button
// Path:    	   lib/screens/components/custom_back_button.dart
// Author:       Ali Akbar
// Date:        04-05-24 13:32:34 -- Saturday
// Description:

import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../utils/extensions/navigation_service.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed, this.backgroundColor});
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
          return;
        }
        NavigationService.back();
      },
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? AppTheme.primaryColor1,
        ),
        fixedSize: const WidgetStatePropertyAll(Size(54, 54)),
      ),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
