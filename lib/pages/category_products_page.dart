import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../services/firestore_service.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';

class CategoryProductsPage extends StatelessWidget {
  final Category category;

  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();

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
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF4F4F4),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.black, size: 20),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: StreamBuilder<List<Product>>(
              stream: firestoreService.getProductsByCategory(category.title),
              builder: (context, snapshot) {
                int count = 0;
                if (snapshot.hasData) {
                  count = snapshot.data!.length;
                }
                return Text(
                  '${category.title} ($count)',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: firestoreService.getProductsByCategory(category.title),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No products found in ${category.title}'),
                  );
                }

                final products = snapshot.data!;

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsPage(product: products[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
