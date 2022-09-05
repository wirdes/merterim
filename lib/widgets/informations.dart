import 'package:flutter/material.dart';

class Informations extends StatelessWidget {
  const Informations({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
      SizedBox(
        width: 50,
      ),
      Text(
        "MERT",
        style: TextStyle(fontSize: 75, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        "ERİM",
        style: TextStyle(
            fontSize: 75, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    ]);
  }
}
