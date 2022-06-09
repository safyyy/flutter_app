class Message {
  String body;

  DateTime date;

  Message({
    required this.body,
    required this.date,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      body: json["body"],
      date: DateTime.parse(json['created_at']),
    );
  }
}
