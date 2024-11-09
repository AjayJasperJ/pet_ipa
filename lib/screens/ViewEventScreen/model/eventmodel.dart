class EventModel {
  final String id;
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String description;
  final String registrationDeadline;
  final String organizerName;
  final String organizerEmail;
  final String organizerPhone;

  EventModel(
      {required this.id,
      required this.eventName,
      required this.eventDate,
      required this.eventTime,
      required this.eventLocation,
      required this.description,
      required this.registrationDeadline,
      required this.organizerName,
      required this.organizerEmail,
      required this.organizerPhone});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        eventName: json['eventName'],
        eventDate: json['eventDate'],
        eventTime: json['eventTime'],
        eventLocation: json['eventLocation'],
        description: json['description'],
        registrationDeadline: json['description'],
        organizerName: json['organizerName'],
        organizerEmail: json['organizerEmail'],
        organizerPhone: json['organizerPhone']);
  }
}
