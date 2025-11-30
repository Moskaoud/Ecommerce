import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/cart_model.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String _selectedSize = 'M';
  String _selectedColor = 'Black';

  final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  final List<String> _colors = [
    'Black',
    'Red',
    'Blue',
    'Green',
  ]; // Simplified colors

  void _addToCart() {
    final cart = Provider.of<CartModel>(context, listen: false);
    cart.addItem(widget.product, _selectedSize, _selectedColor);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.title} added to cart'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            // Implement undo if needed, or just remove last item
          },
        ),
      ),
    );
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Toggle favorite
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: const Color(0xFFF4F4F4),
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.image_not_supported, size: 50),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Price
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8E6CEF),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Size Selector
                        const Text(
                          'Size',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          children: _sizes.map((size) {
                            final isSelected = _selectedSize == size;
                            return ChoiceChip(
                              label: Text(size),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedSize = size;
                                });
                              },
                              backgroundColor: const Color(0xFFF4F4F4),
                              selectedColor: const Color(0xFF8E6CEF),
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              showCheckmark: false,
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 24),

                        // Color Selector
                        const Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 16,
                          children: _colors.map((color) {
                            final isSelected = _selectedColor == color;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF8E6CEF)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: _getColor(color),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 24),

                        // Description
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
                          style: TextStyle(color: Colors.grey, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add to Cart Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E6CEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'Black':
        return Colors.black;
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Green':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
