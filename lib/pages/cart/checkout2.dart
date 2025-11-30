import 'package:flutter/material.dart';
import 'package:ecommerce/utils/theme/brand_colors.dart';

import '../../widgets/circular_back_button_app_bar.dart';
class Checkout2 extends StatelessWidget {
  const Checkout2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CircularBackButtonAppBar(title: 'Checkout2'), // Use the new AppBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildCheckoutButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Remove All"),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildCartItem(
                'Men\'s Harrington Jacket',
                'Size - M  Color - Lemon',
                '\$148',
                'https://picsum.photos/seed/picsum/200/300', // Replace with your image URL
              ),
              const SizedBox(height: 16.0),
              _buildCartItem(
                'Men\'s Coaches Jacket',
                'Size - M  Color - Black',
                '\$52.00',
                'https://picsum.photos/seed/picsum/200/300', // Replace with your image URL
              ),
              const SizedBox(height: 32.0),
              const Divider(),
              _buildPriceSummary(),
              const SizedBox(height: 16.0),
              _buildCouponCodeField(),
              const SizedBox(height: 16.0),
        
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCartItem(String name, String details, String price, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(details),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: BrandColors.primary),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle, color: BrandColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      children: [
        _buildPriceRow('Subtotal', '\$200'),
        _buildPriceRow('Shipping Cost', '\$8.00'),
        _buildPriceRow('Tax', '\$0.00'),
        const Divider(),
        _buildPriceRow('Total', '\$208', isTotal: true),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCodeField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_border, color: Colors.green),
          const SizedBox(width: 8.0),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Coupon Code',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: BrandColors.primary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: BrandColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: const Text(
        'Checkout',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}