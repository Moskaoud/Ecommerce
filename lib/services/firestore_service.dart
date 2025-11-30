import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';
import '../models/address_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Products
  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  Stream<List<Product>> getTopSellingProducts() {
    return _db
        .collection('products')
        .where('isTopSelling', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Product.fromMap(doc.data(), doc.id))
              .toList();
        });
  }

  Stream<List<Product>> getNewInProducts() {
    return _db
        .collection('products')
        .where('isNewIn', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Product.fromMap(doc.data(), doc.id))
              .toList();
        });
  }

  Stream<List<Product>> getProductsByCategory(String category) {
    return _db
        .collection('products')
        .where('category', isEqualTo: category)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Product.fromMap(doc.data(), doc.id))
              .toList();
        });
  }

  // Categories
  Stream<List<Category>> getCategories() {
    return _db.collection('categories').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Category.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  // Addresses
  Stream<List<Address>> getAddresses(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .collection('addresses')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Address.fromMap(doc.data(), doc.id))
              .toList();
        });
  }

  Future<void> addAddress(String userId, Address address) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('addresses')
        .add(address.toMap());
  }

  Future<void> updateAddress(String userId, Address address) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('addresses')
        .doc(address.id)
        .update(address.toMap());
  }

  Future<void> deleteAddress(String userId, String addressId) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('addresses')
        .doc(addressId)
        .delete();
  }

  // Seed Data (Helper for development)
  Future<void> seedData() async {
    // Check if categories exist
    final categoriesSnapshot = await _db.collection('categories').get();
    if (categoriesSnapshot.docs.isEmpty) {
      final categories = [
        {
          'title': 'Hoodies',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/9431/9431166.png',
        },
        {
          'title': 'Shorts',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2149/2149588.png',
        },
        {
          'title': 'Shoes',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2589/2589938.png',
        },
        {
          'title': 'Bag',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/2965/2965250.png',
        },
        {
          'title': 'Accessories',
          'iconUrl': 'https://cdn-icons-png.flaticon.com/512/883/883407.png',
        },
      ];
      for (var cat in categories) {
        await _db.collection('categories').add(cat);
      }
    }

    // Check if products exist
    final productsSnapshot = await _db.collection('products').get();
    if (productsSnapshot.docs.isEmpty) {
      final products = [
        {
          'title': "Men's Harrington Jacket",
          'price': 148.00,
          'originalPrice': null,
          'imageUrl':
              'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9729a826-0568-4566-9694-81492a5436e6/life-mens-harrington-jacket-8Z484d.png',
          'category': 'Hoodies', // Using Hoodies/Jackets loosely
          'rating': 4.5,
          'isTopSelling': true,
          'isNewIn': false,
        },
        {
          'title': "Max Cirro Men's Slides",
          'price': 55.00,
          'originalPrice': 100.97,
          'imageUrl':
              'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f65355b2-32a2-4a0b-a01e-6242484222d4/air-max-cirro-mens-slides-JgJ1Jg.png',
          'category': 'Shoes',
          'rating': 4.2,
          'isTopSelling': true,
          'isNewIn': false,
        },
        {
          'title': "Men's Fleece Shorts",
          'price': 45.00,
          'originalPrice': null,
          'imageUrl':
              'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0e32204d-e0d2-4e6d-927c-47c73a409908/sportswear-club-mens-fleece-shorts-Zd1w0b.png',
          'category': 'Shorts',
          'rating': 4.8,
          'isTopSelling': false,
          'isNewIn': true,
        },
      ];
      for (var prod in products) {
        await _db.collection('products').add(prod);
      }
    }
  }
}
