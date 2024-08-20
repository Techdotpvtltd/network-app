// Project: 	   balanced_workout
// File:    	   circle_button
// Path:    	   lib/screens/components/circle_button.dart
// Author:       Ali Akbar
// Date:        06-05-24 13:47:28 -- Monday
// Description:

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.onPressed,
      this.iconPath,
      this.backgroundColor,
      this.colorFilter,
      this.iconSize,
      this.icon,
      this.label});
  final VoidCallback onPressed;
  final String? iconPath;
  final Color? backgroundColor;
  final ColorFilter? colorFilter;
  final Size? iconSize;
  final Icon? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: IconButton(
        onPressed: onPressed,
        icon: icon ??
            SvgPicture.asset(
              iconPath ?? "",
              colorFilter: colorFilter,
              width: iconSize?.width,
              height: iconSize?.height,
            ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? const Color(0xFFF5F5F5),
          ),
        ),
      ),
    );
  }
}
