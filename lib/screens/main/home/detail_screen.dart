// Project: 	   concierge_networking
// File:    	   detail_screen
// Path:    	   lib/screens/main/home/detail_screen.dart
// Author:       Ali Akbar
// Date:        20-08-24 16:11:36 -- Tuesday
// Description:

import 'package:concierge_networking/components/circle_button.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/components/custom_ink_well.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/main/chat/chat_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_network_image.dart';
import '../../../utils/constants/app_theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController pageController = PageController();

  int currentPage = 0;
  final items = [
    "https://economics.illinois.edu/sites/default/files/inline-images/consultant_orig.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA4B0Q9Q1msih1rId8mjzXUQLw-iwYGpWRQQ&s",
    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/05/Business.jpeg.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Image Statcks
          Positioned(
            child: Stack(
              children: [
                SizedBox(
                  height: SCREEN_HEIGHT * 0.46,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    children: [
                      for (int i = 0; i < items.length; i++)
                        Stack(
                          children: [
                            Positioned.fill(
                              child: CustomNetworkImage(
                                imageUrl: items[currentPage],
                              ),
                            ),
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
                          ],
                        )
                    ],
                  ),
                ),

                /// SmoothDots
                Positioned.fill(
                  bottom: 80,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: items.length,
                      effect: WormEffect(
                        dotColor: Colors.white.withOpacity(0.2),
                        dotWidth: 8.8,
                        dotHeight: 8.8,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// App Bar
          customAppBar(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: SCREEN_HEIGHT * 0.388,
            child: CustomContainer(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(31),
                topRight: Radius.circular(31),
              ),
              child: Column(
                children: [
                  /// Image Widgets
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 21,
                        left: 33,
                        right: 26,
                      ),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomInkWell(
                          onTap: () {
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.linear,
                            );
                          },
                          child: Container(
                            width: 60,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: currentPage == index
                                    ? AppTheme.primaryColor1
                                    : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: CustomNetworkImage(imageUrl: items[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 23,
                        left: 37,
                        right: 30,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title Widget
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PrimaryTitleText(
                                      "Pinnacle Advisors",
                                      size: 20,
                                      weight: FontWeight.w600,
                                    ),
                                    PrimaryText(
                                      "Consultant",
                                      color: AppTheme.primaryColor1,
                                      size: 12,
                                      weight: FontWeight.w600,
                                    )
                                  ],
                                ),
                              ),
                              CircleButton(
                                iconPath: AppAssets.chatIcon,
                                onPressed: () {
                                  NavigationService.go(const ChatScreen());
                                },
                                colorFilter: const ColorFilter.mode(
                                  AppTheme.primaryColor1,
                                  BlendMode.srcIn,
                                ),
                              )
                            ],
                          ),
                          gapH10,
                          const PrimaryText(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            size: 12,
                            color: Color(0xFF949494),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
