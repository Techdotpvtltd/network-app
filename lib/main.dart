// Project: 	   concierge_networking
// File:    	   main
// Path:    	   lib/main.dart
// Author:       Ali Akbar
// Date:        19-08-24 12:26:24 -- Monday
// Description:

import 'package:concierge_networking/screens/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
