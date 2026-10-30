
import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'weather_page.dart';
import 'game_page.dart';
import 'products_page.dart';
import 'advanced_profile_page.dart';
import 'actions_page.dart';
import 'messages_page.dart';
import 'gallery_page.dart';
import 'registration_page.dart';
import 'home_page.dart';

// Exercise information
class Exercise {
  final String title;
  final String description;
  final IconData icon;
  final Widget page;

  const Exercise({
    required this.title,
    required this.description,
    required this.icon,
    required this.page,
  });
}

class ExercisesHomePage extends StatelessWidget {
  const ExercisesHomePage({super.key});

  // SLIDE 102 - Basic widgets
  static const List<Exercise> basicExercises = [
    Exercise(
      title: 'Profile Card',
      description: 'Text, Card and Overflow',
      icon: Icons.person,
      page: ProfilePage(),
    ),
    Exercise(
      title: 'Weather',
      description: 'Column, Row and Alignment',
      icon: Icons.wb_sunny,
      page: WeatherPage(),
    ),
    Exercise(
      title: 'Video Game',
      description: 'Stack, Positioned and Gradient',
      icon: Icons.sports_esports,
      page: GamePage(),
    ),
    Exercise(
      title: 'Product Cards',
      description: 'Container and BoxDecoration',
      icon: Icons.shopping_bag,
      page: ProductsPage(),
    ),
  ];

  // SLIDES 103-104 - Advanced widgets
  static const List<Exercise> advancedExercises = [
    Exercise(
      title: 'Advanced Profile',
      description: 'Image.network, Icon and CircleAvatar',
      icon: Icons.account_circle,
      page: AdvancedProfilePage(),
    ),
    Exercise(
      title: 'Actions',
      description: 'Buttons and SnackBars',
      icon: Icons.touch_app,
      page: ActionsPage(),
    ),
    Exercise(
      title: 'Messages',
      description: 'ListView.builder and ListTile',
      icon: Icons.message,
      page: MessagesPage(),
    ),
    Exercise(
      title: 'Product Gallery',
      description: 'GridView.builder and GridView.count',
      icon: Icons.grid_view,
      page: GalleryPage(),
    ),
    Exercise(
      title: 'Registration',
      description: 'Form, Validation and TextFormField',
      icon: Icons.app_registration,
      page: RegistrationPage(),
    ),
  ];

  // Open the selected exercise
  void openExercise(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => page,
      ),
    );
  }

  // Build an exercise card
  Widget buildExerciseCard(
      BuildContext context,
      Exercise exercise,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade50,
          child: Icon(
            exercise.icon,
            color: Colors.deepPurple,
          ),
        ),
        title: Text(exercise.title),
        subtitle: Text(exercise.description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          openExercise(context, exercise.page);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Exercises'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Welcome to Flutter TP!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Select an exercise to open its page.',
          ),

          const SizedBox(height: 25),

          // Basic widgets section
          const Text(
            'SLIDE 102 - BASIC WIDGETS',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),

          const SizedBox(height: 12),

          for (final exercise in basicExercises)
            buildExerciseCard(context, exercise),

          const SizedBox(height: 25),

          // Advanced widgets section
          const Text(
            'SLIDES 103-104 - ADVANCED WIDGETS',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),

          const SizedBox(height: 12),

          for (final exercise in advancedExercises)
            buildExerciseCard(context, exercise),

          const SizedBox(height: 25),

          // Previous exercise
          const Text(
            'OTHER EXERCISES',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),

          const SizedBox(height: 12),

          buildExerciseCard(
            context,
            const Exercise(
              title: 'Preferences',
              description: 'Switch, DatePicker and Dialog',
              icon: Icons.settings,
              page: PreferencesPage(),
            ),
          ),
        ],
      ),
    );
  }
}
