// Project: 	   concierge_networking
// File:    	   home_screen
// Path:    	   lib/screens/main/home/home_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 17:53:34 -- Monday
// Description:

import 'package:concierge_networking/blocs/data_fetcher/data_fetcher_bloc.dart';
import 'package:concierge_networking/blocs/data_fetcher/data_fetcher_state.dart';
import 'package:concierge_networking/blocs/drawer/drawer_cubit.dart';
import 'package:concierge_networking/components/circle_button.dart';
import 'package:concierge_networking/components/custom_button.dart';
import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/components/custom_title_textfield.dart';
import 'package:concierge_networking/manager/cache/category_cache.dart';
import 'package:concierge_networking/manager/cache/post_cache.dart';
import 'package:concierge_networking/models/category_model.dart';
import 'package:concierge_networking/models/post_model.dart';
import 'package:concierge_networking/screens/main/chat/chat_screen.dart';
import 'package:concierge_networking/screens/main/components/content_widget.dart';
import 'package:concierge_networking/screens/main/components/gradient_image_widget.dart';
import 'package:concierge_networking/screens/main/components/home_heading_widget.dart';
import 'package:concierge_networking/screens/main/home/category_screen.dart';
import 'package:concierge_networking/screens/main/profile/profile_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:concierge_networking/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../blocs/user/user_state.dart';
import '../../../components/avatar_widget.dart';
import '../../../components/custom_ink_well.dart';
import '../../../components/text_widget.dart';
import '../../../manager/app_manager.dart';
import '../../../models/user_model.dart';
import '../../../utils/constants/app_theme.dart';
import '../../../utils/dialogs/snack_bar.dart';
import 'services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user = AppManager.currentUser;
  bool isLoading = false;

  List<CategoryModel> categories = CategoryCache().categories.take(6).toList();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DataFetcherBloc, DataFetcherState>(
          listener: (ctx, state) {
            if (state is DataFetcherStateFetching ||
                state is DataFetcherStateFetchFailure ||
                state is DataFetcherStateFetched) {
              setState(() {
                isLoading = state.isLoading;
              });
              if (state is DataFetcherStateFetched) {
                setState(() {
                  categories = CategoryCache().categories.take(6).toList();
                });
              }
            }
          },
        ),

        /// UserBloc
        BlocListener<UserBloc, UserState>(
          listener: (ctx, state) {
            if (state is UserStateProfileUpdated) {
              setState(() {
                user = state.user;
              });
              CustomSnack.success("Update", "Profile Updated");
            }
          },
        )
      ],
      child: Scaffold(
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
              child: AvatarWidget(
                width: 45,
                height: 45,
                avatarUrl: user?.avatar,
                placeholderChar: user?.firstName?.characters.firstOrNull ?? "U",
              ),
            ),
          ),
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (user?.firstName != null)
                Text(
                  "Hello, ${user?.firstName}",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.primaryColor1,
                  ),
                ),
              if (user?.firstName != null) gapH4,
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
              isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Widgets
                        if (categories.isNotEmpty)
                          HomeHeadingWidget(
                            title: "Services Categories",
                            onPressedAll: () {
                              NavigationService.go(const CategoryScreen());
                            },
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categories.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 4,
                              ),
                              itemBuilder: (ctx, index) {
                                final category = categories[index];
                                return GradientImageWidget(
                                  onPressed: () {
                                    NavigationService.go(
                                        ServicesScreen(category: category));
                                  },
                                  coverUrl: category.cover,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 8),
                                      child: PrimaryText(
                                        category.title.firstCapitalize(),
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
                        if (categories.isNotEmpty) gapH22,
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
                                      // NavigationService.go(
                                      //      DetailScreen(service: service));
                                    },
                                    width: 180,
                                    coverUrl:
                                        "https://elite-cv.com/wp-content/uploads/2021/08/consultant.jpg",
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                        _NewsAndAnnouncement(
                            PostCache().posts.take(5).toList()),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===========================News & Anouncement================================

class _NewsAndAnnouncement extends StatelessWidget {
  const _NewsAndAnnouncement(this.posts);
  final List<PostModel> posts;
  @override
  Widget build(BuildContext context) {
    return HomeHeadingWidget(
      title: "News or Announcements",
      child: SizedBox(
        width: SCREEN_WIDTH,
        height: 141,
        child: ListView.builder(
          itemCount: posts.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final post = posts[index];
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ContentWidget(
                height: 203,
                width: SCREEN_WIDTH * 0.8,
                coverUrl: post.coverUrl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      post.title,
                      size: 14,
                      weight: FontWeight.w600,
                      color: Colors.white,
                      maxLines: 2,
                    ),
                    PrimaryText(
                      post.description,
                      size: 8,
                      weight: FontWeight.w500,
                      color: Colors.white,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
