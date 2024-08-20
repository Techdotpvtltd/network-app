// Project: 	   friendzoned
// File:    	   drawer_screen
// Path:    	   lib/screens/main/home/drawer_screen.dart
// Author:       Ali Akbar
// Date:        12-08-24 12:22:21 -- Monday
// Description:

import 'package:concierge_networking/components/circle_button.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/screens/main/booking/booking_screen.dart';
import 'package:concierge_networking/screens/main/chat/chat_screen.dart';
import 'package:concierge_networking/screens/main/home/bottom_bar_screen.dart';
import 'package:concierge_networking/screens/main/other/subscription_screen.dart';
import 'package:concierge_networking/screens/main/other/support_screen.dart';
import 'package:concierge_networking/screens/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../blocs/drawer/drawer_cubit.dart';
import '../../../blocs/drawer/drawer_state.dart';
import '../../../components/avatar_widget.dart';
import '../../../components/custom_ink_well.dart';
import '../../../components/custom_paddings.dart';
import '../../../components/text_widget.dart';
import '../../../screens/onboarding/forgot_screen.dart';
import '../../../screens/onboarding/splash_screen.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/extensions/navigation_service.dart';

import '../../../models/bottom_bar_item_model.dart';

final List<NaviItemModel> items = [
  NaviItemModel(
    title: "Home",
    icon: AppAssets.homeIcon,
    child: const SizedBox(),
  ),
  NaviItemModel(
    title: "Chat",
    icon: AppAssets.chatIcon,
    child: const ChatScreen(),
  ),
  NaviItemModel(
    title: "Subscription",
    icon: AppAssets.subscriptionIcon,
    child: const SubscriptionScreen(),
  ),
  NaviItemModel(
    title: "Bookings",
    icon: AppAssets.bookingIcon,
    child: const BookingScreen(),
  ),
  NaviItemModel(
    title: "Change password",
    icon: AppAssets.lockIcon,
    child: const ForgotScreen(),
  ),
  NaviItemModel(
    title: "Support",
    icon: AppAssets.phoneIcon,
    child: const SupportScreen(),
  ),
];

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrawerCubit>(
      create: (_) => DrawerCubit(),
      child: BlocBuilder<DrawerCubit, DrawerCubitState>(
        builder: (ctx, state) {
          final cubit = ctx.read<DrawerCubit>();

          return BlocListener<DrawerCubit, DrawerCubitState>(
            listener: (context, state) {
              if (state is DrawerStateVisibilityStatus) {
                debugPrint(state.isOpened.toString());
                setState(() {});
              }

              if (state is DrawerStateSelectItem) {
                if (state.index == 0) {
                  return;
                }

                NavigationService.go(items[state.index].child);
              }
            },
            child: ZoomDrawer(
              controller: cubit.controller,
              disableDragGesture: true,
              menuScreen: const _DrawerMenu(),
              menuScreenWidth: SCREEN_WIDTH,
              clipMainScreen: true,
              slideWidth: 300,
              mainScreenScale: 0.4,
              mainScreen: const BottomBarScreen(),
              angle: 5.19,
              menuBackgroundColor: AppTheme.primaryColor1,
              mainScreenTapClose: true,
              style: DrawerStyle.defaultStyle,
            ),
          );
        },
      ),
    );
  }
}

class _DrawerMenu extends StatefulWidget {
  const _DrawerMenu();
  @override
  State<_DrawerMenu> createState() => __DrawerMenuState();
}

class __DrawerMenuState extends State<_DrawerMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor1,
      body: SafeArea(
        child: Container(
          color: AppTheme.primaryColor1,
          child: CustomPadding(
            top: 5,
            left: 40,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Navigation bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleButton(
                      onPressed: () {
                        context.read<DrawerCubit>().closeDrawer();
                      },
                      backgroundColor: Colors.black.withOpacity(0.08),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Image.asset(
                      AppAssets.logoIcon,
                      width: 90,
                      color: Colors.white,
                    )
                  ],
                ),

                gapH50,

                /// Avatar
                CustomInkWell(
                  semanticLabel: "Profile View Button",
                  onTap: () {
                    NavigationService.go(const ProfileScreen());
                  },
                  child: Container(
                    height: 76,
                    width: 76,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const AvatarWidget(backgroundColor: Colors.black),
                  ),
                ),
                gapH6,
                const PrimaryTitleText(
                  "Ali Akbar",
                  maxLines: 2,
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.w700,
                ),

                /// Items
                gapH30,
                for (int index = 0; index < items.length; index++)
                  Builder(builder: (_) {
                    final item = items[index];
                    final bool isSelected = index == selectedIndex;

                    return CustomContainer(
                      onPressed: () {
                        context.read<DrawerCubit>().closeDrawer();
                        context.read<DrawerCubit>().onMenuItemClicked(index);
                      },
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      padding: const EdgeInsets.only(
                        left: 18,
                        top: 14,
                        bottom: 14,
                        right: 30,
                      ),
                      color: isSelected ? Colors.white : Colors.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            item.icon,
                            width: 15,
                            height: 15,
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? AppTheme.primaryColor1
                                  : Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          gapW10,
                          Flexible(
                            child: PrimaryTitleText(
                              item.title,
                              size: 14,
                              color: isSelected
                                  ? AppTheme.primaryColor1
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                // Logout Button
                const Spacer(),
                CustomButton(
                  backgroundColor: Colors.black,
                  title: "Logout",
                  onPressed: () {
                    NavigationService.offAll(const SplashScreen());
                  },
                  isSmallText: true,
                ),
                gapH20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
