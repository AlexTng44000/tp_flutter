
import 'package:flutter/material.dart';

class AdvancedProfilePage extends StatelessWidget {
  const AdvancedProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // PART 1 - Network image with loading indicator
                ClipOval(
                  child: Image.network(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,

                    // Show a placeholder while loading
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return child;
                      }

                      return const SizedBox(
                        width: 120,
                        height: 120,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },

                    // Show a fallback if loading fails
                    errorBuilder: (context, error, stackTrace) {
                      return const CircleAvatar(
                        radius: 60,
                        child: Icon(Icons.person, size: 60),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Profile information
                const Text(
                  'Alex Tanguy',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 30),

                // PART 2 - Icons with different sizes and colors
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 45,
                    ),
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // PART 3 - Icon inside a CircleAvatar
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 12),

                const Text('Profile Icon'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
