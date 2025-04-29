import 'package:commerce/core/widgets/custom_app_bar.dart';
import 'package:commerce/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: const BestSellingViewBody(),
    );
  }
}
