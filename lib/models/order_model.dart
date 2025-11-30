import 'package:ecommerce/models/cart_model.dart';

enum OrderStatus { processing, shipped, delivered, returned, canceled }

class OrderModel {
  final String id;
  final String orderNumber;
  final List<CartItem> items;
  final OrderStatus status;
  final DateTime date;
  final String shippingAddress;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.items,
    required this.status,
    required this.date,
    required this.shippingAddress,
  });

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
}
