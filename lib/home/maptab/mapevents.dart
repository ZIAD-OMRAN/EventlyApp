class EventMapModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  EventMapModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  static List<EventMapModel> events = [
    EventMapModel(
      id: 1,
      name: 'Football Match',
      latitude: 31.0409,
      longitude: 31.3785,
    ),
    EventMapModel(
      id: 2,
      name: 'Birthday Party',
      latitude: 31.0364,
      longitude: 31.3576,
    ),
    EventMapModel(
      id: 3,
      name: 'Tech Workshop',
      latitude: 31.0412,
      longitude: 31.3640,
    ),
    EventMapModel(
      id: 4,
      name: 'Gaming Event',
      latitude: 31.0500,
      longitude: 31.3900,
    ),
  ];
}