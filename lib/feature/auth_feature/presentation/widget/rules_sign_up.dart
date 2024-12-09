import 'package:flutter/material.dart';

class RulesSignUp extends StatelessWidget {
  const RulesSignUp({
    super.key,
    required this.checkValue,
    required this.onChanged,
  });

  final bool checkValue;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checkValue,
          onChanged: onChanged,
        ),
        Flexible(
          child: Text(
            'من خلال إنشاء حساب ، فإنك توافق على',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(0xFF949D9E),
                ),
          ),
        ),
        InkWell(
          onTap: () {},
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
