import 'package:Chai/src/data/models/coin_get_model.dart';
import 'package:Chai/src/data/db_calls/auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewOffersPage extends StatefulWidget {
  final String hotelName;
  const NewOffersPage({super.key, required this.hotelName});

  @override
  State<NewOffersPage> createState() => _NewOffersPageState();
}

class _NewOffersPageState extends State<NewOffersPage> {
  getDetails() async {
    FBUser data =
        await AuthMethods().getUserDetails(hotelName: widget.hotelName);
    return data.coin;
  }

  final data = FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getDetails(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasError) {
            return const CircularProgressIndicator();
          } else {
            return Text('Coin: ${snapshot.data}');
          }
        },
      ),
    );
  }
}
