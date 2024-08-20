import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_container.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
  });
  final VoidCallback onPressed;
  final String icon;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onPressed: onPressed,
      color: const Color(0xFFF2F2F2),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
      ),
    );
  }
}
