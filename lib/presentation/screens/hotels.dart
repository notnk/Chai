import 'dart:ui';

import 'package:asd/data/colors.dart';
import 'package:asd/data/global_vars.dart';
import 'package:flutter/material.dart';

class RegisterHotels extends StatelessWidget {
  const RegisterHotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Register a new Hotel",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: hotelsName.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Column(
            children: [
              ListTile(
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("View Menu"),
                ),
                title: Center(
                  child: Text(
                    hotelsName[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
