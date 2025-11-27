//todo check handle notification service
//navigation and local foreground notification and check gemini agent
//

import 'dart:developer' as developer; // Added for better logging
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Must be a top-level function (not a class method)
// Or a static method in a class if using Firebase SDK v10.4.0 and above for onBackgroundMessage
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, like Firestore,
  // make sure you call `Firebase.initializeApp` before using other Firebase services.
  // await Firebase.initializeApp(); // Consider if needed, ensure it's configured for background.

  if (kDebugMode) {
    developer.log("Handling a background message: ${message.messageId}", name: 'NotificationService.Background');
    developer.log('Message data: ${message.data}', name: 'NotificationService.Background');
    developer.log('Message notification: ${message.notification?.title} / ${message.notification?.body}', name: 'NotificationService.Background');
  }
  // You can process the message here, e.g., save data, update local state,
  // or show a local notification if needed (though background messages usually create a system notification).
}

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static const String _serviceName = 'NotificationService'; // For logger name

  // For custom foreground notifications
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Stream for listening to notification data when app is opened from a notification tap
  // final BehaviorSubject<Map<String, dynamic>> _messageSubject = BehaviorSubject<Map<String, dynamic>>();
  // Stream<Map<String, dynamic>> get messageStream => _messageSubject.stream;

  Future<void> initialize() async {
    // Request permissions for iOS and Android 13+
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false, // Set to true for provisional authorization (iOS)
      sound: true,
    );

    if (kDebugMode) {
      developer.log('User granted permission: ${settings.authorizationStatus}', name: _serviceName);
    }

    // Initialize flutter_local_notifications
    await _initializeLocalNotifications();

    // Get the FCM token
    await _getFCMToken();

    // Setup foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        developer.log('Got a message whilst in the foreground!', name: _serviceName);
        developer.log('Message data: ${message.data}', name: _serviceName);
      }

      if (message.notification != null) {
        if (kDebugMode) {
          developer.log('Message also contained a notification: ${message.notification?.title} / ${message.notification?.body}', name: _serviceName);
        }
        // If app is in foreground, a system notification might not appear.
        // Show a local notification to make it visible or an in-app banner..
        _showLocalNotification(message);
      }
    });

    // Setup background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handler for when a notification opens the app from terminated state
    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage, 'TerminatedState');
    }

    // Handler for when a notification opens the app from background state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageOpenedApp(message, 'BackgroundState');
    });
  }

  Future<void> _getFCMToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      if (kDebugMode) {
        developer.log("FCM Token: $token", name: _serviceName);
      }
      // TODO: Send this token to your server to associate it with the user
      // Example: await myApi.saveUserFCMToken(token);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        developer.log(
          'Error getting FCM token',
          name: _serviceName,
          error: e,
          stackTrace: stackTrace,
          level: 1000, // SEVERE level for errors
        );
      }
    }

    // Listen for token refresh
    _firebaseMessaging.onTokenRefresh.listen((String newToken) {
      if (kDebugMode) {
        developer.log("FCM Token Refreshed: $newToken", name: _serviceName);
      }
      // TODO: Send this new token to your server
    });
  }

  void _handleMessageOpenedApp(RemoteMessage message, String appState) {
    if (kDebugMode) {
      developer.log('Message opened app from $appState:', name: _serviceName);
      developer.log('Message data: ${message.data}', name: _serviceName);
      developer.log('Message notification: ${message.notification?.title} / ${message.notification?.body}', name: _serviceName);
    }
    // TODO: Navigate to a specific screen based on message.data or notification content
    // Example: if (message.data['type'] == 'chat') { navigateToChatScreen(message.data['chat_id']); }
    // _messageSubject.add(message.data); // If using a stream for navigation
  }

  // --- Flutter Local Notifications for Foreground ---

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Default app icon

    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      // ///isn't defined. error
      // onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
      //   // Handle older iOS versions
      //   developer.log('iOS older: local notification received: $title', name: _serviceName);
      // },
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        final String? payload = notificationResponse.payload;
        if (payload != null && kDebugMode) {
          developer.log('Local notification payload: $payload', name: _serviceName);
        }
        // Handle tap on local notification if needed, e.g., by parsing payload
        // _messageSubject.add({'payload': payload}); // Example
      },
      // static callback for background local notification taps
      // onDidReceiveBackgroundNotificationResponse: _onDidReceiveBackgroundNotificationResponse 
    );

    // Create a default channel for Android (important for Android 8.0+)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification == null) return;

    await _localNotificationsPlugin.show(
      notification.hashCode, // Unique ID for the notification
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel', 
          'High Importance Notifications',
          channelDescription: 'This channel is used for important notifications.',
          icon: android?.smallIcon ?? '@mipmap/ic_launcher',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: message.data.isNotEmpty ? message.data.toString() : null,
    );
  }

  void dispose() {
    // _messageSubject.close(); // If using BehaviorSubject
  }
}
