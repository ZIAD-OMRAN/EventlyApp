import 'package:envently/home/profiletab/dropdowenFiled.dart';
import 'package:envently/home/profiletab/headerProfile.dart';
import 'package:envently/home/profiletab/logout.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static String routname = 'Profile';

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Headerprofile(height: screenHieght * .25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hoverColor,
                    ),
                  ),
                  Dropdowenfiled(text: 'Arabic', height: screenHieght * .07),
                  Text(
                    'Theme',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hoverColor,
                    ),
                  ),
                  Dropdowenfiled(text: 'light', height: screenHieght * .07),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Logout(height: screenHieght * .07),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
