// Project: 	   concierge_networking
// File:    	   profile_screen
// Path:    	   lib/screens/main/profile/profile_screen.dart
// Author:       Ali Akbar
// Date:        20-08-24 21:49:31 -- Tuesday
// Description:

import 'package:concierge_networking/components/avatar_widget.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_ink_well.dart';
import 'package:concierge_networking/components/custom_scaffold.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/main/booking/booking_screen.dart';
import 'package:concierge_networking/screens/main/other/agreement_screen.dart';
import 'package:concierge_networking/screens/main/other/refer_friend_screen.dart';
import 'package:concierge_networking/screens/main/other/subscription_screen.dart';
import 'package:concierge_networking/screens/main/other/support_screen.dart';
import 'package:concierge_networking/screens/main/profile/edit_profile.dart';
import 'package:concierge_networking/screens/onboarding/forgot_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/date_extension.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../blocs/user/user_state.dart';
import '../../../manager/app_manager.dart';
import '../../../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key, this.scrollController, this.isShowBackButton = true});
  final ScrollController? scrollController;
  final bool isShowBackButton;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user = AppManager.currentUser;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// UserBloc
        BlocListener<UserBloc, UserState>(
          listener: (ctx, state) {
            if (state is UserStateProfileUpdated) {
              setState(() {
                user = state.user;
              });
            }
          },
        )
      ],
      child: CustomScaffold(
        backgroundImagePath: AppAssets.scaffoldBG2,
        appBar:
            customAppBar(title: "Profile", showBack: widget.isShowBackButton),
        body: SizedBox(
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: widget.scrollController,
            padding:
                const EdgeInsets.only(left: 27, right: 27, top: 16, bottom: 40),
            child: Column(
              children: [
                AvatarWidget(
                  width: 102,
                  height: 102,
                  avatarUrl: user?.avatar,
                  placeholderChar:
                      user?.firstName?.characters.firstOrNull ?? "U",
                ),
                gapH10,
                if (user?.firstName != null || user?.lastName != null)
                  PrimaryTitleText(
                    "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                    size: 14,
                  ),
                PrimaryTitleText(
                  user?.email ?? "-",
                  size: 12,
                  weight: FontWeight.w400,
                ),
                gapH26,

                /// Detail Card
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const PrimaryText(
                                "Date of Birth:",
                                color: Color(0xFF444444),
                              ),
                              PrimaryText(
                                user?.dateOfBirth
                                        ?.dateToString("dd MMMM yyyy") ??
                                    "-",
                                weight: FontWeight.w500,
                                color: const Color(0xFF444444),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const PrimaryText(
                                "Number:",
                                color: Color(0xFF444444),
                              ),
                              PrimaryText(
                                user?.phone ?? "-",
                                weight: FontWeight.w500,
                                color: const Color(0xFF444444),
                              ),
                            ],
                          ),
                        ],
                      ),
                      gapH16,
                      CustomButton(
                        title: "Edit Profile",
                        onPressed: () {
                          NavigationService.go(const EditProfile());
                        },
                        isSmallText: true,
                        height: 39,
                        backgroundColor: const Color(0xFF444444),
                      )
                    ],
                  ),
                ),
                gapH26,
                _ButtonWidget(
                  "Bookings",
                  iconPath: AppAssets.backupIcon,
                  onPressed: () {
                    NavigationService.go(
                        const BookingScreen(isShowBackButton: true));
                  },
                ),
                gapH16,
                _ButtonWidget(
                  "Change password",
                  iconPath: AppAssets.lockIcon,
                  onPressed: () {
                    NavigationService.go(const ForgotScreen());
                  },
                ),
                gapH16,
                _ButtonWidget(
                  "Support",
                  iconPath: AppAssets.phoneIcon,
                  onPressed: () {
                    NavigationService.go(const SupportScreen());
                  },
                ),
                gapH16,
                _ButtonWidget(
                  "Subscription",
                  iconPath: AppAssets.subscriptionIcon,
                  onPressed: () {
                    NavigationService.go(const SubscriptionScreen());
                  },
                ),
                gapH16,
                _ButtonWidget(
                  "Privacy policy",
                  iconPath: AppAssets.privacyIcon,
                  onPressed: () {
                    NavigationService.go(
                        const AgreementScreen(isPrivacy: true));
                  },
                ),
                gapH16,
                _ButtonWidget(
                  "Terms  & Conditions",
                  iconPath: AppAssets.noteIcon,
                  onPressed: () {
                    NavigationService.go(
                        const AgreementScreen(isPrivacy: false));
                  },
                ),
                gapH16,
                _ButtonWidget(
                  "Refer Friends",
                  iconPath: AppAssets.chainIcon,
                  onPressed: () {
                    NavigationService.go(const ReferFriendScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget(this.title,
      {required this.iconPath, required this.onPressed});
  final String title;
  final String iconPath;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDADADA)),
          borderRadius: BorderRadius.circular(54),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF444444), BlendMode.srcIn),
              width: 19,
              height: 19,
            ),
            gapW20,
            PrimaryText(
              title,
              color: const Color(0xFF282727),
              weight: FontWeight.w500,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
