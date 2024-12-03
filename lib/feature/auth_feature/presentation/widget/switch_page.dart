import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key,required this.onTap,required this.text1,required this.text2,});
  final String text1;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Color(0xFF949D9E),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
