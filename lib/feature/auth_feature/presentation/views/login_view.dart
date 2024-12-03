import 'package:commerce/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تسجيل دخول'),
      body: LoginViewBody(),
    );
  }
}
