import 'package:envently/home/maptab/mapevents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Mapscrean extends StatefulWidget {
  const Mapscrean({super.key});
  static String routename = 'Mapscrean';

  @override
  State<Mapscrean> createState() => _MapscreanState();
}

class _MapscreanState extends State<Mapscrean> {
  late GoogleMapController _controller;
  String? _style;
  LatLng? initlocation;
  Future<void> _getmapStyl() async {
    final String style = await rootBundle.loadString(
      'assets/maps/mapstyle.json',
    );
    setState(() {
      _style = style;
    });
  }

  @override
  void initState() {
    super.initState();
    _getmapStyl();
    initializeMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onTap: (argument) {},
        markers: EventMapModel.events
            .map(
              (e) => Marker(
                onTap: () {
                  _updateCmeraLOcation(LatLng(e.latitude, e.longitude));
                },
                infoWindow: InfoWindow(title: e.name),
                position: LatLng(e.latitude, e.longitude),
                markerId: MarkerId(e.id.toString()),
              ),
            )
            .toSet(),
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          zoom: 15,
          target: initlocation ?? LatLng(30.0444, 31.2357),
        ),
        myLocationEnabled: false,
        myLocationButtonEnabled: false,

        style: _style,
      ),
    );
  }

  Future<void> _updateCmeraLOcation(LatLng latlng) async {
    await _controller.animateCamera(
      duration: Duration(milliseconds: 700),
      CameraUpdate.newCameraPosition(CameraPosition(zoom: 15, target: latlng)),
    );
  }

  Future<void> initializeMap() async {
    //1 services enable ?
    Location location = Location.instance;
    bool status = await location.serviceEnabled();

    if (!status) {
      bool serviceStatus = await location.requestService();
      if (!serviceStatus) {
        //error dilaog
        return;
      }
    }
    //2 check status
    PermissionStatus prremission = await location.hasPermission();
    if (prremission == PermissionStatus.denied ||
        prremission == PermissionStatus.deniedForever) {
      prremission = await location.requestPermission();
      if (prremission != PermissionStatus.granted) {
        //error dialog
        return;
      }
    }

    //3 get location(user)
    var loca = await location.getLocation();
    setState(() {
      initlocation = LatLng(loca.latitude, loca.longitude);
    });
  }
}
