import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/local_db/shared_pref/shared_pref.dart';
import '../../../../shared/constants.dart';
import '../../../auth_feature/presentation/views/login_view.dart';

class OnboardingPageItem extends StatelessWidget {
  const OnboardingPageItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.backGroundImage,
      required this.fruitImage,
      required this.visible});
  final Widget title;
  final String subTitle, backGroundImage, fruitImage;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backGroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  fruitImage,
                ),
              ),
              SafeArea(
                child: Visibility(
                  visible: visible,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: InkWell(
                      onTap: () async {
                        await SharedPref.setBool(Constants.appIsOpened, true);

                        Navigator.pushReplacementNamed(
                          context,
                          LoginView.routeName,
                        );
                      },
                      child: Text(
                        'تخط',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Color(0xFF949D9E),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: Text(
            subTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
