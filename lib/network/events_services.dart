import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envently/models/evants_model.dart';

class EventsServices {
  CollectionReference<EventModel> getEventsCollection() {
    CollectionReference<EventModel> collection = FirebaseFirestore.instance
        .collection('Events')
        .withConverter(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }

  Future<void> createEvent(EventModel event) async {
    CollectionReference<EventModel> collection = getEventsCollection();
    DocumentReference<EventModel> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  Future<List<EventModel>> getallEvents() async {
    CollectionReference<EventModel> collection = getEventsCollection();
    QuerySnapshot<EventModel> snapshots = await collection.get();
    List<EventModel> events = snapshots.docs.map((e) => e.data()).toList();

    return events;
  }

  deleteEvent() {}
}
