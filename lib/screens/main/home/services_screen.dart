// Project: 	   concierge_networking
// File:    	   services_screen
// Path:    	   lib/screens/main/home/services_screen.dart
// Author:       Ali Akbar
// Date:        01-10-24 17:40:43 -- Tuesday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_title_textfield.dart';
import '../../../components/text_widget.dart';
import '../../../utils/extensions/navigation_service.dart';
import '../components/content_widget.dart';
import 'detail_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Services"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Column(
          children: [
            const SearchTextField(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 18),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ContentWidget(
                      height: 160,
                      onPressed: () {
                        NavigationService.go(const DetailScreen());
                      },
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
            )
          ],
        ),
      ),
    );
  }
}
