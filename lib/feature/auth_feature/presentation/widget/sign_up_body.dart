import 'package:commerce/core/helper_function/validations_regex.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:commerce/feature/auth_feature/presentation/views/login_view.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/rules_sign_up.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/switch_page.dart';
import 'package:commerce/shared/widget/custom_button.dart';
import 'package:commerce/shared/widget/error_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widget/custom_form_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late GlobalKey<FormState> formKey;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController nameController;

  late bool isPassword;
  late bool checkValue;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    isPassword = true;
    checkValue = false;
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
                controller: nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
                hint: 'الاسم كامل',
              ),
              SizedBox(
                height: 16,
              ),
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
              RulesSignUp(
                checkValue: checkValue,
                onChanged: (value) {
                  setState(() {
                    checkValue = value ?? false;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (checkValue) {
                      await context
                          .read<SignupCubit>()
                          .signUpWithEmailAndPassword(emailController.text,
                              passwordController.text, nameController.text);
                    } else {
                      showErrorBar(
                          context, 'يجب عليك الموافقة على الشروط والإحكام');
                    }
                  } else {
                    return;
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              SizedBox(
                height: 38,
              ),
              SwitchPage(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginView.routeName,
                  );
                },
                text1: 'تمتلك حساب بالفعل؟',
                text2: ' تسجيل دخول',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
