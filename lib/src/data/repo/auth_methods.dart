import 'dart:developer';
import 'package:asd/src/presentation/features/redeem/screens/succ.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//test@gmail.com qwe123
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "succ";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future checkCode({
    required String hotelName,
    required int amount,
    required int codeGet,
    required BuildContext context,
  }) async {
    try {
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      final int codeInt = int.parse(code);
      final dataCoin = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .get();
      var totalCoin = await dataCoin.get('coin');
      if (codeGet == codeInt) {
        totalCoin = (amount ~/ 10) + totalCoin;
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .update(
          {
            'coin': totalCoin,
          },
        );
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: Text('Code was correct and coins are added!'),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SuccPage(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: Text('Code was Wrong!'),
          ),
        );
      }
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
  }
}
