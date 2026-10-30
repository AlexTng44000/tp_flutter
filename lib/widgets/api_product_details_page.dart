
import 'package:flutter/material.dart';

import '../entities/item.dart';

class ApiProductDetailsPage extends StatelessWidget {
  final Item item;

  const ApiProductDetailsPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation from the products list
            Hero(
              tag: 'product-${item.id}',
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 80,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              item.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '${item.price.toStringAsFixed(2)} €',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Available quantity: ${item.quantity}',
            ),

            const SizedBox(height: 24),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(item.description),
          ],
        ),
      ),
    );
  }
}
