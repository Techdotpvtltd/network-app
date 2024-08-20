// Project: 	   concierge_networking
// File:    	   home_screen
// Path:    	   lib/screens/main/home/home_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 17:53:34 -- Monday
// Description:

import 'package:concierge_networking/blocs/drawer/drawer_cubit.dart';
import 'package:concierge_networking/components/circle_button.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/components/custom_title_textfield.dart';
import 'package:concierge_networking/screens/main/chat/chat_screen.dart';
import 'package:concierge_networking/screens/main/components/content_widget.dart';
import 'package:concierge_networking/screens/main/components/gradient_image_widget.dart';
import 'package:concierge_networking/screens/main/components/home_heading_widget.dart';
import 'package:concierge_networking/screens/main/home/detail_screen.dart';
import 'package:concierge_networking/screens/main/profile/profile_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/avatar_widget.dart';
import '../../../components/custom_ink_well.dart';
import '../../../components/text_widget.dart';
import '../../../utils/constants/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: CustomInkWell(
            semanticLabel: "Profile button",
            onTap: () {
              NavigationService.go(const ProfileScreen());
            },
            child: const AvatarWidget(
              width: 45,
              height: 45,
            ),
          ),
        ),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Hello, Ali Akbar!",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.primaryColor1,
              ),
            ),
            gapH4,
            const PrimaryTitleText(
              "Welcome back!",
              size: 14,
              weight: FontWeight.w600,
            ),
            gapH4,
          ],
        ),
        actions: [
          CircleButton(
            onPressed: () {},
            iconPath: AppAssets.notificationIcon,
          ),
          CircleButton(
            onPressed: () {
              context.read<DrawerCubit>().toggle();
            },
            iconPath: AppAssets.menuIcon,
          ),
          gapW20,
        ],
      ),
      body: SingleChildScrollView(
        controller: widget.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 21),
        child: Column(
          children: [
            /// Top Ads Card
            CustomContainer(
              color: AppTheme.primaryColor1,
              size: Size(SCREEN_WIDTH, 220),
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Positioned(
                    top: 31,
                    left: 27,
                    right: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PrimaryTitleText(
                          "Assisting You With Our\nBest Services",
                          size: 18,
                          color: Colors.white,
                        ),
                        gapH6,
                        const PrimaryText(
                          "We love to hear you. Feel free to chat with us for appointment",
                          size: 12,
                          color: Colors.white,
                        ),
                        gapH20,
                        CustomButton(
                          title: "Chat with us",
                          onPressed: () {
                            NavigationService.go(const ChatScreen());
                          },
                          backgroundColor: Colors.white,
                          textColor: AppTheme.primaryColor1,
                          isSmallText: true,
                          height: 49,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: -27,
                    child: Image.asset(AppAssets.demoGirl),
                  ),
                ],
              ),
            ),
            gapH16,
            const SearchTextField(),
            gapH22,
            HomeHeadingWidget(
              title: "Services Categories",
              onPressedAll: () {},
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (ctx, index) {
                  return const GradientImageWidget(
                    coverUrl:
                        "https://imageio.forbes.com/specials-images/imageserve/5e56f223d378190007f46149/A-management-consulting-career--How-to-build-a-career-as-a-management-consultant-/960x0.jpg?format=jpg&width=960",
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                        child: PrimaryText(
                          "Category",
                          align: TextAlign.center,
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.white,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            gapH22,
            HomeHeadingWidget(
              title: "Popular Service",
              onPressedAll: () {},
              child: SizedBox(
                width: SCREEN_WIDTH,
                height: 190,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ContentWidget(
                        onPressed: () {
                          NavigationService.go(const DetailScreen());
                        },
                        width: 180,
                        coverUrl:
                            "https://elite-cv.com/wp-content/uploads/2021/08/consultant.jpg",
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              "Category",
                              size: 14,
                              weight: FontWeight.w600,
                              color: Colors.white,
                              maxLines: 2,
                            ),
                            PrimaryText(
                              "Providing deep analysis and actionable insights to help businesses.",
                              size: 8,
                              weight: FontWeight.w400,
                              color: Colors.white,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            gapH22,
            HomeHeadingWidget(
              title: "News or Announcements",
              child: SizedBox(
                width: SCREEN_WIDTH,
                height: 141,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ContentWidget(
                        width: SCREEN_WIDTH * 0.61,
                        coverUrl:
                            "https://www.huntersure.com/wp-content/uploads/2020/06/Consultants.jpg",
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              "Category",
                              size: 14,
                              weight: FontWeight.w600,
                              color: Colors.white,
                              maxLines: 2,
                            ),
                            PrimaryText(
                              "Providing deep analysis and actionable insights to help businesses.",
                              size: 8,
                              weight: FontWeight.w500,
                              color: Colors.white,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
