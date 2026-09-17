import 'package:envently/consts/appcolors.dart';
import 'package:envently/consts/appimages.dart';
import 'package:envently/home/Events/filedWidget.dart';
import 'package:envently/home/Events/location_widget.dart';
import 'package:envently/home/hometab/filterwidget.dart';
import 'package:envently/widgets/bottonwidget.dart';
import 'package:envently/widgets/textform.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Createevent extends StatefulWidget {
  const Createevent({super.key});
  static String routename = 'Createevent';

  @override
  State<Createevent> createState() => _CreateeventState();
}

class _CreateeventState extends State<Createevent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String dateText = 'Choose Date';
  String timeText = 'Choose Date';

  @override
  Widget build(BuildContext context) {
    double screanwidth = MediaQuery.of(context).size.width;
    double screanheigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Create Event')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            height: screanheigth * .2,
            width: screanwidth * .8,
          ),
          FilterWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 15),
            child: Text('Title', style: TextStyle(fontSize: 16)),
          ),
          eventFileds(
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
                  setState(() {
                    dateText = date.toString();
                  });
                },

                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    dateText,
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
                  setState(() {
                    timeText = time.toString();
                  });
                },

                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    timeText,
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

          Center(child: LocationWidget()),
          Bottonwidget(text: 'Add Event', fontSize: 20),
        ],
      ),
    );
  }
}
