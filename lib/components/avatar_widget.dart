import 'package:flutter/material.dart';

import '../../utils/constants/app_theme.dart';
import 'circle_network_image_widget.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    this.width,
    this.height,
    this.avatarUrl,
    this.backgroundColor,
    this.placeholderChar,
    this.onEditPressed,
  });
  final double? width;
  final double? height;
  final String? avatarUrl;
  final Color? backgroundColor;
  final String? placeholderChar;
  final VoidCallback? onEditPressed;

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: CircleNetworkImage(
            height: widget.height ?? 115,
            width: widget.width ?? 115,
            backgroundColor: widget.backgroundColor ??
                (widget.placeholderChar != null
                    ? AppTheme.primaryColor1
                    : AppTheme.primaryColor1),
            url: widget.avatarUrl ?? "",
            placeholderWidget: LayoutBuilder(
              builder: (context, constraints) {
                return Text(
                  widget.placeholderChar ?? "U",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.6,
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
          ),
        ),
        Visibility(
          visible: widget.onEditPressed != null,
          child: Positioned(
            right: 4,
            bottom: 2,
            child: IconButton(
              onPressed: () {
                if (widget.onEditPressed != null) {
                  widget.onEditPressed!();
                }
              },
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                visualDensity: VisualDensity.compact,
                backgroundColor: WidgetStatePropertyAll(AppTheme.primaryColor1),
              ),
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
