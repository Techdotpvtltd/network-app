// Project: 	   concierge_networking
// File:    	   chat_screen
// Path:    	   lib/screens/main/chat/chat_screen.dart
// Author:       Ali Akbar
// Date:        20-08-24 18:03:32 -- Tuesday
// Description:

import 'package:concierge_networking/components/circle_button.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_title_textfield.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/main/components/booking_widget.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    this.scrollController,
    this.isShowBackButton = true,
  });
  final ScrollController? scrollController;
  final bool isShowBackButton;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: customAppBar(
        showBack: widget.isShowBackButton,
        actions: SvgPicture.asset(AppAssets.threeDotsHorizontalIcon),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 5),
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Time Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: const Color(0xFF111111).withOpacity(0.2),
                            ),
                          ),
                          gapW40,
                          const SubtitleText(
                            "today",
                            color: Color(0xFF444444),
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                          gapW40,
                          Expanded(
                            child: Divider(
                              color: const Color(0xFF111111).withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),

                      gapH20,
                      const _LeftBubble(),
                      gapH20,
                      const _RightBubble(),
                      gapH20,
                      const BookingWidget(),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: widget.isShowBackButton ? 0 : 45,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomMessageTextField(
                        hintText: "Message",
                        prefixWidget: SizedBox(
                          width: 19,
                          child: Center(
                            child: SvgPicture.asset(
                              AppAssets.clipIcon,
                            ),
                          ),
                        ),
                      ),
                    ),
                    gapW10,
                    CircleButton(
                      backgroundColor: const Color(0xFF444444),
                      onPressed: () {},
                      iconPath: AppAssets.sendIcon,
                      iconSize: const Size(18, 18),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LeftBubble extends StatelessWidget {
  const _LeftBubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: SCREEN_WIDTH * 0.7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            "This one is completely open ended?",
            size: 12,
            color: AppTheme.titleColor1,
            weight: FontWeight.w500,
          ),
          gapH4,
          PrimaryText(
            "09:33 AM",
            size: 8,
          )
        ],
      ),
    );
  }
}

class _RightBubble extends StatelessWidget {
  const _RightBubble();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: SCREEN_WIDTH * 0.7),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFEEEEEE),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PrimaryText(
              "This one is completely open ended?",
              size: 12,
              color: AppTheme.titleColor1,
              weight: FontWeight.w500,
            ),
            gapH4,
            PrimaryText(
              "09:33 AM",
              size: 8,
            )
          ],
        ),
      ),
    );
  }
}
