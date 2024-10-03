// Project: 	   concierge_networking
// File:    	   news_and_announcement_screen
// Path:    	   lib/screens/main/home/news_and_announcement_screen.dart
// Author:       Ali Akbar
// Date:        03-10-24 14:11:09 -- Thursday
// Description:

import 'package:concierge_networking/blocs/post/post_bloc.dart';
import 'package:concierge_networking/blocs/post/post_event.dart';
import 'package:concierge_networking/blocs/post/post_state.dart';
import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_list_builder.dart';
import 'package:concierge_networking/components/custom_title_textfield.dart';
import 'package:concierge_networking/manager/cache/post_cache.dart';
import 'package:concierge_networking/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/text_widget.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/extensions/navigation_service.dart';
import '../components/content_widget.dart';
import 'news_detail_screen.dart';

class NewsAndAnnouncementsScreen extends StatefulWidget {
  const NewsAndAnnouncementsScreen({super.key});

  @override
  State<NewsAndAnnouncementsScreen> createState() =>
      _NewsAndAnnouncementsScreenState();
}

class _NewsAndAnnouncementsScreenState
    extends State<NewsAndAnnouncementsScreen> {
  List<PostModel> posts = PostCache().posts;
  bool isLoading = false;

  void triggerFetchPostsEvent() {
    context.read<PostBloc>().add(PostEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        if (state is PostStateFetching ||
            state is PostStateFetched ||
            state is PostStateFetchFailure) {
          isLoading = state.isLoading;

          if (state is PostStateFetched) {
            posts = PostCache().posts;
          }

          setState(() {});
        }
      },
      child: Scaffold(
        appBar: customAppBar(title: "News & Announcements"),
        body: SafeArea(
          bottom: false,
          minimum: const EdgeInsets.only(left: 22, right: 22, top: 21),
          child: Column(
            children: [
              const SearchTextField(
                hintText: "Search News & Announcements",
              ),
              gapH6,
              Expanded(
                child: CustomListBuilder(
                  itemCount: posts.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  onReachEnd: () {
                    triggerFetchPostsEvent();
                  },
                  itemBuilder: (_, index) {
                    final post = posts[index];
                    return ContentWidget(
                      height: 203,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      onPressed: () {
                        NavigationService.go(NewsDetailScreen(post: post));
                      },
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
                    );
                  },
                ),
              ),
              if (isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
