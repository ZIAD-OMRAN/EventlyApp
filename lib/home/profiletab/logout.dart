import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({this.height, super.key});
  final double? height;
  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: widget.height,

        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.logout, color: Colors.white),
            ),
            Text(
              'Logout',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
