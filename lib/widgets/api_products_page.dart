
import 'package:flutter/material.dart';

import '../entities/item.dart';
import '../services/product_service.dart';
import 'api_product_details_page.dart';

class ApiProductsPage extends StatefulWidget {
  const ApiProductsPage({super.key});

  @override
  State<ApiProductsPage> createState() =>
      _ApiProductsPageState();
}

class _ApiProductsPageState extends State<ApiProductsPage> {
  late Future<List<Item>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = ProductService.fetchItems();
  }

  // Retry loading when an error occurs
  void retryLoading() {
    setState(() {
      _itemsFuture = ProductService.fetchItems();
    });
  }

  // Open the product details screen
  void openDetails(Item item) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) =>
            ApiProductDetailsPage(item: item),
      ),
    );
  }

  // Build a product card
  Widget buildProductCard(Item item) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        isThreeLine: true,

        leading: Hero(
          tag: 'product-${item.id}',
          child: SizedBox(
            width: 68,
            height: 68,
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image);
              },
            ),
          ),
        ),

        title: Text(
          item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${item.price.toStringAsFixed(2)} €',
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        trailing: const Icon(Icons.chevron_right),

        onTap: () => openDetails(item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products API'),
      ),

      body: FutureBuilder<List<Item>>(
        future: _itemsFuture,

        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Failed to load products'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: retryLoading,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          // Display products
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildProductCard(items[index]);
            },
          );
        },
      ),
    );
  }
}
