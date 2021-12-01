class NotificationModel {
  NotificationModel(this.title, this.body);

  final String title;
  final String body;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'body': body,
  };
}
