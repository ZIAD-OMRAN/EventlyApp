import 'package:envently/consts/appcolors.dart';
import 'package:envently/home/Events/filedWidget.dart';
import 'package:flutter/material.dart';

class Lovescreen extends StatefulWidget {
  const Lovescreen({super.key});
  static String routename = 'Lovescreen';
  @override
  State<Lovescreen> createState() => _LovescreenState();
}

class _LovescreenState extends State<Lovescreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            eventFileds(
              controller: controller,
              text: 'Search For Events',
              screanheigth: screenHieght * .1,
              prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
