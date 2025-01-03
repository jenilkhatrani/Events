class EventModel {
  final String title;
  final String date;
  final String description;

  EventModel(
      {required this.title, required this.date, required this.description});

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'],
      date: map['date'],
      description: map['description'],
    );
  }
}
