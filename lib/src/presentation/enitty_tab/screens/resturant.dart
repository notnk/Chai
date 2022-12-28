import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/misc/global_vars.dart';
import 'package:asd/src/presentation/enitty_tab/widgets/home_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewResturant extends StatefulWidget {
  final String hotelName;
  const NewResturant({super.key, required this.hotelName});

  @override
  State<NewResturant> createState() => _NewResturantState();
}

class _NewResturantState extends State<NewResturant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(widget.hotelName),
        // centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return NewHomeItems(
                hotelName: hotelsName[index],
                snap: snapshot.data!.docs[index].data(),
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}
