import 'package:envently/consts/appcolors.dart';
import 'package:envently/consts/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * .06,
        width: width * .95,

        decoration: BoxDecoration(
          border: BoxBorder.all(color: AppColors.primaryColor),
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(Appimages.locationpre),
            ),
            Text(text, style: TextStyle(color: AppColors.primaryColor)),
            Spacer(),
            Icon(
              Icons.arrow_back_ios_new,
              textDirection: TextDirection.rtl,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
