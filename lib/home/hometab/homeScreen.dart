import 'package:envently/home/hometab/cards_widget.dart';
import 'package:envently/home/hometab/homeHeader.dart';
import 'package:envently/home/maptab/mapevents.dart';
import 'package:envently/models/evants_model.dart';
import 'package:envently/network/events_services.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Homeheader(),
          FutureBuilder<List<EventModel>>(
            future: EventsServices.getallEvents(),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (asyncSnapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text(asyncSnapshot.error.toString()),

                      TextButton(
                        onPressed: () => setState(() {}),
                        child: Text('Refresh'),
                      ),
                    ],
                  ),
                );
              } else {
                return CardsWidget(events: asyncSnapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}
