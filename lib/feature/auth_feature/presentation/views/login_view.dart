import 'package:commerce/core/services/services_locator/locator_setup.dart';
import 'package:commerce/feature/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/login_view_body_consumer.dart';
import 'package:commerce/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'تسجيل دخول'),
        body: LoginViewBodyConsumer(),
      ),
    );
  }
}
