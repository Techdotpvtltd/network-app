// Project: 	   concierge_networking
// File:    	   booking_screen
// Path:    	   lib/screens/main/booking/booking_screen.dart
// Author:       Ali Akbar
// Date:        20-08-24 17:09:41 -- Tuesday
// Description:

import 'package:concierge_networking/components/custom_app_bar.dart';
import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/main/components/booking_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, this.scrollController});
  final ScrollController? scrollController;
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int currentPage = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Bookings",
        showBack: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 22,
          left: 22,
        ),
        child: Column(
          children: [
            /// Top Tabbar
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: const Color(0xFFEDE6E6)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomContainer(
                      onPressed: () {
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linear);
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 13,
                      ),
                      color: currentPage == 0
                          ? const Color(0xFF444444)
                          : Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Center(
                        child: PrimaryText(
                          "On Goings Bookings",
                          color: currentPage == 0
                              ? Colors.white
                              : const Color(0xFF8C8C8C),
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.linear);
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 13,
                      ),
                      color: currentPage == 1
                          ? const Color(0xFF444444)
                          : Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Center(
                        child: PrimaryText(
                          "Previous Bookings",
                          color: currentPage == 1
                              ? Colors.white
                              : const Color(0xFF8C8C8C),
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gapH6,
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: [
                  _List(widget.scrollController),
                  _List(widget.scrollController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _List extends StatefulWidget {
  const _List(this.scrollController);
  final ScrollController? scrollController;
  @override
  State<_List> createState() => __ListState();
}

class __ListState extends State<_List> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      itemCount: 5,
      controller: widget.scrollController,
      itemBuilder: (ctx, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: BookingWidget(),
        );
      },
    );
  }
}
