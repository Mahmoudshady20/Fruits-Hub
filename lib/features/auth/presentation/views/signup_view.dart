import 'package:commerce/core/services/get_it_service.dart';
import 'package:commerce/core/widgets/custom_app_bar.dart';
import 'package:commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:commerce/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
