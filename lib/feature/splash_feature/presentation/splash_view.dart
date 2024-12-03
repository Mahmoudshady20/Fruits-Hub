import 'package:commerce/core/local_db/shared_pref/shared_pref.dart';
import 'package:commerce/feature/auth_feature/presentation/views/login_view.dart';
import 'package:commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../onboarding_feature/presentation/onboarding_view.dart';
import 'widget/splash_body.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splashView';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // TODO: implement initState
    executeNavigation();
    super.initState();
  }

  void executeNavigation() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (mounted) {
      if (!SharedPref.getBool(Constants.appIsOpened)) {
        Navigator.pushReplacementNamed(
          context,
          OnboardingView.routeName,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          LoginView.routeName,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SplashBody(),
    );
  }
}
