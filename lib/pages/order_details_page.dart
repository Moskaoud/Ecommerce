import 'package:flutter/material.dart';
import 'package:ecommerce/models/order_model.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Order #${order.orderNumber}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline
            _buildTimelineStep(
              'Delivered',
              order.status == OrderStatus.delivered,
              true,
            ),
            _buildTimelineStep(
              'Shipped',
              order.status == OrderStatus.shipped ||
                  order.status == OrderStatus.delivered,
              true,
            ),
            _buildTimelineStep('Order Confirmed', true, true),
            _buildTimelineStep('Order Placed', true, false),

            const SizedBox(height: 32),

            // Order Items
            const Text(
              'Order Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.receipt_long_outlined, size: 24),
                      const SizedBox(width: 12),
                      Text(
                        '${order.itemCount} items',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Color(0xFF8E6CEF)),
                        ),
                      ),
                    ],
                  ),
                  // List items here if needed
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Shipping Details
            const Text(
              'Shipping details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.shippingAddress,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '121-224-7890', // Placeholder phone
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep(String title, bool isCompleted, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? const Color(0xFF8E6CEF)
                    : const Color(0xFFE0E0E0),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: isCompleted
                    ? const Color(0xFF8E6CEF)
                    : const Color(0xFFE0E0E0),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
              if (isCompleted)
                const Text(
                  '28 May', // Placeholder date
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              const SizedBox(height: 32), // Spacing for next item
            ],
          ),
        ),
      ],
    );
  }
}
