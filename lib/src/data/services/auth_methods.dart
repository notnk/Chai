import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> fetchHotelNames() async {
    final data = _firebaseFirestore.collection('hotels').get();
    print(data);
  }

  Future<void> updateRatings({
    required final String hotelName,
    required final double userRating,
  }) async {
    final data =
        await _firebaseFirestore.collection('hotels').doc(hotelName).get();
    print(data);
    final oldRating = double.parse(
      data.get('rating'),
    );
    final int totalUser = int.parse(
      data.get('totalUser'),
    );
    final int rating =
        ((oldRating * totalUser) + userRating) ~/ (totalUser + 1);
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
        if (userCredential.additionalUserInfo!.isNewUser) {}
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
            return 'succ';
          }
        }
      }
    } catch (e) {
      log('this is the error ${e.toString()}');
    }
    return 'error';
  }
}
