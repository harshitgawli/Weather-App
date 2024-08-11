import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForecastCard({
    super.key,
    required this.icon,
    required this.temperature,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return   Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        padding:const  EdgeInsets.all(10),
        child:  Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              temperature,

            ),
          ],
        ),
      ),
    );
  }
}
