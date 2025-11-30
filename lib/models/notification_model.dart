class NotificationModel {
  final String id;
  final String text;
  final bool isRead;
  final DateTime timestamp;

  NotificationModel({
    required this.id,
    required this.text,
    this.isRead = false,
    required this.timestamp,
  });
}
