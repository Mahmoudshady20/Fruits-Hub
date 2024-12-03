import 'package:commerce/feature/auth_feature/presentation/widget/sign_up_body.dart';
import 'package:commerce/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'signUp';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'حساب جديد'),
      body: SignUpBody(),
    );
  }
}
