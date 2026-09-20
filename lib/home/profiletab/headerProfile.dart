import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';

class Headerprofile extends StatelessWidget {
  const Headerprofile({this.height, super.key});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
      ),
      child: Row(
        children: [
          Align(
            alignment: AlignmentGeometry.bottomStart,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 150,
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset('assets/images/route.png'),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ziad omran',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorsecondry,
                ),
              ),
              Text('ziadomran11@gmial.com'),
            ],
          ),
        ],
      ),
    );
  }
}
