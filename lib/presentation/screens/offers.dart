import 'package:asd/data/colors.dart';
import 'package:asd/data/global_vars.dart';
import 'package:asd/presentation/widgets/drawer_offers.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: mobileBackgroundColor,
        child: listItems(context),
      ),
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Offers",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: imagesUrl.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            width: double.infinity,
            child: Image.network(
              imagesUrl[index],
            ),
          );
        },
      ),
    );
  }
}