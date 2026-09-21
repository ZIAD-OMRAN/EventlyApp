import 'package:envently/consts/appcolors.dart';
import 'package:envently/consts/appimages.dart';
import 'package:envently/home/Events/chooseEventLocation.dart';
import 'package:envently/home/Events/filedWidget.dart';
import 'package:envently/home/Events/flitereEvent.dart';
import 'package:envently/home/Events/location_widget.dart';

import 'package:envently/models/cardmodel.dart';
import 'package:envently/models/evants_model.dart';

import 'package:envently/widgets/bottonwidget.dart';
import 'package:envently/widgets/snake_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:envently/network/events_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class Createevent extends StatefulWidget {
  const Createevent({super.key});
  static String routename = 'Createevent';

  @override
  State<Createevent> createState() => _CreateeventState();
}

class _CreateeventState extends State<Createevent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? dateText;
  String? timeText;
  String? eventLocationText;
  int selectedCategoryIndex = 1;
  LatLng? eventLocation;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<String> getLocationName(LatLng location) async {
    try {
      final geocoding = Geocoding();

      List<Placemark> places = await geocoding.placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (places.isNotEmpty) {
        final place = places.first;

        return place.locality ??
            place.subAdministrativeArea ??
            place.administrativeArea ??
            'Unknown Location';
      }

      return 'Unknown Location';
    } catch (e) {
      print('Geocoding Error: $e');
      return 'Unknown Location';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screanwidth = MediaQuery.of(context).size.width;
    double screanheigth = MediaQuery.of(context).size.height;
    final selectedCategory = Cardmodel.cards.firstWhere(
      (e) => e.id == selectedCategoryIndex,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(selectedCategory.imagePath),
                    fit: BoxFit.cover,
                  ),

                  borderRadius: BorderRadius.circular(16),
                ),
                height: screanheigth * .2,
                width: screanwidth * .9,
              ),
            ),
            FilterWidgetevent(
              onCategorySelected: (index) {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 15),
              child: Text('Title', style: TextStyle(fontSize: 16)),
            ),
            eventFileds(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'pleas enter vlaid title';
                }
                return null;
              },
              prefixIcon: Icon(
                Icons.edit_document,

                color: Theme.of(context).hintColor,
              ),
              text: 'Event Title',
              screanheigth: screanheigth * .09,
              controller: titleController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Description', style: TextStyle(fontSize: 16)),
            ),
            eventFileds(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'pleas enter vlaid Description';
                }
                return null;
              },
              text: 'Event Description',
              screanheigth: screanheigth * .2,
              controller: descriptionController,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Appimages.dateIcon,
                    color: Theme.of(context).hoverColor,
                  ),
                ),
                Text('Event Date', style: TextStyle(fontSize: 17)),
                Spacer(),

                GestureDetector(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2026),
                      lastDate: DateTime(2030),
                      initialDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        dateText = DateFormat('dd MMM yyyy').format(date);
                      });
                    }
                  },

                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      dateText ?? 'Choose Date',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Appimages.time,
                    color: Theme.of(context).hoverColor,
                  ),
                ),
                Text('Event Time', style: TextStyle(fontSize: 17)),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        timeText = time.format(context);
                      });
                    }
                  },

                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      timeText ?? 'Choose Time',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 6),
              child: Text('Location', style: TextStyle(fontSize: 16)),
            ),

            Center(
              child: LocationWidget(
                text: eventLocationText ?? 'Choose Event Location',
                onTap: () async {
                  LatLng? result = await Navigator.push<LatLng>(
                    context,
                    MaterialPageRoute<LatLng>(
                      builder: (context) => Chooseeventlocation(),
                    ),
                  );
                  if (result != null) {
                    final locationName = await getLocationName(result);
                    setState(() {
                      eventLocationText = locationName;
                      eventLocation = result;
                    });
                  }
                },
              ),
            ),
            Bottonwidget(
              text: 'Add Event',
              fontSize: 20,
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  if (dateText != null &&
                      timeText != null &&
                      eventLocationText != null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                    EventModel event = EventModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: dateText!,
                      location: eventLocationText,

                      category: selectedCategory.id.toString(),
                      isFave: false,
                    );
                    try {
                      await EventsServices.createEvent(event);
                      SnackBarHelper.ShowSnakbarsucsess(context, 'sucsess');
                       Navigator.of(context).pop();
                        Navigator.of(context).pop();
                    } catch (e) {
                       Navigator.of(context).pop();
                      SnackBarHelper.ShowSnakbarEROOR(context, e.toString());
                    }
                    
                  } else {
                  
                    SnackBarHelper.ShowSnakbarEROOR(
                      context,
                      'check the fileds of date and time or location',
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
