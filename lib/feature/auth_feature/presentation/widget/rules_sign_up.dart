import 'package:flutter/material.dart';

class RulesSignUp extends StatefulWidget {
  const RulesSignUp({super.key});

  @override
  State<RulesSignUp> createState() => _RulesSignUpState();
}

class _RulesSignUpState extends State<RulesSignUp> {
  late bool checkValue;
  @override
  void initState() {
    checkValue = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: checkValue, onChanged: (value){
          setState(() {
            checkValue = value ?? false;
          });
        }),
        Flexible(
          child: Text(
            'من خلال إنشاء حساب ، فإنك توافق على',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Color(0xFF949D9E),
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Text(
            ' الشروط والأحكام الخاصة بنا',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Color(0xFF2D9F5D),
            ),
          ),
        ),
      ],
    );
  }
}
