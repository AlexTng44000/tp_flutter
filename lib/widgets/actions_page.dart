
import 'package:flutter/material.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key});

  // Display a SnackBar
  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actions Page'),

        // IconButton in the AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () {
              showMessage(context, 'Notifications clicked!');
            },
          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Flutter Buttons',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // PART 1 - ElevatedButton with icon
                ElevatedButton.icon(
                  onPressed: () {
                    showMessage(context, 'Primary action clicked!');
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Send Message'),
                ),

                const SizedBox(height: 20),

                // PART 2 - TextButton
                TextButton(
                  onPressed: () {
                    showMessage(context, 'Secondary action clicked!');
                  },
                  child: const Text('Learn More'),
                ),

                const SizedBox(height: 20),

                // PART 3 - OutlinedButton with custom style
                OutlinedButton(
                  onPressed: () {
                    showMessage(context, 'Outlined button clicked!');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.purple,
                    side: const BorderSide(
                      color: Colors.purple,
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Custom Button'),
                ),
              ],
            ),
          ),
        ),
      ),

      // PART 4 - FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMessage(context, 'Floating button clicked!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
