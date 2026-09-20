import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';

class Dropdowenfiled extends StatelessWidget {
  const Dropdowenfiled({
    super.key,
    this.onTap,
    this.height,
    required this.text,
  });
  final double? height;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: AppColors.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.arrow_drop_down,
              size: 50,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
