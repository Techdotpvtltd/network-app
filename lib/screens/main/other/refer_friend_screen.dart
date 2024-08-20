// Project: 	   concierge_networking
// File:    	   refer_friend_screen
// Path:    	   lib/screens/main/other/refer_friend_screen.dart
// Author:       Ali Akbar
// Date:        21-08-24 00:06:18 -- Wednesday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class ReferFriendScreen extends StatefulWidget {
  const ReferFriendScreen({super.key});

  @override
  State<ReferFriendScreen> createState() => _ReferFriendScreenState();
}

class _ReferFriendScreenState extends State<ReferFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Refer Friend"),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
        child: Column(
          children: [
            CustomContainer(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              color: const Color(0xFFF8F8F8),
              borderRadius: const BorderRadius.all(Radius.circular(28)),
              child: Column(
                children: [
                  const PrimaryTitleText(
                    "Refer Friends, get reward",
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  gapH6,
                  const PrimaryText("Share your referral link"),
                  gapH40,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: const Color(0xFFDBD9D9)),
                    ),
                    child: const PrimaryText(
                      "muhammadhassan.com/concierge",
                      size: 14,
                    ),
                  ),
                  gapH20,
                  CustomButton(
                    title: "Copy",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
