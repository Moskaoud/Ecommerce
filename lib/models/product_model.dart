class Product {
  final String id;
  final String title;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final String category;
  final double rating;
  final bool isTopSelling;
  final bool isNewIn;
  final String gender; // 'Men', 'Women', 'Kids', 'Unisex'

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.category,
    this.rating = 0.0,
    this.isTopSelling = false,
    this.isNewIn = false,
    this.gender = 'Unisex',
  });

  factory Product.fromMap(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      title: data['title'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      originalPrice: data['originalPrice'] != null
          ? (data['originalPrice'] ?? 0).toDouble()
          : null,
      imageUrl: data['imageUrl'] ?? '',
      category: data['category'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      isTopSelling: data['isTopSelling'] ?? false,
      isNewIn: data['isNewIn'] ?? false,
      gender: data['gender'] ?? 'Unisex',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'originalPrice': originalPrice,
      'imageUrl': imageUrl,
      'category': category,
      'rating': rating,
      'isTopSelling': isTopSelling,
      'isNewIn': isNewIn,
      'gender': gender,
    };
  }
}
