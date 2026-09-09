import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({this.text, super.key, this.onPressed});
  final void Function()? onPressed;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
