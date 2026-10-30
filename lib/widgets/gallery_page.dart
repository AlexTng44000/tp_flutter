
import 'package:flutter/material.dart';

// Product model
class Product {
  final String name;
  final double price;
  final IconData icon;
  final Color color;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.color,
  });
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  // Product data
  static const List<Product> products = [
    Product(
      name: 'Headphones',
      price: 79.99,
      icon: Icons.headphones,
      color: Colors.blue,
    ),
    Product(
      name: 'Smart Watch',
      price: 129.99,
      icon: Icons.watch,
      color: Colors.purple,
    ),
    Product(
      name: 'Keyboard',
      price: 49.99,
      icon: Icons.keyboard,
      color: Colors.orange,
    ),
    Product(
      name: 'Camera',
      price: 299.99,
      icon: Icons.camera_alt,
      color: Colors.green,
    ),
    Product(
      name: 'Laptop',
      price: 899.99,
      icon: Icons.laptop,
      color: Colors.red,
    ),
    Product(
      name: 'Phone',
      price: 599.99,
      icon: Icons.smartphone,
      color: Colors.teal,
    ),
  ];

  // Build a product card
  Widget buildProductCard(Product product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Colored product image
          Expanded(
            child: Container(
              color: product.color,
              child: Icon(
                product.icon,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${product.price.toStringAsFixed(2)} €',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build a category card
  Widget buildCategory(String name, IconData icon) {
    return Card(
      color: Colors.blue.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 45,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          Text(name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Gallery'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Products'),
              Tab(text: 'Categories'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // PART 1 - Dynamic product grid
            GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return buildProductCard(products[index]);
              },
            ),

            // PART 2 - Fixed category grid
            GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                buildCategory('Electronics', Icons.devices),
                buildCategory('Gaming', Icons.sports_esports),
                buildCategory('Audio', Icons.headphones),
                buildCategory('Fashion', Icons.checkroom),
                buildCategory('Sports', Icons.sports_soccer),
                buildCategory('Accessories', Icons.watch),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
