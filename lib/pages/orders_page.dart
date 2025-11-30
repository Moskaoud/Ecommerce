import 'package:flutter/material.dart';
import 'package:ecommerce/models/order_model.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'order_details_page.dart';
import 'shop_by_categories_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy Data
  final List<OrderModel> _orders = [
    OrderModel(
      id: '1',
      orderNumber: '456765',
      items: [
        CartItem(
          product: Product(
            id: '1',
            title: "Men's Harrington Jacket",
            price: 148.00,
            imageUrl: '',
            category: 'Hoodies',
          ),
          size: 'M',
          color: 'Lemon',
          quantity: 4,
        ),
      ],
      status: OrderStatus.processing,
      date: DateTime.now(),
      shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
    ),
    OrderModel(
      id: '2',
      orderNumber: '454569',
      items: [
        CartItem(
          product: Product(
            id: '2',
            title: "Men's Shoes",
            price: 55.00,
            imageUrl: '',
            category: 'Shoes',
          ),
          size: 'L',
          color: 'Black',
          quantity: 2,
        ),
      ],
      status: OrderStatus.shipped,
      date: DateTime.now().subtract(const Duration(days: 2)),
      shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
    ),
    OrderModel(
      id: '3',
      orderNumber: '454809',
      items: [
        CartItem(
          product: Product(
            id: '3',
            title: "Men's Shorts",
            price: 45.00,
            imageUrl: '',
            category: 'Shorts',
          ),
          size: 'S',
          color: 'Blue',
          quantity: 1,
        ),
      ],
      status: OrderStatus.delivered,
      date: DateTime.now().subtract(const Duration(days: 5)),
      shippingAddress: '2715 Ash Dr. San Jose, South Dakota 83475',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFF8E6CEF),
          ),
          tabs: const [
            Tab(text: 'Processing'),
            Tab(text: 'Shipped'),
            Tab(text: 'Delivered'),
            Tab(text: 'Returned'),
            Tab(text: 'Canceled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(OrderStatus.processing),
          _buildOrderList(OrderStatus.shipped),
          _buildOrderList(OrderStatus.delivered),
          _buildOrderList(OrderStatus.returned),
          _buildOrderList(OrderStatus.canceled),
        ],
      ),
    );
  }

  Widget _buildOrderList(OrderStatus status) {
    final filteredOrders = _orders
        .where((order) => order.status == status)
        .toList();

    if (filteredOrders.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filteredOrders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _buildOrderCard(context, filteredOrders[index]);
      },
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
              color: Color(0xFF8E6CEF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Orders yet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopByCategoriesPage(),
                ),
              );
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

  Widget _buildOrderCard(BuildContext context, OrderModel order) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsPage(order: order),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.receipt_long_outlined,
              size: 28,
              color: Colors.black,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #${order.orderNumber}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${order.itemCount} items',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
