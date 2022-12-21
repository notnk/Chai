import 'package:asd/src/misc/colors.dart';
import 'package:flutter/material.dart';

class SuccPage extends StatefulWidget {
  final String hotelName;
  const SuccPage({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<SuccPage> createState() => _SuccPageState();
}

class _SuccPageState extends State<SuccPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Text("Tap to view balance"),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text("Tap to view balance"),
            ),
          ],
        ),
      ),
    );
  }
}
