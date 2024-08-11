import 'package:flutter/material.dart';

class OtherInfo extends StatelessWidget {
  final IconData icon ;
  final String txt;
  final String val;
  const OtherInfo({
    super.key,
   required this.icon,
    required this.txt,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Column(
          children: [
            Icon( icon,
              size: 45,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              txt,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const  SizedBox(
              height: 8,
            ),
            Text(
              val,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
  }
}

