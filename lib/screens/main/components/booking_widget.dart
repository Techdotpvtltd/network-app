// Project: 	   concierge_networking
// File:    	   booking_widget
// Path:    	   lib/screens/main/components/booking_widget.dart
// Author:       Ali Akbar
// Date:        20-08-24 17:40:12 -- Tuesday
// Description:

import 'package:concierge_networking/components/custom_container.dart';
import 'package:concierge_networking/components/text_widget.dart';
import 'package:concierge_networking/screens/main/components/gradient_image_widget.dart';
import 'package:concierge_networking/utils/constants/app_theme.dart';
import 'package:concierge_networking/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: const Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          SizedBox(
            width: SCREEN_WIDTH,
            height: 145,
            child: const GradientImageWidget(
              coverUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLKGL5FCVs-qbg-9xrJgSn4MVvABmab8N1iw&s",
              radius: 0,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 12),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            "Clarity Advisor",
                            maxLines: 2,
                            textOverflow: TextOverflow.ellipsis,
                            color: AppTheme.titleColor1,
                            weight: FontWeight.w600,
                          ),
                          gapH6,
                          PrimaryText(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.",
                            maxLines: 2,
                            textOverflow: TextOverflow.ellipsis,
                            color: Color(0xFF949494),
                            size: 8,
                          ),
                        ],
                      ),
                    ),
                    PrimaryText(
                      "\$100",
                      color: AppTheme.primaryColor1,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                gapH4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Appointment Time: ",
                        style: GoogleFonts.inter(
                          fontSize: 8,
                          color: AppTheme.primaryColor1,
                        ),
                        children: [
                          TextSpan(
                            text: "9:00 AM 23 Aug 2023",
                            style: GoogleFonts.inter(
                              color: AppTheme.titleColor1,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomContainer(
                      color: Color(0xFFE3E3E3),
                      padding:
                          EdgeInsets.symmetric(horizontal: 31, vertical: 5),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: SubtitleText(
                        "Paid",
                        color: AppTheme.titleColor1,
                        size: 10,
                        weight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
