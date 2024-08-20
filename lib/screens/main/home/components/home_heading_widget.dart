import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeHeadingWidget extends StatelessWidget {
  const HomeHeadingWidget(
      {super.key,
      required this.title,
      required this.child,
      this.onPressedAll,
      this.buttonTitle});
  final String title;
  final Widget child;
  final VoidCallback? onPressedAll;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryTitleText(
              title,
              size: 18,
              weight: FontWeight.w600,
            ),
            if (onPressedAll != null)
              CustomTextButton(
                title: buttonTitle ?? "See All",
                onPressed: () {
                  if (onPressedAll != null) {
                    onPressedAll!();
                  }
                },
                isShowForwardArrow: false,
                textDecoration: TextDecoration.underline,
              )
          ],
        ),
        gapH16,
        child,
      ],
    );
  }
}
