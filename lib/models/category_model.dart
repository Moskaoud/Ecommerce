class Category {
  final String id;
  final String title;
  final String iconUrl;

  Category({required this.id, required this.title, required this.iconUrl});

  factory Category.fromMap(Map<String, dynamic> data, String id) {
    return Category(
      id: id,
      title: data['title'] ?? '',
      iconUrl: data['iconUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'iconUrl': iconUrl};
  }
}
