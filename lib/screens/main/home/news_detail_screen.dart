// Project: 	   concierge_networking
// File:    	   news_detail_screen
// Path:    	   lib/screens/main/home/news_detail_screen.dart
// Author:       Ali Akbar
// Date:        03-10-24 15:06:12 -- Thursday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_container.dart';
import '../../../components/custom_network_image.dart';
import '../../../components/text_widget.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/constants/constants.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.post});
  final PostModel post;
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  late final items = [widget.post.coverUrl];

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
                if (items.length > 1)
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          PrimaryTitleText(
                            widget.post.title,
                            size: 20,
                            weight: FontWeight.w600,
                          ),
                          gapH10,
                          PrimaryText(
                            widget.post.description,
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
