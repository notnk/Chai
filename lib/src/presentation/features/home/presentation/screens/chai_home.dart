import 'package:asd/src/presentation/features/home/presentation/widgets/hotelListv2.dart';
import 'package:flutter/material.dart';
import '../widgets/topListView.dart';

class ChaiScreen extends StatefulWidget {
  const ChaiScreen({Key? key}) : super(key: key);

  @override
  State<ChaiScreen> createState() => _ChaiScreenState();
}

class _ChaiScreenState extends State<ChaiScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 6,
                // color: Colors.white60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 5,
                  ),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
            const topListView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                title: const Text(
                  "Catagories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.orange[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const topListView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                title: const Text(
                  "Restaurants",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: InkWell(
                    onTap: () {}, child: const Icon(Icons.filter_alt_outlined)),
              ),
            ),
            // ListView.builder(
            //   itemCount: hotelsName.length,
            //   itemBuilder: (
            //     BuildContext context,
            //     int index,
            //   ) {
            //     return allHotels(context, index);
            //   },
            // ),
            // allHotels(context, index),
            listHotels(0),
            const SizedBox(
              height: 20,
            ),
            listHotels(1),
            listHotels(2),
            listHotels(3),
          ],
        ),
      ),
    );
  }
}
