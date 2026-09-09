import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
  const Textform({this.hint, this.prefixIcon, this.validator, super.key});

  final Widget? prefixIcon;
  final Widget? hint;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: validator,

        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hint: hint,
          hintStyle: TextStyle(color: AppColors.grayColor),

          // Normal
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.grayColor, ),
          ),

          // Focus
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.grayColor,),
          ),

          // Error
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.redColor,),
          ),

          // Focus + Error
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red,),
          ),
        ),
      ),
    );
  }
}
