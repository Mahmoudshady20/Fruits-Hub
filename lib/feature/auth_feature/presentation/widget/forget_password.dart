import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key,required this.onTap,});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            'نسيت كلمة المرور؟',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Color(0xFF2D9F5D),
            ),
          ),
        ),
      ],
    );
  }
}
