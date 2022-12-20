import 'dart:developer';
import 'package:asd/src/presentation/features/redeem/screens/succ.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../presentation/features/home/presentation/screens/dashboard.dart';

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

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {}
      }
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
        (route) => false,
      );
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future<void> checkCode({
    required String hotelName,
    required int amount,
    required int codeGet,
    required BuildContext context,
  }) async {
    try {
      // log(_auth.currentUser!.uid + hotelName);
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      var codeInt = int.parse(code);
      final dataCoin = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .get();
      int totalCoin = await dataCoin.get('coin');
      if (codeGet == codeInt) {
        totalCoin = (amount ~/ 10) + totalCoin;
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .set(
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
