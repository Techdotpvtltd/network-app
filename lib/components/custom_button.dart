// Project: 	   friendzoned
// File:    	   custom_button
// Path:    	   lib/components/custom_button.dart
// Author:       Ali Akbar
// Date:        10-08-24 11:04:01 -- Saturday
// Description:

import 'package:concierge_networking/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/app_theme.dart';
import '../../utils/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.isEnabled = true,
    this.isLoading = false,
    this.onlyBorder = false,
    this.textColor,
    this.backgroundColor,
    this.isSmallText = false,
    this.margin,
  });
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isEnabled;
  final bool isLoading;
  final bool onlyBorder;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isSmallText;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: onlyBorder
            ? Colors.transparent
            : !isEnabled
                ? Colors.grey[400]
                : backgroundColor ?? AppTheme.primaryColor1,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          color: onlyBorder && isEnabled
              ? AppTheme.primaryColor1
              : backgroundColor ?? Colors.transparent,
        ),
      ),
      child: ElevatedButton(
        onPressed: !isLoading && isEnabled ? onPressed : null,
        style: const ButtonStyle(
          surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
          shadowColor: WidgetStatePropertyAll(Colors.transparent),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: (onlyBorder || !isEnabled)
                      ? AppTheme.primaryColor1
                      : Colors.white,
                ),
              )
            : Text(
                title,
                style: GoogleFonts.montserrat(
                  color: !isEnabled && onlyBorder
                      ? Colors.grey[400]
                      : onlyBorder
                          ? AppTheme.primaryColor1
                          : textColor ?? Colors.white,
                  fontSize: isSmallText ? 14 : 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}

// ===========================Text Button================================

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.title,
      this.isShowForwardArrow = true,
      this.foregroundColor,
      required this.onPressed,
      this.textSize,
      this.textWeight,
      this.size,
      this.mainAxisAlignment,
      this.textDecoration});
  final String title;
  final bool isShowForwardArrow;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final double? textSize;
  final FontWeight? textWeight;
  final Size? size;
  final MainAxisAlignment? mainAxisAlignment;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
        elevation: const WidgetStatePropertyAll(0),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fixedSize: WidgetStatePropertyAll(size),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          PrimaryText(
            title,
            color: foregroundColor ?? AppTheme.primaryColor1,
            weight: textWeight ?? FontWeight.w500,
            size: textSize ?? 14,
            textDecoration: textDecoration,
          ),
          if (isShowForwardArrow) gapW10,
          if (isShowForwardArrow)
            const Icon(
              Icons.arrow_forward,
              color: AppTheme.primaryColor1,
            )
        ],
      ),
    );
  }
}
