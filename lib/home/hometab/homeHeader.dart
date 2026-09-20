import 'package:envently/home/hometab/filterwidget.dart';
import 'package:flutter/material.dart';

class Homeheader extends StatefulWidget {
  const Homeheader({super.key});

  @override
  State<Homeheader> createState() => _HomeheaderState();
}

class _HomeheaderState extends State<Homeheader> {
  
  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      padding: EdgeInsets.all(16),

      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back ✨',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Ziad Omran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Cairo , Egypt',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.brightness_5_sharp, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 33,
                  width: 35,

                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                      backgroundColor: Colors.white,
                    ),

                    onPressed: () {},
                    child: Text(
                      'EN',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).bottomNavigationBarTheme.backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            FilterWidget(),
          ],
        ),
      ),
    );
  }
}
