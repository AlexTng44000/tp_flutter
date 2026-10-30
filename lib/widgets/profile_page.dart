
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 320,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Name in bold
                    Text(
                      'Alex Tanguy',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    // Job title in italic and color
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                      ),
                    ),

                    SizedBox(height: 16),

                    // Biography
                    Text(
                      'I am a mobile application developer.',
                      style: TextStyle(fontSize: 16),
                    ),

                    SizedBox(height: 12),

                    // Description limited to two lines
                    Text(
                      'I enjoy building applications with Flutter '
                          'and Dart. I love learning new technologies '
                          'and creating useful mobile projects every day.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
