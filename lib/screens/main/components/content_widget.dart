// Project: 	   concierge_networking
// File:    	   content_widget
// Path:    	   lib/screens/main/home/components/content_widget.dart
// Author:       Ali Akbar
// Date:        20-08-24 15:40:15 -- Tuesday
// Description:

import 'package:concierge_networking/screens/main/components/gradient_image_widget.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget(
      {super.key,
      this.width,
      this.height,
      required this.coverUrl,
      required this.child,
      this.onPressed,
      this.contentPadding,
      this.margin});
  final double? width;
  final double? height;
  final String coverUrl;
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: widget.width,
        height: widget.height ?? 143,
        child: GradientImageWidget(
          onPressed: widget.onPressed,
          coverUrl: widget.coverUrl,
          child: Padding(
            padding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
