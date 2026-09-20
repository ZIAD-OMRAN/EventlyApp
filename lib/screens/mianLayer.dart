import 'package:envently/consts/appimages.dart';
import 'package:envently/home/Events/createEvent.dart';
import 'package:envently/home/hometab/homeScreen.dart';
import 'package:envently/home/lovetab/lovescreen.dart';
import 'package:envently/home/maptab/mapscrean.dart';
import 'package:envently/home/profiletab/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mianlayer extends StatefulWidget {
  const Mianlayer({super.key});
  static const routename = 'Mianlayer';

  @override
  State<Mianlayer> createState() => _MianlayerState();
}

class _MianlayerState extends State<Mianlayer> {
  int currentindex = 0;
  List<Widget> pages = [Homescreen(), Mapscrean(), Lovescreen(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Createevent.routename);
        },

        backgroundColor: Theme.of(
          context,
        ).bottomNavigationBarTheme.backgroundColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 45),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appimages.homeUN),
              activeIcon: SvgPicture.asset(Appimages.homeS),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appimages.locationUN),
              activeIcon: SvgPicture.asset(Appimages.locationS),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appimages.loveUN),
              activeIcon: SvgPicture.asset(Appimages.loveS),
              label: 'Love',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Appimages.profileUN),
              activeIcon: SvgPicture.asset(Appimages.profileS),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: pages[currentindex],
    );
  }
}
