import 'package:commerce/feature/auth_feature/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signin_cubit/signin_state.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/login_view_body.dart';
import 'package:commerce/feature/home_feature/home_view.dart';
import 'package:commerce/shared/widget/custom_progress_hud.dart';
import 'package:commerce/shared/widget/error_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyConsumer extends StatelessWidget {
  const LoginViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SignInState>(
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SignInLoading ? true : false,
            child: LoginViewBody());
      },
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is SignInFailure) {
          showErrorBar(context, state.message);
        }
      },
    );
  }
}
