import 'package:Chai/src/misc/colors.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final String hotelName;
  const Menu({super.key, required this.hotelName});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(widget.hotelName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text("item"),
          Text("item"),
          Text("item"),
          Text("item"),
          Text("item"),
        ],
      ),
    );
  }
}
