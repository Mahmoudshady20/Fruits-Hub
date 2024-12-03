import 'package:commerce/feature/onboarding_feature/presentation/widget/onboarding_page_item.dart';
import 'package:commerce/generated/assets_images.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnboardingPageItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'HUB',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Color(0xFFF4A91F),
                ),
              ),
              Text(
                'Fruit',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          backGroundImage: AssetsImages.imagesBoarding1background,
          fruitImage: AssetsImages.imagesFruit1boarding,
          visible: true,
        ),
        OnboardingPageItem(
          title: Text(
            'ابحث وتسوق',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          backGroundImage: AssetsImages.imagesBoarding2background,
          fruitImage: AssetsImages.imagesFruit2boarding,
          visible: false,
        ),
      ],
    );
  }
}
