import 'package:commerce/core/local_db/shared_pref/shared_pref.dart';
import 'package:commerce/core/services/services_locator/locator_setup.dart';
import 'package:commerce/feature/auth_feature/presentation/views/sign_up_view.dart';
import 'package:commerce/feature/home_feature/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'feature/auth_feature/presentation/views/login_view.dart';
import 'feature/onboarding_feature/presentation/onboarding_view.dart';
import 'feature/splash_feature/presentation/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'shared/my_theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        OnboardingView.routeName: (context) => OnboardingView(),
        LoginView.routeName: (context) => LoginView(),
        SignUpView.routeName: (context) => SignUpView(),
        HomeView.routeName: (context) => HomeView(),
      },
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: MyThemeData.myTheme,
      locale: Locale('ar'),
    );
  }
}
