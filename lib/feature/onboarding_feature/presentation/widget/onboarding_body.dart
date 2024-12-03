import 'package:commerce/core/local_db/shared_pref/shared_pref.dart';
import 'package:commerce/feature/auth_feature/presentation/views/login_view.dart';
import 'package:commerce/feature/onboarding_feature/presentation/widget/onboarding_page_view.dart';
import 'package:commerce/shared/widget/custom_button.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnboardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: Constants.primaryColor,
            color: currentIndex == 0
                ? Constants.primaryColor.withOpacity(.5)
                : Constants.primaryColor,
            activeSize: Size(11, 11),
          ),
          position: currentIndex,
        ),
        const SizedBox(
          height: 24,
        ),
        Visibility(
          visible: currentIndex == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: CustomButton(
              onPressed: () async {
                await SharedPref.setBool(Constants.appIsOpened, true);

                Navigator.pushReplacementNamed(
                  context,
                  LoginView.routeName,
                );
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    );
  }
}
