abstract class NotificationUseCase {

  Future<void> saveNotification(String title, String body);

  Future<void> archiveNotification();

  Future<void> getAllNewNotifications();
}
