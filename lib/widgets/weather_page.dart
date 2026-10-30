
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // Weather icon
            Icon(
              Icons.wb_sunny,
              size: 80,
              color: Colors.orange,
            ),

            SizedBox(height: 20),

            // City
            Text(
              'Nantes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // Temperature
            Text(
              '18°C',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // Weather description
            Text(
              'Partly cloudy',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 40),

            // Weather statistics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.water_drop, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Humidity'),
                    Text('65%'),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.air, color: Colors.green),
                    SizedBox(height: 8),
                    Text('Wind'),
                    Text('15 km/h'),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.orange),
                    SizedBox(height: 8),
                    Text('UV'),
                    Text('4'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
