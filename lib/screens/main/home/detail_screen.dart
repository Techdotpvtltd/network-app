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
import 'package:concierge_networking/models/category_model.dart';
import 'package:concierge_networking/models/service_model.dart';
import 'package:concierge_networking/screens/main/chat/chat_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:concierge_networking/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_network_image.dart';
import '../../../utils/constants/app_theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key, required this.service, required this.category});
  final ServiceModel service;
  final CategoryModel category;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController pageController = PageController();
  late final ServiceModel service = widget.service;
  int currentPage = 0;
  late final items = service.images;

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
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PrimaryTitleText(
                                      service.title,
                                      size: 20,
                                      weight: FontWeight.w600,
                                    ),
                                    PrimaryText(
                                      widget.category.title.firstCapitalize(),
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
                          PrimaryText(
                            service.description,
                            size: 12,
                            color: const Color(0xFF949494),
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
