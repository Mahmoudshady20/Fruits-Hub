import 'package:commerce/feature/auth_feature/presentation/views/login_view.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/rules_sign_up.dart';
import 'package:commerce/feature/auth_feature/presentation/widget/switch_page.dart';
import 'package:commerce/shared/widget/custom_button.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
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
                controller: nameController,
                validator: (value) {
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
              RulesSignUp(),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {},
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
