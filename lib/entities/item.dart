
class Item {
  final int id;
  final String name;
  final int quantity;
  final String description;
  final double price;
  final String imageUrl;

  const Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Convert API JSON data into an Item object
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['title'] as String,
      quantity: json['stock'] as int,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['thumbnail'] as String,
    );
  }
}
