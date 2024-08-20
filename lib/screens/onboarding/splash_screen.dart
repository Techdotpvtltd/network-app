// Project: 	   concierge_networking
// File:    	   splash_screen
// Path:    	   lib/screens/onboarding/splash_screen.dart
// Author:       Ali Akbar
// Date:        19-08-24 12:28:43 -- Monday
// Description:

import 'package:concierge_networking/screens/onboarding/get_started_screen.dart';
import 'package:concierge_networking/utils/constants/app_assets.dart';
import 'package:concierge_networking/utils/extensions/navigation_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 500));
    NavigationService.offAll(const GetStartedScreen());
  }

  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppAssets.logoIcon,
                width: 206,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppAssets.splashBackgroundIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
