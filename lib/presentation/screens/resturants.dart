import 'package:asd/presentation/widgets/hotelListv2.dart';
import 'package:flutter/material.dart';

class Resturants extends StatelessWidget {
  const Resturants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resturants",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              title: Text("Sorted Based on"),
              trailing: Icon(Icons.sort_outlined),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
              ),
            ),
            listHotels(0),
            const SizedBox(
              height: 30,
            ),
            listHotels(1),
            const SizedBox(
              height: 30,
            ),
            listHotels(2),
            const SizedBox(
              height: 30,
            ),
            listHotels(3),
            const SizedBox(
              height: 30,
            ),
            listHotels(3),
            const SizedBox(
              height: 30,
            ),
            listHotels(3),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
