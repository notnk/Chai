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

  Future<int> getBalance({
    required String hotelName,
  }) async {
    try {
      final data = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .get();
      final int balance = int.parse(data.get('coins'));
      return balance;
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return 0;
  }

  Future<String> signInWithGoogle(BuildContext context) async {
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
      return 'succ';
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return 'error';
  }

  Future<void> checkCodeToAddCoin({
    required String hotelName,
    required int amount,
    required int codeGet,
    required BuildContext context,
  }) async {
    try {
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      var codeInt = int.parse(code);
      try {
        //if its not a new user
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
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SuccPage(
                hotelName: hotelName,
              ),
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
        //if new user
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .set(
          {
            'coin': 0,
          },
        );
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
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SuccPage(
                hotelName: hotelName,
              ),
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
      }
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
  }

  Future<void> checkCodeToMinusCoin({
    required String hotelName,
    required int offerCoin,
    required int codeGet,
    required BuildContext context,
  }) async {
    try {
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      var codeInt = int.parse(code);
      try {
        //if its not a new user
        final dataCoin = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalCoin = await dataCoin.get('coin');
        if (codeGet == codeInt) {
          int newCoin = totalCoin - offerCoin;
          await _firebaseFirestore
              .collection('users')
              .doc(_auth.currentUser!.uid + hotelName)
              .set(
            {
              'coin': newCoin,
            },
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SuccPage(
                hotelName: hotelName,
              ),
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
        //if new user
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .set(
          {
            'coin': 0,
          },
        );
        final dataCoin = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalCoin = await dataCoin.get('coin');
        if (codeGet == codeInt) {
          if (totalCoin >= offerCoin) {
            await _firebaseFirestore
                .collection('users')
                .doc(_auth.currentUser!.uid + hotelName)
                .set(
              {
                'coin': totalCoin - offerCoin,
              },
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SuccPage(
                  hotelName: hotelName,
                ),
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
        }
      }
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
  }
}
