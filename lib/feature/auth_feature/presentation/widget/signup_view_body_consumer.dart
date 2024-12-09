import 'package:commerce/feature/auth_feature/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signup_cubit/signup_state.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/sign_up_body.dart';
import 'package:commerce/feature/home_feature/home_view.dart';
import 'package:commerce/shared/widget/custom_progress_hud.dart';
import 'package:commerce/shared/widget/error_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBodyConsumer extends StatelessWidget {
  const SignupViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignUpState>(
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SignUpLoading ? true : false,
            child: SignUpBody());
      },
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is SignUpFailure) {
          showErrorBar(context, state.message);
        }
      },
    );
  }
}
