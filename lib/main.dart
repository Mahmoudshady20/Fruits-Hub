import 'package:commerce/core/local_db/shared_pref/shared_pref.dart';
import 'package:commerce/feature/auth_feature/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'feature/auth_feature/presentation/views/login_view.dart';
import 'feature/onboarding_feature/presentation/onboarding_view.dart';
import 'feature/splash_feature/presentation/splash_view.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'shared/my_theme/my_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        OnboardingView.routeName:(context)=>OnboardingView(),
        LoginView.routeName:(context)=>LoginView(),
        SignUpView.routeName:(context)=>SignUpView(),
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
