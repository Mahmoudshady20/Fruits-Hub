import 'package:commerce/core/services/services_locator/locator_setup.dart';
import 'package:commerce/feature/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/signup_view_body_consumer.dart';
import 'package:commerce/shared/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'signUp';

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'حساب جديد'),
        body: SignupViewBodyConsumer(),
      ),
    );
  }
}
