import 'package:commerce/generated/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Spacer(),
            SvgPicture.asset(
              AssetsImages.imagesPlant,
            ),
          ],
        ),
        SvgPicture.asset(
          AssetsImages.imagesLogo,
        ),
        SvgPicture.asset(
          AssetsImages.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
