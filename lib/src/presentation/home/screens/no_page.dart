import 'package:Chai/src/misc/colors.dart';
import 'package:flutter/material.dart';

class NoPage extends StatelessWidget {
  const NoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mobileBackgroundColor,
        child: const Center(
          child: Text(
            "Comming soon",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
