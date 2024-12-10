import 'package:commerce/core/helper_function/validations_regex.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:commerce/feature/auth_feature/presentation/views/sign_up_view.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/custom_divider.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/forget_password.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/social_button.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/switch_page.dart';
import 'package:commerce/generated/assets_images.dart';
import 'package:commerce/shared/widget/custom_button.dart';
import 'package:commerce/shared/widget/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool isPassword;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isPassword = true;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomFormField(
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your Email';
                  }
                  if (!ValidationRegex.emailRegex(value)) {
                    return 'Please enter Valid Email';
                  }
                  return null;
                },
                hint: 'البريد الإلكتروني',
              ),
              SizedBox(
                height: 16,
              ),
              CustomFormField(
                textInputType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your Password';
                  }
                  if (!ValidationRegex.passwordRegex(value)) {
                    return 'Please enter Valid Password';
                  }
                  return null;
                },
                hint: 'كلمة المرور',
                isPassword: isPassword,
                suffix: IconButton(
                  onPressed: () {
                    isPassword = !isPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    isPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ForgetPassword(
                onTap: () {},
              ),
              SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await context.read<SigninCubit>().loginWithEmailAndPassword(
                        emailController.text, passwordController.text);
                  } else {
                    return;
                  }
                },
                text: 'تسجيل دخول',
              ),
              SizedBox(
                height: 33,
              ),
              SwitchPage(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    SignUpView.routeName,
                  );
                },
                text1: 'لا تمتلك حساب؟',
                text2: 'قم بإنشاء حساب',
              ),
              SizedBox(
                height: 33,
              ),
              CustomDivider(),
              SizedBox(
                height: 21,
              ),
              SocialLoginButton(
                  image: AssetsImages.imagesGoogle,
                  title: 'تسجيل بواسطة جوجل',
                  onPressed: () async {
                    await context.read<SigninCubit>().signinWithGoogle();
                  }),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: AssetsImages.imagesApple,
                  title: 'تسجيل بواسطة أبل',
                  onPressed: () {}),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: AssetsImages.imagesFacebook,
                  title: 'تسجيل بواسطة فيسبوك',
                  onPressed: () async {
                    await context.read<SigninCubit>().signinWithFacebook();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
