import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envently/models/evants_model.dart';

class EventsServices {
  static CollectionReference<EventModel> _getEventsCollection() {
    CollectionReference<EventModel> collection = FirebaseFirestore.instance
        .collection('Events')
        .withConverter(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }

  static Future<void> createEvent(EventModel event) async {
    CollectionReference<EventModel> collection = _getEventsCollection();
    DocumentReference<EventModel> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  static Future<List<EventModel>> getallEvents() async {
    CollectionReference<EventModel> collection = _getEventsCollection();
    QuerySnapshot<EventModel> snapshots = await collection.get();
    List<EventModel> events = snapshots.docs.map((e) => e.data()).toList();

    return events;
  }

  deleteEvent() {}
}
