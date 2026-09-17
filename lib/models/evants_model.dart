class EventModel {
  String title;
  String description;
  String date;
  String id;
  String category;
  bool isFave;

  EventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    required this.category,
    required this.isFave,
  });

  static EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'],
      description: json['description'],
      date: json['date'],
      id: json['id'],
      category: json['category'],
      isFave: json['isFave'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'category': category,
      'isFave': isFave,
    };
  }
}
