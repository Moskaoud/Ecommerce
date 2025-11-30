import 'package:flutter/material.dart';
import 'package:ecommerce/models/notification_model.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final List<NotificationModel> notifications = [
      NotificationModel(
        id: '1',
        text:
            'Gilbert, you placed and order check your order history for full details',
        timestamp: DateTime.now(),
        isRead: false,
      ),
      NotificationModel(
        id: '2',
        text:
            'Gilbert, Thank you for shopping with us we have canceled order #24568.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
      NotificationModel(
        id: '3',
        text:
            'Gilbert, your Order #24568 has been confirmed check your order history for full details',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
      ),
    ];

    // Toggle this to see empty state
    final bool isEmpty = false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildNotificationCard(notifications[index]);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFF8E6CEF), // Purple
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_off_outlined,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Notification yet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to categories or home
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8E6CEF),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Explore Categories',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(NotificationModel notification) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              notification.text,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
