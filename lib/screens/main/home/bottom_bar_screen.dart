// Project: 	   friendzoned
// File:    	   bottom_bar_screen
// Path:    	   lib/screens/main/home/bottom_bar_screen.dart
// Author:       Ali Akbar
// Date:        12-08-24 11:29:26 -- Monday
// Description:

import 'package:concierge_networking/screens/main/booking/booking_screen.dart';
import 'package:concierge_networking/screens/main/chat/chat_screen.dart';
import 'package:concierge_networking/screens/main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/bottom_bar_item_model.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/constants/constants.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController = ScrollController();

  int selectedIndex = 0;
  late final List<NaviItemModel> items = [
    NaviItemModel(
      title: "Home",
      icon: AppAssets.homeIcon,
      child: const SizedBox(),
    ),
    NaviItemModel(
      title: "History",
      icon: AppAssets.historyIcon,
      child: const SizedBox(),
    ),
    NaviItemModel(
      title: "Chat",
      icon: AppAssets.chatIcon,
      child: const SizedBox(),
    ),
    NaviItemModel(
      title: "Profile",
      icon: AppAssets.profileIcon,
      child: const SizedBox(),
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: items.length, vsync: this);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      barColor: AppTheme.primaryColor1,
      barAlignment: Alignment.bottomCenter,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      offset: 0,
      width: SCREEN_WIDTH,
      child: TabBar(
        controller: tabController,
        padding:
            const EdgeInsets.only(left: 30, bottom: 22, top: 22, right: 20),
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.fill,
        labelPadding: EdgeInsets.zero,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        tabs: [
          for (int index = 0; index < items.length; index++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SvgPicture.asset(
                items[index].icon,
                colorFilter: ColorFilter.mode(
                  selectedIndex == index
                      ? Colors.white
                      : const Color(0xFFF9BBBD),
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
      body: (context, scrollController) {
        if (selectedIndex == 0) {
          return HomeScreen(scrollController: scrollController);
        }

        if (selectedIndex == 1) {
          return BookingScreen(
              scrollController: scrollController, isShowBackButton: false);
        }

        if (selectedIndex == 2) {
          return ChatScreen(
              scrollController: scrollController, isShowBackButton: false);
        }
        return items[selectedIndex].child;
      },
    );
  }
}
