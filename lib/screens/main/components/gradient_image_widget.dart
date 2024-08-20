// Project: 	   concierge_networking
// File:    	   gradient_image_widget
// Path:    	   lib/screens/main/home/components/gradient_image_widget.dart
// Author:       Ali Akbar
// Date:        20-08-24 15:28:17 -- Tuesday
// Description:

import 'package:flutter/material.dart';

import '../../../components/custom_container.dart';
import '../../../components/custom_network_image.dart';
import '../../../utils/constants/app_theme.dart';

class GradientImageWidget extends StatelessWidget {
  const GradientImageWidget(
      {super.key,
      required this.coverUrl,
      this.radius,
      this.onPressed,
      this.child});
  final String coverUrl;
  final double? radius;
  final VoidCallback? onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(radius ?? 10),
      child: Stack(
        children: [
          Positioned.fill(child: CustomNetworkImage(imageUrl: coverUrl)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.primaryColor1.withOpacity(0),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
            ),
          ),
          if (child != null) Positioned(child: child!),
        ],
      ),
    );
  }
}
