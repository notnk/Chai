import 'dart:developer';
import 'package:Chai/src/data/models/coin_get_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/hotel_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<FBUser> getUserDetails({
    required final String hotelName,
  }) async {
    User currentUser = _auth.currentUser!;
    // print(currentUser.uid + hotelName);
    final documentSnapshot = await _firebaseFirestore
        .collection('users')
        .doc(currentUser.uid + hotelName)
        .get();

    return FBUser.fromSnap(documentSnapshot);
  }

  Future<Hotel> getHotelDetails({
    required final String hotelName,
  }) async {
    final documentSnapshot =
        await _firebaseFirestore.collection('hotels').doc(hotelName).get();

    return Hotel.fromSnap(documentSnapshot);
  }

  Future<void> updateRatings({
    required final String hotelName,
    required final double userRating,
  }) async {
    final data =
        await _firebaseFirestore.collection('hotels').doc(hotelName).get();
    final oldRating = double.parse(
      data.get('rating'),
    );
    final totalUser = double.parse(
      data.get('totalUser'),
    );
    final rating = ((oldRating * totalUser) + userRating) ~/ (totalUser + 1);
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set(
        {
          'rating': rating,
        },
      );
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set(
        {
          'totalUser': totalUser + 1,
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<int> getBalance({
    required String hotelName,
  }) async {
    try {
      final data = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .get();
      final int balance = int.parse(
        data.get('coins'),
      );
      return balance;
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return 0;
  }

  Future<String> signInWithGoogle() async {
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
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firebaseFirestore
              .collection('UserDetails')
              .doc(googleUser!.email)
              .set({
            'name': googleUser.displayName,
            'photoUrl': googleUser.photoUrl,
          });
        }
      }
      return 'succ';
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return 'error';
  }

  Future<String> checkCodeToAddCoin({
    required String hotelName,
    required int amount,
    required int codeGet,
  }) async {
    try {
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      var codeInt = int.parse(code);
      try {
        //if its not a new user
        final data = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalCoin = await data.get('coin');
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
          return 'succ';
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
        final data = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalCoin = await data.get('coin');
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
          return 'succ';
        }
      }
      return 'succ';
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
    return 'error';
  }

  Future<String> checkCodeToMinusCoin({
    required String hotelName,
    required int offerCoin,
    required int codeGet,
  }) async {
    try {
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      // var codeInt = int.parse(code);
      try {
        //if its not a new user
        final dataCoin = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalCoin = await dataCoin.get('coin');
        if (codeGet == code) {
          if (totalCoin - offerCoin >= 0) {
            int newCoin = totalCoin - offerCoin;
            await _firebaseFirestore
                .collection('users')
                .doc(_auth.currentUser!.uid + hotelName)
                .set(
              {
                'coin': newCoin,
              },
            );
            return 'succ';
          } else {
            return 'error';
          }
        }
      } catch (e) {
        log(e.toString());
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
        if (codeGet == code) {
          if (totalCoin - offerCoin >= 0) {
            await _firebaseFirestore
                .collection('users')
                .doc(_auth.currentUser!.uid + hotelName)
                .set(
              {
                'coin': totalCoin - offerCoin,
              },
            );
            return 'succ';
          } else {
            return 'error';
          }
        }
      }
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
    return 'error';
  }

  addVisits({
    required final String hotelName,
    required final int getCode,
  }) async {
    try {
      final data =
          await _firebaseFirestore.collection("hotels").doc(hotelName).get();
      final code = await data.get('code');
      var codeInt = int.parse(code);
      try {
        //if its not a new user
        final data = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalVisit = await data.get('visit');
        if (getCode == codeInt) {
          await _firebaseFirestore
              .collection('users')
              .doc(_auth.currentUser!.uid + hotelName)
              .set(
            {
              'visit': totalVisit + 1,
            },
          );
          return 'succ';
        }
      } catch (e) {
        //if new user
        await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .set(
          {
            'visit': 0,
          },
        );
        final data = await _firebaseFirestore
            .collection('users')
            .doc(_auth.currentUser!.uid + hotelName)
            .get();
        int totalVisit = await data.get('visit');
        if (getCode == codeInt) {
          await _firebaseFirestore
              .collection('users')
              .doc(_auth.currentUser!.uid + hotelName)
              .set(
            {
              'visit': totalVisit + 1,
            },
          );
          return 'succ';
        }
      }
      return 'succ';
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
    return 'error';
  }
}
