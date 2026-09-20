import 'package:envently/consts/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Chooseeventlocation extends StatefulWidget {
  const Chooseeventlocation({super.key});
  static String routename = 'Chooseeventlocation';

  @override
  State<Chooseeventlocation> createState() => _ChooseeventlocationState();
}

class _ChooseeventlocationState extends State<Chooseeventlocation> {
  LatLng? selectedpotion;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        GoogleMap(
          zoomGesturesEnabled: false,
          onTap: (LatLng position) {
            setState(() {
              selectedpotion = position;
            });
          },

          markers: selectedpotion == null
              ? {}
              : {
                  Marker(
                    position: selectedpotion!,
                    markerId: MarkerId('selectedpotion'),
                  ),
                },
          initialCameraPosition: CameraPosition(
            zoom: 15,
            target: LatLng(30.0444, 31.2357),
          ),
        ),
        GestureDetector(
          onTap: selectedpotion == null
              ? null
              : () {
                  Navigator.pop(context, selectedpotion);
                },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            color: AppColors.primaryColor,
            child: Text(
              'Tap On Location To Select',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
