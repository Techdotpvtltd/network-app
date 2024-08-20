import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants/constants.dart';

import '../utils/constants/app_theme.dart';
import 'custom_back_button.dart';
// Project: 	   balanced_workout
// File:    	   custom_app_bar
// Path:    	   lib/screens/components/custom_app_bar.dart
// Author:       Ali Akbar
// Date:        04-05-24 13:32:15 -- Saturday
// Description:

PreferredSizeWidget customAppBar({
  Color? background,
  String? title,
  bool showBack = true,
  double topPadding = 0,
  double rightPadding = 0,
  double leftPadding = 0,
  double appBarSize = 60,
  Widget? actions,
  Widget? titleWidget,
  bool centerTitle = false,
  final VoidCallback? onBackPressed,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(topPadding + appBarSize),
    child: Padding(
      padding: EdgeInsets.only(
          top: topPadding, right: rightPadding, left: leftPadding),
      child: AppBar(
        backgroundColor: background,
        leadingWidth: showBack ? 90 : 0,
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        shadowColor: Colors.transparent,
        titleSpacing: showBack ? 0 : 20,
        leading: showBack
            ? Center(
                child: CustomBackButton(onPressed: onBackPressed),
              )
            : null,
        actions: [
          titleWidget ??
              Text(
                title ?? "",
                style: GoogleFonts.inter(
                  color: AppTheme.titleColor1,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
          if (actions != null) actions,
          gapW20,
        ],
      ),
    ),
  );
}
