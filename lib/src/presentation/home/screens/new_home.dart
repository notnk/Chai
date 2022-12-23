import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/misc/global_vars.dart';
import 'package:flutter/material.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Tab"),
        centerTitle: true,
        // backgroundColor: mobileBackgroundColor,
      ),
      backgroundColor: mobileBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 400,
            child: ListTile(
              leading: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        imagesUrl[0],
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              title: const Text("HotelName"),
              trailing: IconButton(
                icon: const Icon(Icons.navigate_next_outlined),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
