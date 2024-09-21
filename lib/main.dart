// Project: 	   concierge_networking
// File:    	   main
// Path:    	   lib/main.dart
// Author:       Ali Akbar
// Date:        19-08-24 12:26:24 -- Monday
// Description:

import 'package:concierge_networking/blocs/auth/auth_bloc.dart';
import 'package:concierge_networking/blocs/user/user_bloc.dart';
import 'package:concierge_networking/manager/app_bloc_observer.dart';
import 'package:concierge_networking/screens/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  //  1 - Ensure firebase app is initialized if starting from background/terminated state
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
